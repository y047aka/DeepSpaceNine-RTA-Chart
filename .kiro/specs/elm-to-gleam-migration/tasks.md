# Implementation Plan

## Phase 1: Project Setup (プロジェクト初期設定)

### Task 1.1: Initialize Gleam Project
**Priority**: Critical  
**Estimated Time**: 30 minutes

**Actions**:
- [ ] Create new directory `gleam_ds9_chart`
- [ ] Run `gleam new gleam_ds9_chart --template=lustre`
- [ ] Configure `gleam.toml` with required dependencies
- [ ] Set JavaScript target in configuration

**Dependencies**: gleam_stdlib, lustre, gleam_json, gleam_javascript

**Acceptance Criteria**:
- Gleam project compiles successfully
- Lustre template is properly configured
- JavaScript target builds without errors

### Task 1.2: Setup Project Structure
**Priority**: High  
**Estimated Time**: 20 minutes

**Actions**:
- [ ] Create `src/types/` directory for data models
- [ ] Create `src/components/` directory for UI components
- [ ] Create `src/utils/` directory for utilities
- [ ] Create `priv/static/` directory for assets
- [ ] Setup basic directory structure per design

**Dependencies**: Task 1.1

**Acceptance Criteria**:
- All directories exist as per design specification
- Project structure matches planned architecture

### Task 1.3: Copy Static Assets
**Priority**: Medium  
**Estimated Time**: 15 minutes

**Actions**:
- [ ] Copy `episodes.js` from Elm project to `priv/static/`
- [ ] Create basic `index.html` template
- [ ] Verify static asset accessibility

**Dependencies**: Task 1.2

**Acceptance Criteria**:
- episodes.js is accessible from Gleam project
- HTML template loads correctly

## Phase 2: Data Layer Implementation (データ層実装)

### Task 2.1: Define Core Types
**Priority**: Critical  
**Estimated Time**: 45 minutes

**Actions**:
- [ ] Create `src/types/episode.gleam` with Episode type
- [ ] Create `src/types/character.gleam` with Character enum
- [ ] Create `src/types/organization.gleam` with Organization enum
- [ ] Add NameAndContrast and SeasonImportance helper types

**Dependencies**: Task 1.2

**Acceptance Criteria**:
- All types compile without errors
- Types match Elm equivalents functionally
- Proper module exports are defined

### Task 2.2: Implement JSON Decoders
**Priority**: Critical  
**Estimated Time**: 60 minutes

**Actions**:
- [ ] Create `src/utils/json_decoder.gleam`
- [ ] Implement `decode_episode()` function
- [ ] Implement `decode_name_and_contrast()` function
- [ ] Add error handling for JSON decode failures
- [ ] Test with actual episodes.js data

**Dependencies**: Task 2.1

**Acceptance Criteria**:
- JSON decoding works with real data
- Error cases are handled gracefully
- Decoded data matches expected types

### Task 2.3: Character/Organization String Conversion
**Priority**: High  
**Estimated Time**: 30 minutes

**Actions**:
- [ ] Implement `character_to_string()` and `character_from_string()`
- [ ] Implement `organization_to_string()` and `organization_from_string()`
- [ ] Add `image_hue()` functions for both types
- [ ] Test bidirectional conversion

**Dependencies**: Task 2.1

**Acceptance Criteria**:
- All character/organization names convert correctly
- Hue values match Elm implementation
- Bidirectional conversion works properly

## Phase 3: Core Components (コアコンポーネント)

### Task 3.1: Basic App Structure
**Priority**: Critical  
**Estimated Time**: 45 minutes

**Actions**:
- [ ] Create `src/app.gleam` with Model and Msg types
- [ ] Implement `init()` function with episode loading
- [ ] Implement `update()` function for Toggle message
- [ ] Setup basic Lustre application structure

**Dependencies**: Task 2.2

**Acceptance Criteria**:
- App initializes with episode data
- Toggle functionality works
- Lustre app structure is correct

### Task 3.2: Large Histogram Component
**Priority**: High  
**Estimated Time**: 75 minutes

**Actions**:
- [ ] Create `src/components/large_histogram.gleam`
- [ ] Implement grid layout with CSS classes
- [ ] Add season grouping logic
- [ ] Implement color calculation based on importance
- [ ] Test with Deep Space Nine data

**Dependencies**: Task 3.1, Task 2.3

**Acceptance Criteria**:
- Large histogram displays correctly
- Colors match Elm version
- Grid layout is responsive

### Task 3.3: Small Histogram Component
**Priority**: High  
**Estimated Time**: 60 minutes

**Actions**:
- [ ] Create `src/components/histogram.gleam`
- [ ] Implement compact grid layout
- [ ] Add episode grouping by season
- [ ] Implement responsive sizing with CSS
- [ ] Test with character data

**Dependencies**: Task 3.2

**Acceptance Criteria**:
- Small histograms display in 3-column grid
- Sizing is appropriate for small format
- Character data renders correctly

### Task 3.4: Episode Table Component
**Priority**: Medium  
**Estimated Time**: 90 minutes

**Actions**:
- [ ] Create `src/components/episode_table.gleam`
- [ ] Implement table structure (Season-Episode, Importance, Title)
- [ ] Add importance circle visualization
- [ ] Implement hover effects
- [ ] Add Netflix link popover functionality
- [ ] Test table with full episode list

**Dependencies**: Task 3.1

**Acceptance Criteria**:
- Table displays all required columns
- Importance circles show correct sizes
- Hover effects work properly
- Popover displays episode details

## Phase 4: Styling & Integration (スタイリング・統合)

### Task 4.1: CSS Migration
**Priority**: High  
**Estimated Time**: 120 minutes

**Actions**:
- [ ] Create `src/styles/main.css`
- [ ] Convert elm-css styles to standard CSS
- [ ] Implement CSS Grid layouts for histograms
- [ ] Add responsive design with vw units
- [ ] Implement hover effects and transitions
- [ ] Test all visual elements

**Dependencies**: Task 3.4

**Acceptance Criteria**:
- Visual appearance matches Elm version
- Responsive design works correctly
- All animations and transitions function

### Task 4.2: Color System Implementation
**Priority**: Medium  
**Estimated Time**: 45 minutes

**Actions**:
- [ ] Create `src/utils/color.gleam`
- [ ] Implement `step_by_importance()` function
- [ ] Implement `hsl_color()` function
- [ ] Add color utilities for components
- [ ] Test color consistency across components

**Dependencies**: Task 4.1

**Acceptance Criteria**:
- Colors match Elm implementation exactly
- Color functions work consistently
- HSL calculations are correct

### Task 4.3: Main Layout Integration
**Priority**: High  
**Estimated Time**: 60 minutes

**Actions**:
- [ ] Integrate all components in main view
- [ ] Implement character filtering based on afterSeason4
- [ ] Add checkbox for "Show more characters"
- [ ] Organize layout sections properly
- [ ] Test complete application flow

**Dependencies**: Task 4.2

**Acceptance Criteria**:
- All components display in correct layout
- Character filtering works correctly
- Toggle functionality affects display

## Phase 5: Data Processing & Optimization (データ処理・最適化)

### Task 5.1: Character/Organization Filtering
**Priority**: Medium  
**Estimated Time**: 45 minutes

**Actions**:
- [ ] Implement `get_character_episodes()` function
- [ ] Implement `get_organization_episodes()` function
- [ ] Add efficient list processing
- [ ] Test filtering with various characters
- [ ] Optimize for performance

**Dependencies**: Task 4.3

**Acceptance Criteria**:
- Character filtering produces correct data
- Organization filtering works properly
- Performance is acceptable for large datasets

### Task 5.2: Error Handling & Robustness
**Priority**: Medium  
**Estimated Time**: 30 minutes

**Actions**:
- [ ] Add comprehensive error handling for JSON decode
- [ ] Implement fallback data for missing episodes
- [ ] Add logging for debugging
- [ ] Test error scenarios
- [ ] Ensure graceful degradation

**Dependencies**: Task 5.1

**Acceptance Criteria**:
- App handles missing data gracefully
- Error messages are helpful
- No crashes with invalid data

## Phase 6: Testing & Quality Assurance (テスト・品質保証)

### Task 6.1: Unit Tests
**Priority**: Medium  
**Estimated Time**: 90 minutes

**Actions**:
- [ ] Create tests for Episode type and decoders
- [ ] Create tests for Character/Organization conversion
- [ ] Create tests for color utilities
- [ ] Create tests for data filtering functions
- [ ] Run full test suite

**Dependencies**: Task 5.2

**Acceptance Criteria**:
- All core functions have tests
- Test coverage is comprehensive
- All tests pass consistently

### Task 6.2: Integration Testing
**Priority**: Medium  
**Estimated Time**: 60 minutes

**Actions**:
- [ ] Test complete application with real data
- [ ] Test all user interactions
- [ ] Test responsive design on different screen sizes
- [ ] Test performance with full dataset
- [ ] Verify visual accuracy against Elm version

**Dependencies**: Task 6.1

**Acceptance Criteria**:
- Full application works correctly
- Performance is acceptable
- Visual output matches original

## Phase 7: Build & Deployment (ビルド・デプロイメント)

### Task 7.1: Production Build Setup
**Priority**: Medium  
**Estimated Time**: 45 minutes

**Actions**:
- [ ] Configure production build settings
- [ ] Test JavaScript output
- [ ] Optimize bundle size
- [ ] Setup static asset handling
- [ ] Create deployment scripts

**Dependencies**: Task 6.2

**Acceptance Criteria**:
- Production build works correctly
- Bundle size is optimized
- Static assets load properly

### Task 7.2: Development Environment
**Priority**: Low  
**Estimated Time**: 30 minutes

**Actions**:
- [ ] Setup hot reload with Lustre dev server
- [ ] Configure development scripts
- [ ] Test development workflow
- [ ] Document development setup

**Dependencies**: Task 7.1

**Acceptance Criteria**:
- Hot reload works correctly
- Development experience is smooth
- Documentation is complete

## Phase 8: Documentation & Finalization (ドキュメント・最終化)

### Task 8.1: Code Documentation
**Priority**: Low  
**Estimated Time**: 45 minutes

**Actions**:
- [ ] Add module documentation to all Gleam files
- [ ] Document public function interfaces
- [ ] Add code comments for complex logic
- [ ] Create API documentation

**Dependencies**: Task 7.2

**Acceptance Criteria**:
- All public functions are documented
- Code is well-commented
- Documentation is clear and helpful

### Task 8.2: Migration Verification
**Priority**: High  
**Estimated Time**: 60 minutes

**Actions**:
- [ ] Compare Gleam and Elm versions side-by-side
- [ ] Verify all features work identically
- [ ] Test edge cases and user interactions
- [ ] Document any differences or limitations
- [ ] Performance comparison

**Dependencies**: Task 8.1

**Acceptance Criteria**:
- Gleam version is functionally identical to Elm
- Performance is equal or better
- All user workflows work correctly

## Summary

**Total Estimated Time**: ~14 hours  
**Critical Path Tasks**: 1.1 → 2.1 → 2.2 → 3.1 → 3.2 → 4.1 → 4.3  
**Optional Tasks**: 6.1, 6.2, 8.1 (can be done after core functionality)

**Key Milestones**:
1. **Phase 1-2 Complete**: Basic Gleam project with data loading
2. **Phase 3 Complete**: All UI components functional
3. **Phase 4 Complete**: Visual parity with Elm version
4. **Phase 5-6 Complete**: Production-ready application
5. **Phase 7-8 Complete**: Deployed and documented

**Risk Mitigation**:
- Start with critical path tasks
- Test each component independently
- Maintain visual comparison with Elm version
- Focus on functional parity before optimization