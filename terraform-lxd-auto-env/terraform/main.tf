terraform {
  required_version = ">= 1.0.0"
  required_providers {
    lxd = {
      source  = "terraform-lxd/lxd"
      version = "~> 2.4.0"
    }
    null = {
      source  = "hashicorp/null"
      version = "~> 3.2.0"
    }
  }
}

provider "lxd" {
  generate_client_certificates = true
  accept_remote_certificate    = true
}

# 3台の LXD コンテナを作成
resource "lxd_container" "web" {
  count            = 3
  name             = "web-${count.index + 1}"
  image            = "ubuntu:22.04"
  start_container  = true
  wait_for_network = true
}

# コンテナ内部の Nginx インストール・個別ページ配置・Proxy デバイス設定
resource "null_resource" "setup" {
  count = 3

  depends_on = [lxd_container.web]

  triggers = {
    container_name = "web-${count.index + 1}"
  }

  provisioner "local-exec" {
    command = <<EOT
set -e

CONTAINER_NAME="web-${count.index + 1}"
PORT_NUM="808${count.index + 1}"

echo "=== Setting up $CONTAINER_NAME (Port: $PORT_NUM) ==="

# dpkg / apt のバックグラウンドロック解除を待機
for i in $(seq 1 30); do
  if lxc exec "$CONTAINER_NAME" -- fuser /var/lib/dpkg/lock-frontend >/dev/null 2>&1; then
    echo "Waiting for apt lock in $CONTAINER_NAME..."
    sleep 2
  else
    break
  fi
done

# Nginx のインストール
lxc exec "$CONTAINER_NAME" -- apt update -y
lxc exec "$CONTAINER_NAME" -- apt install -y nginx

# 各サーバーに応じた挨拶メッセージの設定
if [ ${count.index} -eq 0 ]; then
  MSG_JA="おはようございます、1番のサーバーです。"
  MSG_EN="Good morning, this is server 1."
  ACCENT_COLOR="#2e7d32"
elif [ ${count.index} -eq 1 ]; then
  MSG_JA="こんにちは、2番のサーバーです。"
  MSG_EN="Hello, this is server 2."
  ACCENT_COLOR="#1565c0"
else
  MSG_JA="こんばんは、3番のサーバーです。"
  MSG_EN="Good evening, this is server 3."
  ACCENT_COLOR="#c62828"
fi

# HTML ページの配置（ブラウザでの文字化け防止 & curl でも確認可能）
lxc exec "$CONTAINER_NAME" -- bash -c "cat << 'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html lang=\"ja\">
<head>
  <meta charset=\"UTF-8\">
  <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">
  <title>LXD Web Server ${count.index + 1}</title>
  <style>
    body {
      font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      margin: 0;
      background-color: #f4f6f8;
      color: #333;
    }
    .card {
      background: #ffffff;
      padding: 2.5rem 3rem;
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0,0,0,0.08);
      text-align: center;
      border-top: 8px solid $${ACCENT_COLOR};
      max-width: 480px;
      width: 85%;
    }
    h1 {
      color: $${ACCENT_COLOR};
      font-size: 1.6rem;
      margin-bottom: 0.5rem;
    }
    p.en {
      color: #666;
      font-size: 1.05rem;
      margin-top: 0;
    }
    .badge {
      display: inline-block;
      padding: 0.4rem 1rem;
      background: #eef2f6;
      border-radius: 20px;
      font-weight: 600;
      font-size: 0.9rem;
      margin-top: 1.2rem;
      color: #475569;
    }
  </style>
</head>
<body>
  <div class=\"card\">
    <h1>$${MSG_JA}</h1>
    <p class=\"en\">$${MSG_EN}</p>
    <div class=\"badge\">Container: $CONTAINER_NAME | Port: $PORT_NUM</div>
  </div>
</body>
</html>
EOF"

# LXD Proxy デバイスの設定（VMホストの 808X -> コンテナ内 80）
lxc config device remove "$CONTAINER_NAME" http >/dev/null 2>&1 || true
lxc config device add "$CONTAINER_NAME" http proxy listen=tcp:0.0.0.0:$PORT_NUM connect=tcp:127.0.0.1:80

echo "=== Completed setup for $CONTAINER_NAME ==="
EOT
  }
}
