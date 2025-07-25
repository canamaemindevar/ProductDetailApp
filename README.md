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

Architecture Migration
This project demonstrates two different asynchronous programming approaches:
Current Version (Completion Blocks): You are currently viewing the completion block-based implementation on the main branch.
Modern Version (Async/Await): For the updated async/await implementation, check out: https://github.com/canamaemindevar/ProductDetailApp/tree/main%2BAsyncAwait
