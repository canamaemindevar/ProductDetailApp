# ProductDetailApp

- ⚙️ Added support for multiple environments (Dev and Prod) with separate configuration files and display names.
- 🧱 Implemented a base MVVM architecture with centralized loading, error, and success handling (with tests).
- 🧭 Integrated the Coordinator pattern for structured navigation flow across modules.
- 📦 Implemented local JSON data handling with protocol-oriented architecture using Repository pattern.
- 🌐 Added a generic `NetworkErrors` enum with unified error management for both local and network requests.
- 🖼️ Introduced reusable UI components like `BaseImageView` and a circular countdown `CircularTimerView`.
- 🧩 Designed a scalable networking layer using `AppRequest` and `EndpointProtocol` with configurable environment-based endpoints (`AppServices`, `API`).
- 🧪 Injected mock vs real repositories dynamically via `ProviderFactory` based on environment, supporting both local and prod configurations.
- 🛠️ Implemented `BuildConfiguration` for safe, typed access to Info.plist environment values.
- 🧠 Applied Repository and Provider patterns for clean separation of concerns in data access (e.g. `ProductRepository`, `SocialProviderable`).
- 🖼️ Developed `BaseImageView` and `ProductDetailImageView` with dynamic aspect ratio handling, styling, and environment-aware placeholders.
- 📸 Added Snapshot testing for UI components to ensure consistent visual output.
- 📐 Introduced a centralized spacing system using enum-based constants (`K.P`) for consistent layout values.
- 🔄 Migrated from completion blocks to async/await for cleaner, more maintainable asynchronous code throughout the application.

Architecture Migration
This project has been updated to use modern Swift concurrency with async/await pattern instead of completion blocks. You can find the previous completion block-based implementation at:
Previous Version (Completion Blocks): https://github.com/canamaemindevar/ProductDetailApp/tree/main
