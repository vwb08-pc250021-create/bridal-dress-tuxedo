# ZIPで保存する

開発セットは [こちらのZIP](downloads/bridal-admin-dev.zip) にまとめています。GitHubでZIPを開き、Download raw file（ダウンロードアイコン）から保存できます。

# ブライダル診断システム：管理者メニュー開発セット

## 1. 画面だけ見る

ZIPを「すべて展開」して、展開先の一番上にある `admin-menu-preview.html` をブラウザで開きます。ZIPの中から直接開かないでください。

Spring Boot用の `src/main/resources/templates/admin/menu.html` も、展開後は直接開けるようにCSSとJavaScriptの相対パスに対応しています。フォルダー構成を保ってください。DB・Javaの起動は不要です。「閉じる」の修正版を含みます。

## 2. Spring Bootで開発する

必要なもの：JDK 21（JREのみでは不可）、Maven 3.9以上。IDEではこのフォルダーのpom.xmlをMavenプロジェクトとして開いてください。

```sh
mvn test
mvn spring-boot:run
```

ブラウザで `http://localhost:8080/bridal/admin/` を開きます。

実行用JARを作る場合：

```sh
mvn package
java -jar target/bridal-diagnosis-0.0.1-SNAPSHOT.jar
```

HTML: src/main/resources/templates/admin/menu.html
CSS: src/main/resources/static/css/admin-menu.css
JavaScript: src/main/resources/static/js/admin-menu.js
Java: src/main/java/jp/bridal/admin/AdminMenuController.java

## 3. MySQL開発環境

必要なもの：Docker Desktop（またはDocker EngineとComposeプラグイン）。
`.env.example` を `.env` にコピーし、MYSQL_PASSWORD と MYSQL_ROOT_PASSWORD に自分の開発用パスワードを設定します。値は同梱していません。

```sh
docker compose up -d --wait
```

初回起動時に bridal データベースと、基本設計書の管理機能に関連する stores / users テーブルを作成します。シーケンスはMySQLのAUTO_INCREMENTに置き換えています。システム全体の全テーブルは含みません。DBは空で、ログインアカウントも作成しません。

接続先：localhost:3306 / データベース bridal / ユーザー bridal_app。
ポート使用中の場合は.envのMYSQL_PORTを変更してください。接続確認：

```sh
docker compose exec mysql mysql -u bridal_app -p bridal
```

パスワード入力後に `SHOW TABLES;` を実行してください。
停止は `docker compose down`。データはDockerのボリュームに保持されます。初期SQLは空のデータ領域での初回起動時にだけ実行されます。SQL変更は既存DBへ自動反映しません。

## 4. 後からDBをつなぐとき

現在のメニューはサンプル表示です。MySQL公式JDBCドライバーはpom.xmlに導入済みですが、DBへの実接続・取得・更新はまだ実装していません。
`database/connection-example.properties` は今後接続を実装するときの参考設定です。アプリはこのファイルを読み込みません。JDBC機能の追加と会員管理実装が必要です。
認証・権限チェック、会員一覧や各メニューの遷移先も未実装で、開発用プレビューとして利用してください。

## 5. 検証範囲

Spring Bootのビルドと既存テスト、ブラウザ表示・メニューダイアログ操作を検証しています。
MySQLのCompose設定と初期SQLを同梱していますが、このクラウドでMySQLコンテナーを起動しての検証は行っていません。
Java/Maven/Docker本体やダウンロード済み依存キャッシュ、DB実データはZIPに含みません。初回ビルドとDockerイメージ取得にはインターネット接続が必要です。
