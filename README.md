# Random Dog Image Generator App (Flutter)

A simple Flutter application that fetches and displays random dog images using a REST API. This project demonstrates API integration, JSON parsing, and state management in Flutter.

## Features

* Fetch random dog images from API
* REST API integration using `http` package
* JSON data parsing using `fromJson()` model
* Loading indicator while fetching data
* Error handling for failed API responses
* Clean and simple UI

## Technologies Used

* Flutter (Dart)
* REST API
* HTTP Package
* JSON Parsing

## API Used

Dog CEO API
https://dog.ceo/api/breeds/image/random

## Project Structure

* `main.dart` → Entry point
* `home_screen.dart` → UI and API logic
* `image_model.dart` → Model class for JSON parsing

## How It Works

1. App starts and calls API
2. API returns JSON with image URL
3. Data is parsed into model class
4. Image is displayed on screen
5. Button click fetches new image

## Output

* Displays random dog image
* Click button to generate new image

## Learning Outcomes

* Understanding REST API integration
* Handling asynchronous programming (`async/await`)
* Using `setState()` for UI updates
* Creating model classes in Flutter

## Future Improvements

* Save favorite images (SharedPreferences)
* Store history (SQFlite)
* Download image feature


