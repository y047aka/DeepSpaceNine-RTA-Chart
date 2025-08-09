# Deep Space Nine RTA Chart - Project Structure

## Root Directory Organization
- **src/** - Gleam source code with domain logic and UI components
- **priv/static/** - Static web assets (CSS, JSON data, compiled JS)
- **test/** - Unit and integration tests
- **build/** - Compiled artifacts and dependencies (generated)
- **gleam.toml** - Project configuration and dependencies
- **manifest.toml** - Package lock file (generated)
- **index.html** - Application entry point
- **biome.jsonc** - Code formatting and linting configuration

## Source Code Structure (`src/`)
```
src/
├── app.gleam              # Main application entry point (Lustre app setup)
├── components/            # Reusable UI components
│   ├── episode_table.gleam    # Tabular episode listing
│   └── histogram.gleam        # Chart visualization components
├── ffi/                   # Foreign Function Interface (JavaScript interop)
│   └── console.mjs           # Console logging utilities
├── types/                 # Domain model definitions
│   ├── character.gleam       # Character types and functions
│   ├── episode.gleam        # Episode types and JSON decoders
│   ├── error.gleam          # Error handling types
│   └── organization.gleam    # Organization types and functions
└── utils/                 # Utility functions (currently empty)
```

## Static Assets Structure (`priv/static/`)
```
priv/static/
├── app.mjs          # Compiled JavaScript entry point
├── episodes.json    # Episode data with metadata
└── styles.css       # Application styling
```

## Test Structure (`test/`)
```
test/
├── app_test.gleam              # Main app logic tests
├── app_integration_test.gleam  # Full application integration tests
├── character_test.gleam        # Character type tests
├── episode_test.gleam          # Episode parsing and logic tests
├── episode_table_test.gleam    # Episode table component tests
├── histogram_test.gleam        # Histogram component tests
├── organization_test.gleam     # Organization type tests
└── gleamapp_test.gleam        # Additional app tests
```

## Code Organization Patterns

### Domain-Driven Design
- **types/** directory contains pure domain models
- Each domain concept has its own module (Character, Episode, Organization, Error)
- Type definitions include both data structures and associated functions

### Component Architecture
- **components/** directory for reusable UI elements
- Each component exports a `view` function returning `Element(msg)`
- Components accept data and return Lustre elements

### Elm Architecture (Model-View-Update)
- **Model**: Application state (episodes list, UI flags)
- **View**: Pure functions rendering HTML from model
- **Update**: Message handling for state transitions

### Foreign Function Interface
- **ffi/** directory for JavaScript interop code
- `.mjs` files for ES module compatibility
- Console logging and other browser API access

## File Naming Conventions
- **Snake Case**: All Gleam files use snake_case (e.g., `episode_table.gleam`)
- **Descriptive Names**: File names reflect their primary purpose or domain concept
- **Type Modules**: Domain types in `types/` directory with clear names
- **Component Modules**: UI components in `components/` directory

## Import Organization
- **Standard Library**: `gleam/*` imports first
- **External Dependencies**: Third-party packages (lustre, rsvp) second
- **Internal Modules**: Local imports last
- **Type Imports**: Explicit type imports with aliases when needed

### Import Example Pattern
```gleam
// Standard library
import gleam/list
import gleam/result

// External dependencies  
import lustre
import lustre/element.{type Element}

// Internal modules
import types/episode.{type Episode}
import types/character.{type Character}
```

## Key Architectural Principles

### Functional Programming
- **Immutable Data**: All data structures are immutable
- **Pure Functions**: Functions avoid side effects where possible  
- **Pattern Matching**: Extensive use of case expressions for control flow
- **Type Safety**: Compiler-enforced type checking prevents runtime errors

### Separation of Concerns
- **Domain Logic**: Isolated in `types/` modules
- **UI Components**: Separated into `components/` directory
- **Application State**: Centralized in main app module
- **Data Access**: JSON loading isolated in data fetching functions

### Error Handling
- **Result Types**: `Result(success, error)` for error-prone operations
- **Custom Error Types**: Structured `AppError` type for application errors
- **Error Logging**: Centralized error logging with structured messages

### Component Design
- **Single Responsibility**: Each component has one clear purpose
- **Data Down, Events Up**: Components receive data via parameters, emit events via messages
- **Reusability**: Components designed for use across different contexts
- **Type Safety**: All component interfaces fully typed

### Testing Strategy
- **Unit Tests**: Individual function and module testing
- **Integration Tests**: Full application flow testing
- **Domain Model Tests**: Comprehensive testing of business logic
- **Component Tests**: UI component behavior validation