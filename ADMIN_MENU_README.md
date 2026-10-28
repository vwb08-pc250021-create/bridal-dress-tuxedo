# システム管理者用メニュー（1-3-1-4）

Java 21 / Spring Boot 3.5.7 / Maven 3.9以上。

```sh
mvn test
mvn spring-boot:run
```

`http://localhost:8080/bridal/admin/` で表示します。クラウド環境でのビルドは以下を使用します（HTTPプロキシ設定を利用）。

```sh
JAVA_HOME=/workspace/tools/jdk21 /workspace/tools/apache-maven-3.9.11/bin/mvn -s /workspace/tools/maven-settings.xml -Djavax.net.ssl.trustStore=/etc/ssl/certs/java/cacerts -Dmaven.repo.local=/workspace/.m2/repository test package
/workspace/tools/jdk21/bin/java -jar target/bridal-diagnosis-0.0.1-SNAPSHOT.jar
```

添付「システム管理者.html」の最初の画面を抽出し、配色・カード・通知を維持し、PC向けの最大幅1280px、横並びナビゲーション、3列メニューと右側通知のレイアウトに調整しています。画面幅に応じてタブレット・スマートフォン向けに再配置します。CSS・JavaScript・テンプレートは分割してあるため、後から個別に変更できます。

基本設計書の必須機能は会員一覧への入口です。会員一覧自体は今回の対象外で、クリックすると案内を表示します。デザインにある店舗・スタッフ・レポート・セキュリティ・設定も未実装の案内を表示します。件数、通知、admin名、端末ステータスは参考表示です。

DBはMySQLを採用する前提で公式JDBCドライバーを導入済みです。このメニューにはDB取得要件がないため接続は行いません。会員管理実装時にMySQLの接続設定・データ取得・認証済み利用者との連携を追加してください。設計書にあるOracleのシーケンスはMySQLのAUTO_INCREMENT等に読み替える必要があります。現時点で接続・テーブル作成・実データ取得は未実装です。

本画面は開発用プレビューです。ログイン・権限チェックは未実装で、公開運用の前にサーバー側のシステム管理者認証・セッション連携が必要です。既定では127.0.0.1にのみバインドします。
