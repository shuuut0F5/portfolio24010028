# Shuto Fukuda Portfolio

[![GitHub Pages](https://img.shields.io/badge/GitHub%20Pages-Live%20Demo-brightgreen?logo=github)](https://shuuut0f5.github.io/portfolio24010028/)
[![HTML5](https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white)](https://developer.mozilla.org/ja/docs/Web/HTML)
[![CSS3](https://img.shields.io/badge/CSS3-1572B6?logo=css3&logoColor=white)](https://developer.mozilla.org/ja/docs/Web/CSS)
[![JavaScript](https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black)](https://developer.mozilla.org/ja/docs/Web/JavaScript)
[![Terraform](https://img.shields.io/badge/Terraform-7B42BC?logo=terraform&logoColor=white)](https://www.terraform.io/)
[![Ansible](https://img.shields.io/badge/Ansible-EE0000?logo=ansible&logoColor=white)](https://www.ansible.com/)
[![Docker](https://img.shields.io/badge/Docker-2496ED?logo=docker&logoColor=white)](https://www.docker.com/)
[![Linux](https://img.shields.io/badge/Linux-FCC624?logo=linux&logoColor=black)](https://www.linux.org/)

さいたまIT・WEB専門学校で学ぶインフラエンジニア志望、**福田 修斗（Shuto Fukuda）** のポートフォリオサイトのリポジトリです。  
自己紹介、専門学校での4年間の学習カリキュラム（Study）、Terraform・Ansible・Docker・Linuxを活用したインフラ構築実績（Works）、およびお問い合わせフォームを1ページに集約しています。

🌐 **公開サイト (GitHub Pages)**: [https://shuuut0f5.github.io/portfolio24010028/](https://shuuut0f5.github.io/portfolio24010028/)

---

## 📑 ページ構成

本ポートフォリオサイト（`index.html`）は、以下のセクションで構成されています。

### 1. Home (`#home`)
ファーストビュー。氏名、志望職種（インフラエンジニア志望）、在籍校（さいたまIT・WEB専門学校）を表示します。

### 2. About (`#about`)
- **プロフィール**: 2005年生まれ、埼玉県出身・在住。特にLinuxへの興味と、ローカル環境でのIaC検証の取り組みを紹介。
- **志望職種**: インフラエンジニア（サーバー・ネットワークの構築／運用）。
- **主要技術スタック**: Linux, Terraform, Ansible, Docker, Infrastructure as Code。
- **入社後に活かせる強み**: 自走力とトラブル解決力、インフラ自動化の推進力、継続的な学習意欲。

### 3. Study (`#study`)
専門学校（4年制）における年次別の履修内容・カリキュラムをタブ切り替えで掲載しています。インフラ志望に直結する科目を視覚的にハイライトし、各科目で習得した技術タグを明記しています。
- **1年次（14科目）**: ネットワーク基礎（OSI参照モデル・機器・プロトコル）、Linux、情報セキュリティ、Python、Web基礎、PM基礎など
- **2年次（15科目）**: サーバー構築、クラウド基礎（AWS）、データベース（MySQL）、プログラミング実践など
- **3年次**: 応用システム開発、インフラ設計・運用演習、チーム開発演習
- **4年次**: 卒業制作、高度なインフラアーキテクチャ設計・自動化検証

### 4. Works (`#works`)
実機検証を行った2つの実践的なインフラ構築プロジェクトを掲載しています。カードをクリックすることでモーダルが開き、詳細な構成図、主要コード、手順、トラブルシューティング、成果と学びを確認できます。

| プロジェクト | 主要技術 | 構成・概要 |
| :--- | :--- | :--- |
| **Terraform × LXD**<br>軽量コンテナ環境構築 | Terraform, LXD/LXC, HAProxy, Nginx, Ubuntu 22.04 LTS | LXD上にUbuntuコンテナを3台構築し、HAProxyでラウンドロビン負荷分散を行うWebクラスタ構成。同梱の `terraform-lxd-auto-env/` により、`vagrant up` 1コマンドで完全再現可能。 |
| **Docker × Ansible**<br>マルチコンテナWebスタック自動構築・検証 | Docker, Docker Compose, Ansible, Nginx, PHP-FPM, MySQL, Redis | Nginx・PHP-FPM・MySQL・Redisの4層マルチコンテナ構成。Ansibleによる環境構築・プロビジョニング・デプロイ自動化を実施。 |

#### モーダル内のコンテンツ構成
- **基本仕様**: 主要技術、インフラ規模、負荷分散/構成管理方式、動作環境
- **動作結果**: 構築後のアクセス検証結果、curlによる負荷分散確認、ステータス確認ログ
- **プロジェクト概要**: 目的・背景、システムアーキテクチャ図（SVGダイアグラム）
- **環境（Environment）**: ホストOS、仮想化環境、ソフトウェアバージョン
- **工夫と実装ポイント**: 設計思想、セキュリティ・パフォーマンスへの配慮
- **主要な構成ファイル**: `main.tf`、`playbook.yml`、`docker-compose.yml` 等の実装コード（シンタックスハイライト・コピー機能付き）
- **構築・デプロイメント手順**: ゼロからのセットアップ〜検証までの詳細ステップ
- **トラブルシューティング**: 構築中に直面した実際のエラー（ポート競合、パーミッション、ヘルスチェック等）と根本原因・解決策
- **成果サマリー & 学び**: 得られた定量的・定性的成果、今後の展望

### 5. Contact (`#contact`)
Formspree API と連携した非同期お問い合わせフォームです。入力バリデーション、送信ローディング、送信成功・エラー時のインラインメッセージ表示に対応しています。

---

## 💡 機能・特徴

- **モダンでレスポンシブなUI/UX**:
  - スマートフォン、タブレット、デスクトップの全画面幅に最適化したレスポンシブデザイン
  - 固定ヘッダーナビゲーションによるスムーズスクロール移動
  - スタイリッシュなダークトーンと視認性の高いタイポグラフィ（Google Fonts: Zen Kaku Gothic New, Playfair Display, Fira Code, Lato）
- **詳細モーダル & ディープリンク**:
  - プロジェクトカードからモーダルを素早く展開（背景クリック、閉じるボタン、`Esc` キーでの終了対応）
  - カード上の「動作結果を見る」ボタンから、モーダル内の該当タブへ直接遷移可能
  - モーダル下部に「作品一覧に戻る」ボタンを配置
- **コードブロックの利便性**:
  - 構成ファイルやコマンドブロックの右上に「コピー」ボタンを設置（クリップボードへのワンクリックコピー）
- **OGP & アクセス解析**:
  - Twitter Card / OGP（Open Graph Protocol）に完全対応し、SNSシェア時の適切なサムネイル（`images/ogp.png`）表示を実現
  - Google Analytics 4 (GA4) によるアクセス解析タグを導入済み

---

## 📁 ディレクトリ構成

```text
portfolio24010028-main/
├── index.html                  # ポートフォリオサイト本体（HTML / JavaScript）
├── style.css                   # スタイルシート（レイアウト・デザイン・モーダル）
├── images/
│   └── ogp.png                 # OGPシェア用サムネイル画像 (1200×630)
├── terraform-lxd-auto-env/     # Works #1「Terraform × LXD」自動構築・再現環境
│   ├── Vagrantfile             # Ubuntu 22.04 LTS 仮想マシン定義
│   ├── README.md               # 1コマンド自動構築の詳細ドキュメント
│   ├── provision/              # Ansible 構成管理（LXD・HAProxy・自動化タスク）
│   │   ├── playbook.yml
│   │   └── roles/
│   └── terraform/              # Terraform インフラ定義
│       └── main.tf
├── Terraform/                  # プロトタイプ制作物・フェーズ別技術検証アーカイブ
│   ├── prototype_index.html
│   ├── prototype_portfolio*.html
│   ├── tf*.html
│   └── README.project.md
└── README.md                   # 本ドキュメント
```

---

## 🚀 ローカルでの閲覧・起動方法

### ポートフォリオサイト（Webページ）の確認
ビルド環境（Node.js等）や依存パッケージのインストールは不要です。

1. **ブラウザで直接開く**:
   `index.html` をダブルクリックするか、お好みのブラウザ（Google Chrome, Edge 等）にドラッグ＆ドロップしてください。

2. **ローカルHTTPサーバーで起動する（推奨）**:
   本ディレクトリで以下のコマンドを実行し、ブラウザで `http://localhost:8000` にアクセスします。
   ```bash
   # Python 3 の場合
   python -m http.server 8000
   ```

---

## 🛠️ インフラ環境の動作再現 (Works #1: terraform-lxd-auto-env)

Works #1 で紹介している「Terraform × LXD による 3台Webクラスタ + HAProxy 負荷分散環境」は、ホスト環境を汚さず **`vagrant up` 1コマンドのみで完全自動再現** できるように設計されています。

### 前提条件
- [VirtualBox](https://www.virtualbox.org/) がインストールされていること
- [Vagrant](https://www.vagrantup.com/) がインストールされていること

### 起動・検証手順
```bash
# 1. 検証用ディレクトリに移動
cd terraform-lxd-auto-env

# 2. 仮想マシン起動 & 自動プロビジョニング実行
vagrant up
```
> ※ VM内部で自動的に Ansible が走り、LXD初期化、Terraform によるコンテナ3台構築、HAProxyのバランシング設定まで全自動で完了します。

### 動作確認
起動完了後、ホストマシンのブラウザまたはターミナルからアクセスして動作を確認できます。

```bash
# HAProxy 経由のアクセス（ラウンドロビンでレスポンスが循環）
curl http://192.168.56.10:8080

# 各コンテナへの直接アクセス検証
curl http://192.168.56.10:8081  # web-1
curl http://192.168.56.10:8082  # web-2
curl http://192.168.56.10:8083  # web-3
```

環境停止・破棄:
```bash
vagrant destroy -f
```
※詳細は [`terraform-lxd-auto-env/README.md`](terraform-lxd-auto-env/README.md) をご参照ください。

---

## 🔧 技術スタック一覧

| カテゴリ | 技術・ツール |
| :--- | :--- |
| **フロントエンド** | HTML5, CSS3, JavaScript (ES6+ Vanilla), Google Fonts |
| **IaC / 構成管理** | Terraform (v1.x), Ansible |
| **仮想化 / コンテナ** | Docker, Docker Compose, LXD / LXC, Vagrant, VirtualBox |
| **サーバー / MW** | Linux (Ubuntu 22.04 LTS), Nginx, HAProxy, PHP-FPM, MySQL, Redis |
| **ネットワーク / その他** | TCP/IP, HTTP/HTTPS, OSI参照モデル, Git / GitHub |
| **外部連携・ホスティング** | GitHub Pages, Formspree (お問い合わせフォーム), Google Analytics 4 |

---

## 👤 作者情報

- **氏名**: 福田 修斗 (Shuto Fukuda)
- **所属**: さいたまIT・WEB専門学校（高度専門士情報技術科）
- **ポートフォリオ**: [https://shuuut0f5.github.io/portfolio24010028/](https://shuuut0f5.github.io/portfolio24010028/)
- **GitHub**: [@shuuut0f5](https://github.com/shuuut0f5)
- **お問い合わせ**: サイト内 [Contact フォーム](https://shuuut0f5.github.io/portfolio24010028/#contact) よりお願いいたします。
