# 実装計画

## 概要
Deep Space Nine RTAチャートのドメインモデル改善を段階的に実装する。既存の動作を破壊しない後方互換性を維持しながら、Role、Species、CharacterMetadata型を導入し、型安全性と拡張性を向上させる。

## 実装タスク

### フェーズ1: 基礎ドメイン型の実装

- [ ] **1.1 Species型の実装とテスト**
  - `src/types/species.gleam`を作成し、Species Custom Typeを定義する
  - Human、Bajoran、Cardassian、Klingon、Ferengi、Trill、Changeling、Vorta、JemHadar、Vulcan、Andorian、Betazoid、ElAurian列挙値を実装
  - `to_string`, `from_string`, `get_cultural_traits`関数を実装
  - `test/species_test.gleam`でSpecies型の単体テストを作成（文字列変換、解析テスト）
  - _要件: 2.1, 2.4_

- [ ] **1.2 Role型の実装とテスト**
  - `src/types/role.gleam`を作成し、Role Custom Typeを定義する
  - StarfleetCommand、StarfleetEngineering、StarfleetSecurity、StarfleetScience、StarfleetMedical、StarfleetOperations、BajoranMilitia、BajoranReligious、CardassianMilitary、KlingonWarrior、FerengiCommerce、DominionService、ChangelingFounder、VortaDiplomat、JemHadarSoldier列挙値を実装
  - `to_string`, `from_string`, `to_hue`関数を実装（現在のimage_hue色分けロジックを移行）
  - `test/role_test.gleam`でRole型の単体テストを作成（文字列変換、hue値計算テスト）
  - _要件: 1.1, 1.2, 1.3, 1.4, 1.5_

- [ ] **1.3 Generic Organization型の実装とテスト**
  - `src/types/organization.gleam`を既存ファイルから拡張し、Generic Organization(role) Custom Typeを定義
  - Federation(member_role: role)、CardassianUnion、KlingonEmpire、DominionForces(member_role: role)、BajoranProvisionalGov(member_role: role)、FerengiAlliance、BajoranReligion、ProphetsTemple、TrillSymbiosisCommission、Maquis、MirrorUniverse、Independent列挙値を実装
  - 既存の`to_string`, `from_string`, `to_hue`関数をGeneric型対応に拡張
  - `test/organization_test.gleam`を拡張し、Generic Organization型テストを追加
  - _要件: 2.2, 2.3, 4.1, 4.2_

### フェーズ2: CharacterMetadata統合

- [ ] **2.1 CharacterMetadata型の実装**
  - `src/types/character.gleam`を拡張し、CharacterMetadata Custom Typeを定義
  - CharacterMetadata(character: Character, species: Species, organization: Organization(Role))構造を実装
  - 各キャラクターのメタデータマッピング定数`character_metadata_map`を実装
  - 主要キャラクター（BenjaminSisko、KiraNerys、Dax、MilesObrien、Bashir、Odo、Worf、Quark）のメタデータを設定
  - _要件: 3.1, 3.2, 3.3_

- [ ] **2.2 Character型の拡張関数実装**
  - 既存`src/types/character.gleam`に新機能関数を追加
  - `get_metadata(character: Character) -> CharacterMetadata`関数を実装
  - `get_species(character: Character) -> Species`関数を実装
  - `get_role(character: Character) -> Role`関数を実装（メタデータから役職を抽出）
  - `get_organization(character: Character) -> Organization(Role)`関数を実装
  - _要件: 3.1, 3.2, 3.3_

- [ ] **2.3 既存互換性関数の更新**
  - 既存の`image_hue(character: Character) -> Int`関数を内部実装変更（シグネチャ維持）
  - メタデータからRole情報を取得し、role.to_hue()を呼び出すように変更
  - `to_string`, `from_string`関数の動作を維持（外部仕様変更なし）
  - `test/character_test.gleam`を拡張し、後方互換性テストを追加
  - _要件: 3.5, 5.1, 5.4_

### フェーズ3: JSON互換性とエラーハンドリング

- [ ] **3.1 AppError型の拡張**
  - `src/types/error.gleam`を拡張し、新ドメインモデル用エラーバリアントを追加
  - UnknownSpeciesError(String)、UnknownRoleError(String)、InvalidOrganizationRoleCombination(String, String)、MetadataNotFoundError(Character)、RoleOrganizationMismatchError(Role, String)、LegacyDataMappingError(String)、MetadataDecodingError(String)を追加
  - エラー処理関数の更新とテストケース作成
  - _要件: Result型エラーハンドリング_

- [ ] **3.2 互換性レイヤーの実装**
  - `src/types/character.gleam`に互換性変換関数を実装
  - 既存JSONデータの組織情報を新しいSpecies/Organization分類にマッピングする`legacy_organization_mapping`関数を実装
  - 旧Organization形式から新形式への自動変換ロジック（Trill → Species、Prophet → BajoranReligion等）
  - _要件: 2.5, 5.5_

- [ ] **3.3 Episode型との統合テスト**
  - `src/types/episode.gleam`の既存機能（get_character_episodes、get_organization_episodes）が新ドメインモデルで正常動作することを確認
  - CharacterAndContrast、OrganizationAndContrast型との互換性テスト
  - `test/episode_test.gleam`を拡張し、新ドメインモデルとの統合テストを追加
  - _要件: 5.2, 5.3_

### フェーズ4: 統合テストと検証

- [ ] **4.1 Property-basedテストの実装**
  - `test/domain_property_test.gleam`を新規作成
  - 全Characterについて、metadata.organizationとroleの整合性を検証するproperty-basedテストを実装
  - Generic Organization型の型変数制約が正しく機能することを検証
  - _要件: 4.3, 4.5_

- [ ] **4.2 後方互換性統合テスト**
  - `test/compatibility_test.gleam`を新規作成
  - 既存の全公開API（to_string、from_string、image_hue）が同じ結果を返すことを検証
  - episodes.jsonの読み込みと解析が既存と同等に動作することを確認
  - ヒストグラムコンポーネント用のhue値が正しく計算されることを検証
  - _要件: 5.1, 5.2, 5.3, 5.4, 5.5_

- [ ] **4.3 完全な統合フロー検証**
  - `test/integration_full_test.gleam`を新規作成
  - episodes.json読み込み → Character解析 → メタデータ取得 → hue計算 → ヒストグラム描画の全フローテスト
  - エラーケース（不正なキャラクター名、組織・役職の不整合）のハンドリングテスト
  - `gleam test`コマンドで全テストが通過することを確認
  - _要件: 6.1, 6.2, 6.4_

### フェーズ5: パフォーマンス最適化と最終検証

- [ ] **5.1 メタデータアクセス最適化**
  - character_metadata_mapの効率的なアクセスパターンを実装
  - キャラクターメタデータ取得のパフォーマンス測定（< 1ms目標）
  - 必要に応じてキャッシュ機構を実装
  - _要件: パフォーマンス目標_

- [ ] **5.2 コンパイル時型安全性検証**
  - 全モジュールで`gleam check`が成功することを確認
  - Generic Organization型の型変数制約が適切に動作することを確認
  - 型安全性違反（不正な組織・役職組み合わせ）がコンパイル時に検出されることを確認
  - _要件: 1.1, 4.4, 4.5_

- [ ] **5.3 最終動作確認とドキュメント**
  - `gleam run`でアプリケーションが正常起動することを確認
  - ブラウザでヒストグラム表示、エピソード表示が既存と同等に動作することを確認
  - 新しいドメインモデルAPIの使用例をコード内のdoc commentとして記録
  - 全要件（REQ-1～6の30項目）が満たされていることを最終確認
  - _要件: 6.5, 全要件の充足_

## 実装順序の理由

1. **基礎型から構築**: Species、Role、Organization型を独立して実装し、依存関係を最小化
2. **段階的統合**: CharacterMetadata統合により既存型との橋渡しを行う
3. **互換性維持**: 各段階で既存機能の動作を保証し、破壊的変更を回避
4. **テスト重視**: TDD原則に従い、各実装段階でテストを並行実装
5. **最終検証**: 全体統合とパフォーマンス最適化により完成度を確保

## 成功基準

- [ ] 全テストケースの成功（`gleam test`）
- [ ] 型チェックの成功（`gleam check`）  
- [ ] アプリケーションの正常起動（`gleam run`）
- [ ] 既存機能の完全な後方互換性
- [ ] 新ドメインモデルAPIの正常動作
- [ ] パフォーマンス目標の達成（メタデータ取得 < 1ms）