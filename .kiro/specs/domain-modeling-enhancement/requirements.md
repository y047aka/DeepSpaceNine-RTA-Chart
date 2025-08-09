# Requirements Document

## Introduction
Deep Space Nineドメインモデルの改善により、現在のJSON表示アプリケーションを高機能化に対応可能な構造へ再設計する。Character、Organization、Role、Species型の導入により、ドメイン固有の概念を適切に表現し、型安全性を向上させ、将来の機能拡張に対応する。実装の各工程は、t_wadaさんのTDDに倣った手順で計画する

## Requirements

### Requirement 1: Role型の導入と型安全な役職管理
**User Story:** 開発者として、キャラクターの役職（艦隊司令官、医師、保安主任等）を型安全に表現できるRole型を導入したい。これにより、現在hardcodedされている色分けロジックを型安全な構造に改善し、将来の機能拡張を容易にする。

#### Acceptance Criteria
1. WHEN アプリケーションが起動する THEN システムは Gleam の Custom Type として Role 型を定義している SHALL
2. WHEN Role型が定義される THEN システムは Starfleet の主要な役職（Command、Engineering、Security、Science、Medical、Operations）をサポートしている SHALL
3. WHEN Role型が定義される THEN システムは Bajoran、Cardassian、Klingon、Ferengi の役職体系もサポートしている SHALL
4. IF キャラクターにRole型が関連付けられている THEN システムは適切な色分け（hue値）を型安全に計算できる SHALL
5. WHEN Role型からhue値を取得する THEN システムは現在のimage_hue関数の色分けロジックを維持している SHALL

### Requirement 2: Species型の分離と組織概念の整理
**User Story:** 開発者として、現在のOrganization型に混在している種族（Trill）、政治組織（Federation）、宗教団体（Prophet）を適切に分離したい。Species型を導入することで、より正確なドメインモデリングを実現する。

#### Acceptance Criteria
1. WHEN Species型が定義される THEN システムは Human、Bajoran、Cardassian、Klingon、Ferengi、Trill、Changeling、Vorta、Jem'Hadar 等の主要種族をサポートしている SHALL
2. WHEN Organization型が再設計される THEN システムは政治・軍事組織（Federation、Cardassian Union、Klingon Empire、Dominion）を明確に分離している SHALL
3. WHEN Organization型が再設計される THEN システムは宗教・文化組織（Bajoran Religion、Prophets）を適切に分類している SHALL
4. IF キャラクターにSpecies型が関連付けられている THEN システムは種族固有の特性を型安全に管理できる SHALL
5. WHEN 既存のJSON データを読み込む THEN システムは現在のOrganization データを新しいSpecies/Organization分類に適切にマッピングできる SHALL

### Requirement 3: Character型の拡張とメタデータ管理
**User Story:** 開発者として、現在の列挙型のみのCharacter型を拡張し、各キャラクターのRole、Species、所属Organizationを型安全に管理したい。これにより、将来の高機能化（検索、フィルタリング、分析）に対応する。

#### Acceptance Criteria
1. WHEN Character型が拡張される THEN システムは各キャラクターのSpecies情報を含んでいる SHALL
2. WHEN Character型が拡張される THEN システムは各キャラクターのRole情報（Starfleet rank、Bajoran title等）を含んでいる SHALL
3. WHEN Character型が拡張される THEN システムは各キャラクターの所属Organization情報を含んでいる SHALL
4. IF キャラクターが複数の役職を持つ場合（例：Sisko の Commander と Emissary） THEN システムは複数のRoleを管理できる SHALL
5. WHEN Character型の拡張が完了する THEN システムは既存の to_string、from_string、image_hue 関数の互換性を維持している SHALL

### Requirement 4: 型変数を使用した組織・役職関係のモデリング
**User Story:** 開発者として、Federation の型変数として Role を使用するなど、組織と役職の関係を型レベルで表現したい。これにより、組織固有の役職体系を型安全に管理し、間違った役職の割り当てを防ぐ。

#### Acceptance Criteria
1. WHEN Organization型が型変数をサポートする THEN システムは Federation(role: StarfleetRank) 形式でStarfleet固有の階級を管理できる SHALL
2. WHEN 型変数付きOrganization型が定義される THEN システムは Cardassian(role: CardassianRank)、Klingon(role: KlingonRank) 等の組織固有役職をサポートしている SHALL
3. IF キャラクターが特定の組織に所属している THEN システムはその組織で有効な役職のみを割り当て可能にしている SHALL
4. WHEN 型変数付きOrganization型を使用する THEN システムは型安全性を維持しながら既存のJSON解析ロジックを動作させている SHALL
5. IF 無効な組織・役職の組み合わせが発生する THEN システムはコンパイル時またはランタイムでエラーを検出できる SHALL

### Requirement 5: 既存機能との後方互換性
**User Story:** 開発者として、新しいドメインモデルを導入しながら、既存のエピソード表示、ヒストグラム生成、色分けロジック等の機能を破壊することなく動作させたい。

#### Acceptance Criteria
1. WHEN 新しいドメインモデルが導入される THEN システムは既存の Episode 型との互換性を維持している SHALL
2. WHEN 新しいドメインモデルが導入される THEN システムは既存の CharacterAndContrast、OrganizationAndContrast 型との互換性を維持している SHALL
3. WHEN 新しいドメインモデルが導入される THEN システムは既存の get_character_episodes、get_organization_episodes 関数を動作させている SHALL
4. WHEN 新しいドメインモデルが導入される THEN システムは既存のヒストグラムコンポーネントの色分けロジックを正しく動作させている SHALL
5. IF 既存のJSON データ形式が変更されていない THEN システムは priv/static/episodes.json を変更なしに読み込めている SHALL

### Requirement 6: 将来の拡張性への対応
**User Story:** 開発者として、今回のドメインモデル改善により、将来の高機能化（検索機能、詳細分析、キャラクター関係図等）に対応可能な柔軟な構造を実現したい。

#### Acceptance Criteria
1. WHEN 新しいドメインモデルが設計される THEN システムは新しいSpecies、Role、Organizationの追加を容易にサポートしている SHALL
2. WHEN 新しいドメインモデルが設計される THEN システムはキャラクター間の関係性（上司・部下、友人・敵対等）を将来追加できる構造になっている SHALL
3. IF 新しい分析機能が必要になる場合 THEN システムは種族別統計、役職別統計、組織別統計を型安全に実行できる SHALL
4. WHEN ドメインモデルの拡張が行われる THEN システムは既存のテストケースを破壊することなく変更をサポートしている SHALL
5. IF JSON データ形式の拡張が必要になる場合 THEN システムは新しいフィールドの追加に対応できる柔軟なデコーダ構造を持っている SHALL
