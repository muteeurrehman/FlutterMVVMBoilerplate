# flutter_app_starter

Flutter MVVM Boilerplate

Flutter MVVM Boilerplate is a starter project for Flutter applications, designed to facilitate development using the MVVM (Model-View-ViewModel) architecture pattern along with the Provider package. This boilerplate provides a structured foundation with abstract classes, built-in navigation, and streamlined API handling, allowing developers to focus on building their app-specific features.

Features

MVVM Architecture: Separation of concerns into models, views, and view models for improved code organization and maintainability.
Provider Package: State management using the Provider package, enabling efficient data flow between components.
Abstract Classes: Pre-defined abstract classes for screens and view models to accelerate development and ensure consistency.
Built-in Navigation: Configured navigation setup for seamless transition between screens.
API Handling: Streamlined API handling with abstract methods for fetching data from endpoints and handling responses.
Example Screen: Includes an example screen to demonstrate fetching and displaying a list of birds from an API, which developers can easily modify or remove.
Getting Started

Clone the repository:
bash
Copy code
git clone https://github.com/muteeurrehman/FlutterMVVMBoilerplate.git
Update the base URLs in lib/business_logic/misc/constants.dart with your API Base URLs.
You can set your other constants too in this file.
Define your API endpoints in lib/business_logic/misc/enums.dart using the APIEndPoint enum. You can write your enums here.
Customize or remove the example screen and view model located in the lib/screens directory.
Start building your Flutter app by writing screens, view models, and service classes following the MVVM pattern.
Update assets with your own assets.

Usage

Screens: Create new screens by extending the Screen abstract class located in lib/mvvm/view.abs.dart.
Screen View Models: Implement view models for screens by extending the ScreenViewModel abstract class located in lib/mvvm/view_model.abs.dart.
View Models: Implement view models by extending the ViewModel abstract class located in lib/mvvm/view_model.abs.dart.
Repositories: Define repository classes for handling data retrieval and business logic.
Navigation: Utilize the built-in navigation setup for navigating between screens using the Navigator class. See how navigation is implemented from BirdsList screen to BirdDetails screen and back from BirdDetails to BirdsList.

Customise all the classes as per your app requirements.

Contributing

Contributions are welcome! If you have any suggestions, feature requests, or bug reports, please open an issue or submit a pull request.

License

This project is licensed under the MIT License - see the LICENSE file for details.

