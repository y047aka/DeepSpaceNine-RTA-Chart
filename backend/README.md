# Backend - Gleam Database Migration

このディレクトリには、Star Trek DS9エピソードデータのPostgreSQL移行スクリプトがGleamで実装されています。

## ファイル構成

- `src/migrate_episodes.gleam` - メインの移行スクリプト
- `src/types/episode.gleam` - エピソードデータ型定義
- `gleam.toml` - Gleamプロジェクト設定
- `init.sql` - データベース初期化スクリプト

## 使用方法

### 移行スクリプト実行

```bash
cd /workspace/backend
gleam run
```

### 実行結果

- 173件のエピソードデータをPostgreSQLに移行
- 25件ごとに進捗を表示
- 実行時間: 約3-5秒
- JSONB形式でキャラクター・組織データを保存

## 前提条件

- PostgreSQLコンテナが実行中 (`deep-space-nine-rta-chart-postgres-1`)
- `app/priv/static/episodes.json` が存在
- Docker Composeネットワークが有効

## 技術仕様

- **言語**: Gleam
- **ライブラリ**: Pog (PostgreSQLクライアント)
- **接続方式**: Dockerサービス名 (`postgres`)
- **データ保存**: JSONB形式による構造化データ
- **エラーハンドリング**: Result型による堅牢な処理
- **型安全**: コンパイル時型チェック

## 機能

- ✅ 完全なJSONパース (137KBファイル処理)
- ✅ PostgreSQL接続プール管理
- ✅ パラメータ化クエリ (SQLインジェクション対策)
- ✅ JSONB形式でのキャラクター・組織データ保存
- ✅ GINインデックスによる高速検索
- ✅ プログレス表示とエラーハンドリング

## 関連ドキュメント

詳細はプロジェクトルートの `phase1-migration-plan.md` を参照してください。
