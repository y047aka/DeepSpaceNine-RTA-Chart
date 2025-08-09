# Deep Space Nine RTA Chart - Technology Stack

## Architecture
**Single Page Application (SPA)** - Client-side web application with static data loading and interactive UI rendering

## Frontend
- **Language**: Gleam (v1.0.0) - Functional programming language targeting JavaScript
- **UI Framework**: Lustre (v5.2.1) - Elm-inspired reactive UI library for Gleam
- **Build Target**: JavaScript compilation via Gleam compiler
- **HTTP Client**: RSVP (v1.1.3) - Promise-based HTTP requests for Gleam/JavaScript
- **JSON Handling**: gleam_json (v3.0.2) for data parsing and decoding

## Core Dependencies
- **gleam_stdlib** (v0.62.0) - Standard library functions
- **gleam_javascript** (v1.0.0) - JavaScript FFI bindings
- **gleam_http** (v4.1.1) - HTTP types and utilities

## Development Environment
- **Package Manager**: Gleam package manager with hex.pm packages
- **Test Framework**: Gleeunit (v1.6.1) - Unit testing for Gleam
- **Development Server**: Lustre Dev Tools (v1.9.0) with live reload functionality
- **Build Tool**: Gleam build system (gleam build)
- **Code Quality**: Biome.js (biome.jsonc configuration)

## Common Commands
- `gleam run` - Start the application in development mode
- `gleam build` - Compile the project to JavaScript
- `gleam test` - Run the test suite
- `gleam format` - Format source code
- `gleam check` - Type check without building

## Data Architecture
- **Static Data**: JSON file (`priv/static/episodes.json`) containing all episode metadata
- **Data Types**: Strongly typed domain models (Episode, Character, Organization) with contrast ratings
- **Data Loading**: Client-side HTTP fetch on application initialization
- **Error Handling**: Custom AppError type with logging utilities

## Port Configuration
- **Development Server**: Lustre dev tools default port (typically 8080 or 3000)
- **Static Assets**: Served from `priv/static/` directory

## Key Libraries
- **Lustre**: Reactive UI with Elm Architecture (Model-View-Update pattern)
- **RSVP**: Async HTTP requests with JSON response handling
- **gleam_javascript**: JavaScript interop for browser APIs

## Browser Compatibility
- **Modern Browsers**: ES6+ module support required
- **Module System**: ES modules (`type="module"` script loading)
- **APIs Used**: Fetch API for HTTP requests, DOM manipulation via Lustre

## Type System
- **Static Typing**: Gleam's type system with algebraic data types
- **Custom Types**: Domain-specific types for Episode, Character, Organization
- **JSON Decoding**: Type-safe JSON parsing with validation
- **Error Types**: Structured error handling with custom AppError variants

## Build Output
- **Target**: JavaScript modules in `build/dev/javascript/app/`
- **Entry Point**: `priv/static/app.mjs`
- **Assets**: Static files served from `priv/static/`
- **HTML**: Single `index.html` with module script loading

## Development Workflow
1. Edit Gleam source files in `src/`
2. Lustre dev tools provide hot reload
3. Type checking on compilation
4. Unit tests with gleeunit framework
5. Browser-based testing and debugging