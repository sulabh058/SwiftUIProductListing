# SwiftUIProductListing

# Product List App:

This is an iOS application built using SwiftUI follows MVVM + Clean architecture. The app fetches a list of categories and allows the user to view detailed products information in each category.

Includes MVVM design pattern, dependency injection and Unit test cases.

To run the project, ensure you have: macOS with the latest Xcode Swift 5.5+ iOS 16+ Simulator (or physical device)

Layers and responsibilities The project is organized into distinct layers, each responsible for specific concerns:

Data Layer: Responsible for data retrieval and manipulation: Gateway Implementations + API (Network) + Database
Domain Layer: Contains business logic and use cases: Entities + Use Cases + Gateway Protocols
UI/Presentation Layer: Manages user interface and user interactions: ViewModels + ViewControllers/Views + Navigator

Dependency Injection The project leverages dependency injection to manage dependencies between layers. This ensures loose coupling and enhances testability. Dependencies are injected through initializers, allowing for easy substitution of implementations during testing.

# Screenshots

![Simulator Screenshot - iPhone 16 Plus - 2025-05-19 at 23 07 10](https://github.com/user-attachments/assets/c174f632-0a63-48c9-a013-e150e8b03899)
![Simulator Screenshot - iPhone 16 Plus - 2025-05-19 at 23 07 06](https://github.com/user-attachments/assets/b2f234e9-49ce-49a6-8bd9-b4be22dafd77)
