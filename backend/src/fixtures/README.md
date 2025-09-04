# Episode Fixtures

このディレクトリには、エピソードデータのfixtureが含まれています。これらのfixtureは、開発、テスト、デモンストレーション目的で使用できます。

## 利用可能なFixture

### 開発用Fixture (`episodes.gleam`)

#### `development_episodes() -> List(Episode)`
Star Trek: Deep Space Nineの実際のエピソードデータを基にした15件のサンプルデータです。
- Season 1: 5 episodes
- Season 2: 5 episodes
- Season 3: 5 episodes

各エピソードには以下の情報が含まれます：
- 基本情報（シーズン、エピソード番号、タイトル）
- 日本語タイトル
- 重要度（1-5のスケール）
- Netflix IDと概要
- IMDb URL
- 登場キャラクターと重要度
- 登場組織と重要度

#### `test_episodes() -> List(Episode)`
テスト目的で使用するシンプルな2件のサンプルデータです。

### JSONエクスポート機能

#### `episodes_to_json(episodes: List(Episode)) -> String`
エピソードリストをJSON文字列に変換します。

#### `episode_to_json(episode: Episode) -> json.Json`
単一のエピソードをJSONオブジェクトに変換します。

## 使用例

### 開発データの投入

```gleam
import fixtures/episodes

// 開発用データを取得
let episodes = episodes.development_episodes()

// データベースに投入（migrate_episodes.gleamを使用）
migrate_episodes.migrate_episodes_to_postgres(episodes)
```

### JSONファイルの生成

```gleam
import fixtures/episodes
import simplifile

let episodes = episodes.development_episodes()
let json_content = episodes.episodes_to_json(episodes)

// JSONファイルを保存
simplifile.write("episodes_fixture.json", json_content)
```

### テストでの使用

```gleam
import fixtures/episodes

pub fn my_test() {
  let test_data = episodes.test_episodes()

  // テストロジック
  list.each(test_data, fn(episode) {
    // アサーションなど
  })
}
```

## データ構造

### Episode
```gleam
Episode(
  season: Int,              // シーズン番号
  episode: Int,             // エピソード番号
  title: String,            // 英語タイトル
  title_ja: Option(String), // 日本語タイトル
  importance: Int,          // 重要度 (1-5)
  netflix_id: Option(Int),  // Netflix ID
  netflix_synopsis: Option(String), // Netflix概要
  url_imdb: Option(String), // IMDb URL
  characters: List(Character),     // 登場キャラクター
  organizations: List(Organization) // 登場組織
)
```

### Character
```gleam
Character(
  name: String,  // キャラクター名
  contrast: Int  // 重要度 (1-5)
)
```

### Organization
```gleam
Organization(
  name: String,  // 組織名
  contrast: Int  // 重要度 (1-5)
)
```

## 拡張方法

新しいfixtureを追加する場合は：

1. `episodes.gleam`に新しい関数を追加
2. 適切なEpisodeレコードを作成
3. 必要に応じてテストを`episode_test.gleam`に追加

例：
```gleam
pub fn custom_episodes() -> List(Episode) {
  // カスタムfixtureの実装
}
```

## 注意事項

- 実際のNetflix IDとIMDb URLはサンプルとして使用しています
- 日本語タイトルは実際の翻訳を基にしています
- 重要度とcontrast値は主観的な評価です
- 本番環境では実際のデータを投入してください
