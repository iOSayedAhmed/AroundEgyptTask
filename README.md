# Around Egypt

A modern iOS app for exploring Egyptian experiences in 360 degrees with offline support and clean architecture.





https://github.com/user-attachments/assets/efc1f683-13a1-4752-8042-2524f4f2747c


📱 Screenshots
<p align="center">
  <img src="https://github.com/user-attachments/assets/673bc191-7b68-49db-a8f8-c9bfe0759264" width="250" height="500">
  <img src="https://github.com/user-attachments/assets/56266bf8-d2dc-418c-b5d2-3fba3d65272d" width="250" height="500">
  <img src="https://github.com/user-attachments/assets/cd2db2a5-6877-4946-9340-9c1d544873af" width="250" height="500">
</p>


## 🚀 Features

- **Browse** recommended and recent Egyptian experiences
- **Search** experiences by title
- **Like System** with real-time sync across screens
- **Detailed Views** with content and descriptions
- **Offline Support** with data and image caching
- **Clean UI** following iOS design guidelines

## 🏗️ Architecture

### Clean MVVM + Repository Pattern

```
AroundEgypt/
├── App/                    # App configuration
├── Core/                   # Shared utilities & extensions
├── Data/                   # Repository & data sources
│   ├── DataSources/        # Network & local data
│   └── Repositories/       # Data access layer
├── Domain/                 # Business logic
│   ├── Entities/           # Models
│   ├── UseCases/           # Business rules
│   └── RepositoryProtocols/
├── Presentation/           # UI layer (MVVM)
│   └── Scenes/            # Home & ExperienceDetails
└── Resources/             # Assets
```

## 📦 Tech Stack

- **UI**: SwiftUI, Combine
- **Architecture**: Clean MVVM, Repository Pattern, Use Cases
- **Networking**: URLSession with custom service layer
- **Caching**: CoreData (data) + Kingfisher (images)
- **Offline**: Network Monitor + local storage
- **Code Quality**: SwiftLint + swift-format

## 🛠️ Setup

1. **Clone the repository:**
   ```bash
   git clone https://github.com/iOSayedAhmed/AroundEgyptTask.git
   cd AroundEgyptTask
   ```

2. **Open in Xcode:**
   ```bash
   open AroundEgypt.xcodeproj
   ```

3. **Run the project:**
   - Select target device/simulator
   - Press `Cmd + R`

## 📱 Dependencies

- **[Kingfisher](https://github.com/onevcat/Kingfisher)**: Image downloading & caching
- **Built-in**: SwiftUI, Combine, CoreData, Network framework

## 🔧 Code Quality

### SwiftLint
```bash
# Install
brew install swiftlint

# Run
swiftlint
```

### Swift-Format
```bash
# Install
brew install swift-format

# Format
swift-format -i -r Sources/
```

## 🌐 Offline Support

### Smart Caching
- **Data**: CoreData stores experiences for offline viewing
- **Images**: Kingfisher handles image caching automatically
- **Network**: Real-time connectivity monitoring
- **Sync**: Automatic data sync when back online

### How it Works
1. **Online**: Fetch data from API → Cache locally → Display
2. **Offline**: Display cached data → Show offline indicators
3. **Back Online**: Sync new data → Update cache

## 🧪 Testing

```bash
# Run all tests
Cmd + U

# Test coverage includes:
- Use Cases (business logic)
- Repositories (data access)
- ViewModels (presentation logic)
- Network layer
```

## 🏛️ Key Design Patterns

### Repository Pattern
```swift
protocol ExperiencesRepositoryProtocol {
    func getRecommendedExperiences() async -> Result<[Experience], Error>
}

struct ExperiencesRepositoryImpl: ExperiencesRepositoryProtocol {
    // Handles both network and cache data sources
}
```

### Use Cases
```swift
struct GetRecommendedExperiencesUseCase {
    func execute() async -> Result<[Experience], Error>
    // Pure business logic, no UI dependencies
}
```

### MVVM with Combine
```swift
final class HomeViewModel: ObservableObject {
    @Published var experiences: [Experience] = []
    private let useCase: GetRecommendedExperiencesUseCase
}
```

## 🔄 State Management

### Like Sync Between Screens
- **Delegate Pattern**: Clean communication between ViewModels
- **Real-time Updates**: Like an experience in details → automatically updates home screen
- **Local Cache**: UserDefaults for like states

## 📋 Development

### Branch Structure
- `main`: Production code
- `feature/*`: New features
- `hotfix/*`: Bug fixes

### Commit Format
```
feat: add experience details screen
fix: resolve like sync issue
docs: update README
```

## 🎯 Project Highlights

- ✅ **Clean Architecture** with proper separation of concerns
- ✅ **Offline-First** approach with intelligent caching
- ✅ **SOLID Principles** applied throughout
- ✅ **Testable** code with dependency injection
- ✅ **Modern iOS** patterns and best practices
- ✅ **Performance Optimized** with lazy loading and caching

## 👥 Authors

- **iOSAYed** - iOS Developer
- **Ahmed Nafie** - UI Developer

## 🙏 Acknowledgments

Built with modern iOS development practices and clean architecture principles.

---

**Repository**: [https://github.com/iOSayedAhmed/AroundEgyptTask](https://github.com/iOSayedAhmed/AroundEgyptTask)
