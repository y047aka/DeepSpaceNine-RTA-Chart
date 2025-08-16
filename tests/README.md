# Visual Regression Testing (VRT) with Playwright

このディレクトリには、DS9エピソード分析アプリケーションのVisual Regression Testing（VRT）設定とテストが含まれています。

## 概要

VRTは、アプリケーションの視覚的な変更を自動的に検出するテスト手法です。画面のスクリーンショットを取得し、ベースライン画像と比較することで、意図しないデザインの変更やレグレッションを検出します。

## テスト構成

### ディレクトリ構造

```
tests/
├── vrt/
│   ├── components/          # コンポーネント単位のVRTテスト
│   │   ├── histogram.spec.js
│   │   └── episode-display.spec.js
│   ├── pages/              # ページ全体のVRTテスト
│   │   └── main-page.spec.js
│   └── responsive/         # レスポンシブデザインのVRTテスト
│       └── responsive-design.spec.js
├── global-setup.js         # グローバルセットアップ
└── README.md              # このファイル
```

### テストカテゴリ

1. **コンポーネントテスト**: 個別のUIコンポーネントの視覚的テスト
2. **ページテスト**: アプリケーション全体の視覚的テスト
3. **レスポンシブテスト**: 異なる画面サイズでの表示テスト

## 使用方法

### ローカル開発

```bash
# 依存関係のインストール
npm install

# Playwrightブラウザのインストール
npm run install:playwright

# アプリケーションのビルドと起動
npm run start

# 別のターミナルでVRTテストを実行
npm run test:vrt

# ベースライン画像の更新
npm run test:vrt:update

# テストをUIモードで実行（デバッグ用）
npm run test:vrt:ui

# デバッグモードでテストを実行
npm run test:vrt:debug
```

### ベースライン画像の管理

初回テスト実行時、またはデザインの意図的な変更後は、ベースライン画像を更新する必要があります：

```bash
npm run test:vrt:update
```

この操作により、現在の画面状態を新しいベースライン画像として保存します。

## ブラウザサポート

VRTテストは以下のブラウザで実行されます：

- **Chromium** (Google Chrome相当)
- **Firefox**
- **WebKit** (Safari相当)
- **Mobile Chrome** (Pixel 5)
- **Mobile Safari** (iPhone 12)

## レスポンシブテスト

以下の画面サイズでテストを実行します：

- **Mobile**: 375x667 (iPhone SE相当)
- **Tablet**: 768x1024 (iPad相当)
- **Desktop**: 1280x720 (標準デスクトップ)
- **Large Desktop**: 1920x1080 (大型デスクトップ)

## CI/CDでの実行

GitHub Actionsにより、プルリクエスト時とメインブランチへのプッシュ時に自動的にVRTテストが実行されます。

### テスト失敗時の対応

1. **意図的な変更**: デザインの更新が意図的な場合は、ベースライン画像を更新
2. **意図しない変更**: コードの修正が必要

失敗時は、GitHub Actionsのアーティファクトから差分画像とレポートをダウンロードできます。

## 設定ファイル

- `playwright.config.js`: Playwrightの主要設定
- `package.json`: NPMスクリプトと依存関係
- `.github/workflows/test.yml`: CI/CD設定

## トラブルシューティング

### よくある問題

1. **ブラウザが見つからない**: `npm run install:playwright`を実行
2. **アプリケーションが起動しない**: `npm run build`でGleamアプリケーションをビルド
3. **タイムアウトエラー**: ネットワーク接続またはアプリケーションの起動時間を確認

### デバッグ

```bash
# UIモードでテストを実行（ブラウザで実際の動作を確認）
npm run test:vrt:ui

# 特定のテストファイルのみ実行
npx playwright test tests/vrt/pages/main-page.spec.js

# ヘッドレスモードを無効にしてブラウザを表示
npx playwright test --headed
```

## 開発ガイドライン

### 新しいVRTテストの追加

1. 適切なディレクトリ（components/pages/responsive）にテストファイルを作成
2. 意味のあるテスト名を使用
3. 要素の読み込み完了を適切に待機
4. 複数のセレクタで要素を検索（堅牢性のため）

### ベストプラクティス

- アニメーションが完了するまで待機
- 一意で安定したセレクタを使用
- 過度に細かいテストは避ける
- レスポンシブデザインを考慮

## 参考資料

- [Playwright公式ドキュメント](https://playwright.dev/)
- [Visual Testing Guide](https://playwright.dev/docs/test-screenshots)
- [Best Practices](https://playwright.dev/docs/best-practices)