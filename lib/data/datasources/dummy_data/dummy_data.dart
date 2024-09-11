import '../../../domain/entities/search/category_entity.dart';

final List<CategoryEntity> listCategoryChip = [
  CategoryEntity(id: 1, name: 'Technology'),
  CategoryEntity(id: 2, name: 'Science'),
  CategoryEntity(id: 3, name: 'Art'),
  CategoryEntity(id: 4, name: 'Music'),
  CategoryEntity(id: 5, name: 'Sports'),
  CategoryEntity(id: 6, name: 'Health'),
  CategoryEntity(id: 7, name: 'Education'),
  CategoryEntity(id: 8, name: 'Travel'),
  CategoryEntity(id: 9, name: 'Food'),
  CategoryEntity(id: 10, name: 'Fashion'),
  CategoryEntity(id: 11, name: 'Literature'),
  CategoryEntity(id: 12, name: 'History'),
  CategoryEntity(id: 13, name: 'Business'),
  CategoryEntity(id: 14, name: 'Finance'),
  CategoryEntity(id: 15, name: 'Movies'),
];

final List<Map<String, dynamic>> listCategoryJson = [
  {'id': 1, 'name': 'Technology'},
  {'id': 2, 'name': 'Science'},
  {'id': 3, 'name': 'Art'},
  {'id': 4, 'name': 'Music'},
  {'id': 5, 'name': 'Sports'},
  {'id': 6, 'name': 'Health'},
  {'id': 7, 'name': 'Education'},
  {'id': 8, 'name': 'Travel'},
  {'id': 9, 'name': 'Food'},
  {'id': 10, 'name': 'Fashion'},
  {'id': 11, 'name': 'Literature'},
  {'id': 12, 'name': 'History'},
  {'id': 13, 'name': 'Business'},
  {'id': 14, 'name': 'Finance'},
  {'id': 15, 'name': 'Movies'},
];

final List<CategoryEntity> listRateChip = [
  CategoryEntity(id: 0, name: 'All'),
  CategoryEntity(id: 1, name: '1 Star'),
  CategoryEntity(id: 2, name: '2 Stars'),
  CategoryEntity(id: 3, name: '3 Stars'),
  CategoryEntity(id: 4, name: '4 Stars'),
  CategoryEntity(id: 5, name: '5 Stars'),
];

final List<Map<String, dynamic>> searchHistory = [
  {"id": 1, "result": "Clean Architecture in Flutter"},
  {"id": 2, "result": "State Management with Riverpod"},
  {"id": 3, "result": "Flutter Hooks tutorial"},
  {"id": 4, "result": "Implementing BLoC in Flutter"},
  {"id": 5, "result": "Responsive UI design in Flutter"},
  {"id": 6, "result": "Firebase Authentication setup"},
  {"id": 7, "result": "Best practices for Flutter"},
  {"id": 8, "result": "Understanding Dart Null Safety"},
  {"id": 9, "result": "Creating animations in Flutter"},
  {"id": 10, "result": "Optimizing Flutter performance"},
];

final List<Map<String, dynamic>> searchResult = [
  {"id": 1, "result": "Understanding Flutter: A Comprehensive Guide"},
  {"id": 2, "result": "The Best Practices for Clean Architecture in Flutter"},
  {
    "id": 3,
    "result": "Riverpod vs Provider: Which State Management to Choose?"
  },
  {"id": 4, "result": "Building a Robust Authentication System in Flutter"},
  {"id": 5, "result": "Implementing Dark and Light Themes with Material 3"},
  {"id": 6, "result": "Managing User Sessions Effectively in Flutter"},
  {"id": 7, "result": "Creating Reusable Widgets with Flutter Hooks"},
  {"id": 8, "result": "Exploring the GoRouter for Efficient Navigation"},
  {"id": 9, "result": "Optimizing Performance in Flutter Apps"},
  {"id": 10, "result": "Using Freezed for Immutable Data Classes in Flutter"},
];

List<Map<String, dynamic>> jsonPromptList = [
  {
    "id": "1",
    "title": "Understanding Clean Architecture",
    "content": "Clean architecture is a software design philosophy...",
    "category": {
      "id": 1,
      "name": "Technology"
    },
    "rate": 4,
    "createdAt": "2024-08-09T10:00:00Z",
  },
  {
    "id": "2",
    "title": "Getting Started with Riverpod",
    "content":
    "Riverpod is a state management library for Flutter applications...",
    "category": {
      "id": 2,
      "name": "Science"
    },
    "rate": 5,
    "createdAt": "2024-08-08T12:00:00Z",
  },
  {
    "id": "3",
    "title": "Effective Use of Flutter Hooks",
    "content":
    "Flutter Hooks is a powerful library that allows you to use hooks...",
    "category": {
      "id": 3,
      "name": "Art"
    },
    "rate": 3,
    "createdAt": "2024-08-07T09:30:00Z",
  },
  {
    "id": "4",
    "title": "Introduction to BLoC Pattern",
    "content":
    "The BLoC pattern is a popular approach in Flutter for managing state...",
    "category": {
      "id": 4,
      "name": "Music"
    },
    "rate": 4,
    "createdAt": "2024-08-06T14:45:00Z",
  },
  {
    "id": "5",
    "title": "Building Responsive UI in Flutter",
    "content": "Learn how to create responsive layouts in Flutter...",
    "category": {
      "id": 5,
      "name": "Sports"
    },
    "rate": 5,
    "createdAt": "2024-08-05T16:20:00Z",
  },
  {
    "id": "6",
    "title": "Working with Firebase Authentication",
    "content": "Firebase Authentication provides a simple and secure way...",
    "category": {
      "id": 6,
      "name": "Health"
    },
    "rate": 4,
    "createdAt": "2024-08-04T11:00:00Z",
  },
  {
    "id": "7",
    "title": "Best Practices for Flutter Development",
    "content":
    "Discover the best practices to follow when developing Flutter applications...",
    "category": {
      "id": 7,
      "name": "Education"
    },
    "rate": 3,
    "createdAt": "2024-08-03T15:10:00Z",
  },
  {
    "id": "8",
    "title": "Exploring Dart Null Safety",
    "content":
    "Dart's null safety feature helps you avoid null reference errors...",
    "category": {
      "id": 8,
      "name": "Travel"
    },
    "rate": 4,
    "createdAt": "2024-08-02T13:35:00Z",
  },
  {
    "id": "9",
    "title": "Mastering Flutter Animations",
    "content":
    "Learn how to create smooth and beautiful animations in Flutter...",
    "category": {
      "id": 9,
      "name": "Food"
    },
    "rate": 5,
    "createdAt": "2024-08-01T10:15:00Z",
  },
  {
    "id": "10",
    "title": "Optimizing Flutter App Performance",
    "content":
    "Explore various techniques to optimize the performance of your Flutter applications...",
    "category": {
      "id": 10,
      "name": "Fashion"
    },
    "rate": 4,
    "createdAt": "2024-07-31T08:25:00Z",
  },
  {
    "id": "11",
    "title": "Advanced State Management Techniques",
    "content": "Dive deeper into state management techniques and patterns...",
    "category": {
      "id": 11,
      "name": "Literature"
    },
    "rate": 3,
    "createdAt": "2024-07-30T09:00:00Z",
  },
  {
    "id": "12",
    "title": "Understanding the Flutter Rendering Engine",
    "content":
    "A comprehensive guide to understanding how Flutter's rendering engine works...",
    "category": {
      "id": 12,
      "name": "History"
    },
    "rate": 5,
    "createdAt": "2024-07-29T11:20:00Z",
  },
  {
    "id": "13",
    "title": "Implementing Design Patterns in Flutter",
    "content": "Learn how to implement popular design patterns in Flutter...",
    "category": {
      "id": 13,
      "name": "Business"
    },
    "rate": 4,
    "createdAt": "2024-07-28T15:30:00Z",
  },
  {
    "id": "14",
    "title": "Flutter Web: Best Practices",
    "content":
    "Best practices for building responsive and accessible web applications using Flutter...",
    "category": {
      "id": 14,
      "name": "Finance"
    },
    "rate": 5,
    "createdAt": "2024-07-27T13:45:00Z",
  },
  {
    "id": "15",
    "title": "Using Flutter for Game Development",
    "content": "Discover how to use Flutter for building simple 2D games...",
    "category": {
      "id": 15,
      "name": "Movies"
    },
    "rate": 3,
    "createdAt": "2024-07-26T09:50:00Z",
  },
  {
    "id": "16",
    "title": "Working with Flutter's Isolates",
    "content":
    "An in-depth look at how to use isolates in Flutter for parallel processing...",
    "category": {
      "id": 1,
      "name": "Technology"
    },
    "rate": 4,
    "createdAt": "2024-07-25T11:10:00Z",
  },
  {
    "id": "17",
    "title": "Building Real-Time Apps with Flutter and Firebase",
    "content":
    "Learn how to build real-time apps using Flutter and Firebase Firestore...",
    "category": {
      "id": 2,
      "name": "Science"
    },
    "rate": 5,
    "createdAt": "2024-07-24T10:30:00Z",
  },
  {
    "id": "18",
    "title": "Securing Flutter Apps",
    "content":
    "Explore various techniques for securing Flutter applications...",
    "category": {
      "id": 3,
      "name": "Art"
    },
    "rate": 4,
    "createdAt": "2024-07-23T13:40:00Z",
  },
  {
    "id": "19",
    "title": "Using InheritedWidget for State Management",
    "content":
    "Understand how to use InheritedWidget for state management in Flutter...",
    "category": {
      "id": 4,
      "name": "Music"
    },
    "rate": 3,
    "createdAt": "2024-07-22T14:00:00Z",
  },
  {
    "id": "20",
    "title": "Migrating to Flutter 3.0",
    "content":
    "A step-by-step guide to migrating your existing Flutter projects to Flutter 3.0...",
    "category": {
      "id": 5,
      "name": "Sports"
    },
    "rate": 5,
    "createdAt": "2024-07-21T12:15:00Z",
  }
];

List<Map<String, dynamic>> jsonPromptHistoryList = [
  {
    "id": "1",
    "title": "Understanding Clean Architecture",
    "content":
        "Clean architecture is a software design philosophy that separates the concerns of the application into layers.",
    "category": "Architecture",
    "createdAt": "2024-08-09T10:00:00Z",
    "updatedAt": "2024-08-09T10:00:00Z"
  },
  {
    "id": "2",
    "title": "Getting Started with Riverpod",
    "content":
        "Riverpod is a state management library for Flutter applications, providing better control over state and dependency injection.",
    "category": "State Management",
    "createdAt": "2024-08-08T12:00:00Z",
    "updatedAt": "2024-08-08T12:00:00Z"
  },
  {
    "id": "3",
    "title": "Effective Use of Flutter Hooks",
    "content":
        "Flutter Hooks is a powerful library that allows you to use hooks to manage the lifecycle of stateful widgets.",
    "category": "Flutter",
    "createdAt": "2024-08-07T09:30:00Z",
    "updatedAt": "2024-08-07T09:30:00Z"
  },
  {
    "id": "4",
    "title": "Introduction to BLoC Pattern",
    "content":
        "The BLoC pattern is a popular approach in Flutter for managing state using reactive programming.",
    "category": "State Management",
    "createdAt": "2024-08-06T14:45:00Z",
    "updatedAt": "2024-08-06T14:45:00Z"
  },
  {
    "id": "5",
    "title": "Building Responsive UI in Flutter",
    "content":
        "Learn how to create responsive layouts in Flutter that adapt to different screen sizes and orientations.",
    "category": "Flutter",
    "createdAt": "2024-08-05T16:20:00Z",
    "updatedAt": "2024-08-05T16:20:00Z"
  },
  {
    "id": "6",
    "title": "Working with Firebase Authentication",
    "content":
        "Firebase Authentication provides a simple and secure way to integrate user authentication into your Flutter app.",
    "category": "Authentication",
    "createdAt": "2024-08-04T11:00:00Z",
    "updatedAt": "2024-08-04T11:00:00Z"
  },
];
