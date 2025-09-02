# Backend - Database Migration Scripts

このディレクトリには、Star Trek DS9エピソードデータのPostgreSQL移行スクリプトが含まれています。

## ファイル構成

- `migrate-episodes.js` - メインの移行スクリプト
- `package.json` - Node.js依存関係設定
- `package-lock.json` - 依存関係ロックファイル
- `node_modules/` - インストールされたnpmパッケージ

## 使用方法

### 移行スクリプト実行

```bash
cd /workspace/backend
node migrate-episodes.js
```

### 実行結果

- 173件のエピソードデータをPostgreSQLに移行
- 25件ごとに進捗を表示
- 実行時間: 約5-10秒

## 前提条件

- PostgreSQLコンテナが実行中 (`deep-space-nine-rta-chart-postgres-1`)
- `app/priv/static/episodes.json` が存在
- Docker Composeネットワークが有効

## 技術仕様

- **言語**: Node.js
- **ライブラリ**: pg (PostgreSQLクライアント)
- **接続方式**: Dockerサービス名 (`postgres`)
- **エラーハンドリング**: ON CONFLICT句による重複スキップ

## 関連ドキュメント

詳細はプロジェクトルートの `phase1-migration-plan.md` を参照してください。
