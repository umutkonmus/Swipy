# Swipy

Swipy is an iOS application that fetches random photos using the Unsplash API. Users can swipe right or left to like or dislike the photos. It is developed using the VIPER architecture.

## Features
- Fetch random photos using the Unsplash API
- Like or dislike photos by swiping right or left
- Modular and scalable structure with VIPER architecture
- Easy setup and integration

## Installation

### 1. Clone the Repository
```bash
git clone https://github.com/umutkonmus/Swipy.git
cd Swipy
```

### 2. Configure API Settings
Before running Swipy, you need to create an `APIConfiguration.swift` file inside the **Network** folder. The file should contain the following:

```swift
struct APIConfiguration {
    static let baseURL = "https://api.unsplash.com"
    static let randomPhotoPath = "/photos/random"
    static let apiKey = "YOUR_API_KEY"
    static let photoCount = 3
}
```

You can obtain your API key from [Unsplash Developers](https://unsplash.com/developers).

## Screenshots

![Simulator Screenshot - iPhone 16 Pro - 2025-03-23 at 21 09 19](https://github.com/user-attachments/assets/55811a9a-1cbe-497c-b8b0-63e5bd7e3be7) | ![Simulator Screenshot - iPhone 16 Pro - 2025-03-23 at 21 09 23](https://github.com/user-attachments/assets/d79acdb6-33bf-445a-84a0-db4a9bcca029) 
--- | ---
![Simulator Screenshot - iPhone 16 Pro - 2025-03-23 at 21 09 55](https://github.com/user-attachments/assets/bf90da92-3d39-4faa-914e-b8e5b269bb19) | ![Simulator Screenshot - iPhone 16 Pro - 2025-03-23 at 21 10 00](https://github.com/user-attachments/assets/c94b3369-755a-4dc1-89c7-769da619db68)

![Simulator Screenshot - iPhone 16 Pro - 2025-03-23 at 21 10 06](https://github.com/user-attachments/assets/6d78a285-1d55-4d0a-90b0-e4a2bf61454f)




## Usage

### 1. Run the Application
Open the project in Xcode and run it. Random photos will be displayed, and you can swipe right or left to make selections.

### 2. VIPER Architecture
Swipy is built following the **VIPER** architecture, which enhances code modularity, maintainability, and testability by separating concerns into distinct layers. Below are the five core components of VIPER and their roles in the project:

- **View**: Responsible for displaying the user interface and interacting with the user. It receives user inputs and forwards them to the **Presenter**.
- **Interactor**: Contains the business logic of the application. It fetches data from the **Unsplash API**, processes it, and sends the results back to the **Presenter**.
- **Presenter**: Acts as the intermediary between the **View** and the **Interactor**. It processes user inputs, requests data from the **Interactor**, and updates the **View** accordingly.
- **Entity**: Represents the data models used in the application, ensuring structured and efficient data handling.
- **Router**: Manages navigation and screen transitions, ensuring smooth user experience across different views.

This architecture ensures that the application remains scalable, modular, and easy to maintain while following clean code principles.

## Contributing
We welcome contributions! Please create an **issue** before submitting a **pull request**.

## License

![MIT License](https://img.shields.io/badge/license-MIT-blue.svg)

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
