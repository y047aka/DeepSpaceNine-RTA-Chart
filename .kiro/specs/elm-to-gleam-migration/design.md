# Design Document

## Overview
ElmアプリケーションをGleamに移行するための技術設計。Lustrerフレームワークを使用してElmのThe Elm Architectureと同様の構成を維持し、既存の機能とUIを完全に再現する。

## Architecture Overview

### 1. Project Structure
```
gleam_ds9_chart/
├── gleam.toml              # プロジェクト設定
├── manifest.toml           # 依存関係管理
├── src/
│   ├── main.gleam         # エントリーポイント
│   ├── app.gleam          # メインアプリケーション
│   ├── types/
│   │   ├── episode.gleam  # Episode型定義
│   │   ├── character.gleam # Character型定義
│   │   └── organization.gleam # Organization型定義
│   ├── components/
│   │   ├── histogram.gleam      # 小さなヒストグラム
│   │   ├── large_histogram.gleam # 大きなヒストグラム
│   │   └── episode_table.gleam  # エピソードテーブル
│   ├── utils/
│   │   ├── color.gleam     # カラー計算
│   │   └── json_decoder.gleam # JSONデコード
│   └── styles/
│       └── main.css        # スタイルシート
├── priv/
│   └── static/
│       ├── episodes.js     # エピソードデータ
│       └── index.html      # HTMLテンプレート
└── test/
    └── app_test.gleam      # テスト
```

## 2. Technology Stack

### Core Technologies
- **Gleam**: メイン言語（JavaScriptターゲット）
- **Lustre**: UIフレームワーク（Elm Architectureライク）
- **gleam_json**: JSONデコード
- **gleam_javascript**: JS相互運用

### Development Tools
- **Gleam CLI**: ビルドとテスト
- **esbuild**: バンドル（Lustereが内蔵）
- **Live Server**: 開発サーバー

## 3. Data Model Design

### Episode Type
```gleam
pub type Episode {
  Episode(
    season: Int,
    episode: Int,
    title: String,
    title_ja: String,
    importance: Int,
    netflix_id: Int,
    characters: List(NameAndContrast),
    organizations: List(NameAndContrast)
  )
}

pub type NameAndContrast {
  NameAndContrast(name: String, contrast: Int)
}
```

### Character Type
```gleam
pub type Character {
  BenjaminSisko | JakeSisko | Dax | KiraNerys | MilesObrien |
  Bashir | Odo | Quark | Worf | Rom | Nog | Garak | Dukat |
  KeikoObrien | Winn | Bareil | MichaelEddington | KasidyYates |
  Leeta | Gowron | Martok | Shakaar | Ziyal | Damar
}
```

### Organization Type
```gleam
pub type Organization {
  Federation | Trill | Bajor | Prophet | Cardassia |
  Ferengi | Klingon | Maquis | Dominion | MirrorUniverse
}
```

## 4. Application State Management

### Model Design
```gleam
pub type Model {
  Model(episodes: List(Episode), after_season4: Bool)
}
```

### Message Design
```gleam
pub type Msg {
  Toggle
}
```

### Update Function Design
```gleam
pub fn update(msg: Msg, model: Model) -> #(Model, Effect(Msg)) {
  case msg {
    Toggle -> #(Model(..model, after_season4: !model.after_season4), effect.none())
  }
}
```

### Initialization Design
```gleam
pub fn init(_flags) -> #(Model, Effect(Msg)) {
  let episodes = case decode_episodes_from_js() {
    Ok(eps) -> eps
    Error(_) -> []
  }
  #(Model(episodes: episodes, after_season4: False), effect.none())
}
```

## 5. Component Architecture

### 5.1 Large Histogram Component
**Purpose**: Deep Space Nine全体データの大きなヒストグラム表示

**Interface**:
```gleam
pub fn large_histogram_view(
  title: String,
  image_hue: Int,
  episodes: List(SeasonImportance)
) -> Element(Msg)
```

**Implementation Approach**:
- CSS Gridを使用した7列レイアウト
- シーズンごとのグループ化
- 色相ベースのカラーパレット適用

### 5.2 Small Histogram Component
**Purpose**: キャラクター/組織別の小さなヒストグラム

**Interface**:
```gleam
pub fn histogram_view(
  hue: Int,
  episodes: List(SeasonImportance)
) -> Element(Msg)
```

**Implementation Approach**:
- 各シーズンを列として配置
- importance値による明度調整
- レスポンシブなグリッドサイズ

### 5.3 Episode Table Component
**Purpose**: エピソード詳細テーブル

**Interface**:
```gleam
pub fn episode_table_view(episodes: List(Episode)) -> Element(Msg)
```

**Implementation Approach**:
- Season-Episode、Importance、Title列
- インポータンス円表示
- ホバー効果
- Netflixリンク付きポップオーバー

## 6. Styling Architecture

### 6.1 CSS Architecture
**Approach**: 外部CSSファイルを使用（elm-cssからの移行）

**File Structure**:
```css
/* styles/main.css */
:root {
  --bg-color: hsl(0, 0%, 10%);
  --text-color: hsl(0, 0%, 60%);
  --hover-bg: hsl(0, 0%, 15%);
}

body { /* グローバルスタイル */ }
.histogram-grid { /* ヒストグラムグリッド */ }
.episode-table { /* エピソードテーブル */ }
.importance-circle { /* 重要度円 */ }
```

### 6.2 Responsive Design
- vw単位を使用したレスポンシブサイズ
- CSS Gridによる柔軟なレイアウト
- min()関数を使用した適応的サイズ

### 6.3 Color System
```gleam
pub fn step_by_importance(importance: Int) -> Float {
  case importance {
    i if i > 3 -> 0.8
    i if i > 2 -> 0.5
    _ -> 0.3
  }
}

pub fn hsl_color(hue: Int, importance: Int) -> String {
  let lightness = step_by_importance(importance)
  "hsl(" <> int.to_string(hue) <> ", 80%, " <> 
  float.to_string(lightness * 100.0) <> "%)"
}
```

## 7. Data Processing Design

### 7.1 JSON Decoding
```gleam
import gleam/json
import gleam/dynamic

pub fn decode_episodes() -> Result(List(Episode), json.DecodeError) {
  json.decode(
    dynamic.list(decode_episode),
    episodes_json_string
  )
}

fn decode_episode() -> dynamic.Decoder(Episode) {
  dynamic.decode8(
    Episode,
    dynamic.field("season", dynamic.int),
    dynamic.field("episode", dynamic.int),
    dynamic.field("title", dynamic.string),
    dynamic.field("title_ja", dynamic.string),
    dynamic.field("importance", dynamic.int),
    dynamic.field("netflix_id", dynamic.int),
    dynamic.field("characters", dynamic.list(decode_name_and_contrast)),
    dynamic.field("organizations", dynamic.list(decode_name_and_contrast))
  )
}
```

### 7.2 Character/Organization Filtering
```gleam
pub fn get_character_episodes(
  character: Character,
  episodes: List(Episode)
) -> List(SeasonImportance) {
  episodes
  |> list.map(fn(ep) {
    let contrast = ep.characters
    |> list.find(fn(c) { c.name == character_to_string(character) })
    |> result.map(fn(c) { c.contrast })
    |> result.unwrap(0)
    
    SeasonImportance(season: ep.season, importance: contrast)
  })
}
```

## 8. Performance Optimizations

### 8.1 Lazy Evaluation
```gleam
// 必要に応じてLustre's lazy rendering使用
import lustre/element/lazy

lazy.lazy2(histogram_view, hue, episodes)
```

### 8.2 Efficient Data Structures
- Listの代わりにSetを使用（該当する場合）
- パターンマッチングによる効率的な分岐
- Gleamのコンパイル時最適化活用

### 8.3 Bundle Optimization
- 未使用コードの自動除去（Gleamコンパイラ）
- CSS最小化
- 静的アセットの最適化

## 9. Build and Development Environment

### 9.1 gleam.toml Configuration
```toml
name = "ds9_chart"
version = "1.0.0"
gleam = ">= 1.0.0"
target = "javascript"

[dependencies]
gleam_stdlib = ">= 0.34.0"
lustre = ">= 4.0.0"
gleam_json = ">= 1.0.0"
gleam_javascript = ">= 0.8.0"

[dev-dependencies]
gleeunit = ">= 1.0.0"
```

### 9.2 Development Workflow
```bash
# 開発サーバー起動
gleam run -m lustre/dev start

# ビルド
gleam build

# テスト実行
gleam test

# 本番ビルド
gleam export javascript-prelude && gleam build
```

### 9.3 Hot Reload Setup
- Lustereの内蔵開発サーバー使用
- ファイル変更の自動検出
- ブラウザ自動リロード

## 10. Migration Strategy

### 10.1 Phase 1: Project Setup
1. Gleamプロジェクト初期化
2. 依存関係設定
3. 基本的なプロジェクト構造作成

### 10.2 Phase 2: Data Layer
1. 型定義の作成
2. JSONデコーダー実装
3. データ変換ロジック

### 10.3 Phase 3: Core Components
1. ヒストグラムコンポーネント
2. テーブルコンポーネント
3. メインレイアウト

### 10.4 Phase 4: Styling & Polish
1. CSS移行
2. レスポンシブ対応
3. 最終調整

## 11. Testing Strategy

### 11.1 Unit Tests
```gleam
import gleeunit
import gleeunit/should

pub fn character_filtering_test() {
  let episodes = [/* test data */]
  let result = get_character_episodes(BenjaminSisko, episodes)
  
  result
  |> should.be_ok()
  |> should.equal([/* expected result */])
}
```

### 11.2 Integration Tests
- JSONデコード結果の検証
- UI コンポーネントの描画テスト
- 状態管理の動作確認

## 12. Error Handling

### 12.1 JSON Decode Errors
```gleam
case decode_episodes() {
  Ok(episodes) -> episodes
  Error(decode_error) -> {
    // ログ出力とフォールバック
    io.println("Failed to decode episodes: " <> string.inspect(decode_error))
    []
  }
}
```

### 12.2 Runtime Error Handling
- Result型による安全なエラーハンドリング
- ユーザーフレンドリーなエラーメッセージ
- グレースフルデグラデーション

## 13. Deployment Considerations

### 13.1 Static Asset Handling
- episodes.jsの適切な配置
- 画像アセットの最適化
- CDN配信の考慮

### 13.2 Browser Compatibility
- ES2018+対応（Gleamの出力）
- モダンブラウザのCSS機能使用
- プログレッシブエンハンスメント

## 14. Future Enhancements

### 14.1 Potential Improvements
- Web Componentsサポート
- PWA機能
- パフォーマンス監視

### 14.2 Maintenance Considerations
- Gleam/Lustereのアップデート対応
- 型安全性によるリファクタリング容易性
- テストカバレッジの維持