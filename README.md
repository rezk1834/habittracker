```markdown
# Habit Tracker

A Habit Tracking application built with Flutter. This app allows users to create, update, and track their daily habits. The app features a heatmap to visualize habit completion over time.

## Features

- Add new habits.
- Update existing habits.
- Delete habits.
- Track daily habit completion.
- View progress over time using a heatmap.


## Getting Started

### Prerequisites

- Flutter installed on your machine.
- Dart SDK.

### Installation

1. Clone the repository:

```bash
git clone https://github.com/rezk1834/habittracker.git
```

2. Change to the project directory:

```bash
cd habittracker
```

3. Install the dependencies:

```bash
flutter pub get
```

4. Run the application:

```bash
flutter run
```

## Project Structure

```plaintext
lib/
├── components/
│   ├── alert.dart
│   ├── datetime.dart
│   ├── heatmap.dart
│   └── tile.dart
├── database/
│   └── database.dart
├── main.dart
├── drawer.dart
└── pages/
    └── home_page.dart
```

### Main Files

- `main.dart`: Entry point of the application.
- `home_page.dart`: The main page of the application where habits are displayed and managed.
- `database.dart`: Contains the `HabitDatabase` class which handles data storage and retrieval using Hive.
- `heatmap.dart`: Component to display the heatmap for visualizing habit completion.
- `alert.dart`: Custom alert dialog for adding and updating habits.
- `tile.dart`: Custom widget for displaying individual habits in the list.

## Usage

- **Add Habit**: Click on the floating action button and enter the habit name.
- **Update Habit**: Tap the settings icon next to the habit to update its name.
- **Delete Habit**: Tap the delete icon next to the habit to remove it from the list.
- **Track Habit**: Use the checkbox to mark a habit as completed for the day.
- **View Progress**: Check the heatmap at the top of the home page to see your progress over time.

## Dependencies

- [Flutter](https://flutter.dev)
- [Hive](https://pub.dev/packages/hive)
- [flutter_heatmap_calendar](https://pub.dev/packages/flutter_heatmap_calendar)

## Contributing

1. Fork the project.
2. Create your feature branch (`git checkout -b feature/AmazingFeature`).
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`).
4. Push to the branch (`git push origin feature/AmazingFeature`).
5. Open a Pull Request.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
```
"# habittracker" 
