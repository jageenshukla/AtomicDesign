# Atomic Design iOS Application

This project is an iOS application built using the **Atomic Design** methodology. It is written in Swift and leverages SwiftUI for building user interfaces. The application is structured into Atoms, Molecules, and Organisms, following the principles of Atomic Design.

## What is Atomic Design?
Atomic Design is a methodology for creating design systems by breaking down UI components into five distinct levels: Atoms, Molecules, Organisms, Templates, and Pages. To learn more about the origins and evolution of Atomic Design, check out [this blog post](https://medium.com/@jageenshukla/atomic-design-variants-origins-evolution-and-ios-implementation-e66df41ea637). For a detailed explanation of how this methodology is implemented in this project, read [this blog post](https://medium.com/@jageenshukla/revolutionize-your-ios-development-with-atomic-design-and-swiftui-eccda25808f8).

## Project Structure

The project is organized into the following folders:

- **Components**: Contains the UI components categorized into:
  - **Atoms**: Smallest building blocks (e.g., `LoginButton`, `SongTitle`).
  - **Molecules**: Groups of atoms (e.g., `SongCell`).
  - **Organisms**: Complex UI components (e.g., `LoginForm`, `SlidingMenu`).
- **Theme**: Manages themes and styles, including colors and fonts.
- **Views**: Contains the main views of the application (e.g., `ContentView`, `SongListView`).
- **Data**: Contains data models (e.g., `SongData`).
- **Assets**: Stores images, colors, and other assets.

## Class Structure

### Components
- **Atoms**:
  - `LoginButton`: A button styled according to the theme.
  - `SongTitle`: Displays the title of a song.
  - `SongSubtitle`: Displays the subtitle (e.g., artist name).
  - `ThemedTextField`: A text field styled with the current theme.
  - `SongCellImage`: Displays a circular image with a letter.

- **Molecules**:
  - `SongCell`: Combines `SongTitle`, `SongSubtitle`, and `SongCellImage` into a single cell.

- **Organisms**:
  - `LoginForm`: A login form with text fields and a button.
  - `SlidingMenu`: A side menu with options.
  - `DynamicNavigationBar`: A customizable navigation bar.
  - `SearchBar`: A search bar for filtering songs.

### Theme
- `Theme`: Defines colors and fonts for the application.
- `ThemeManager`: Manages the current theme and provides predefined themes (light, dark, custom).

### Views
- `ContentView`: The main entry point of the application.
- `SongListView`: Displays a list of songs.
- `FavoriteSongsView`: Displays a list of favorite songs.

### Data
- `Song`: A model representing a song.
- `SongData`: A collection of sample songs.

## Adapting Atomic Design Principles

For detailed instructions on how to adapt Atomic Design principles, use the Theme module, and implement components in your own projects, refer to [USAGE_GUIDE.md](USAGE_GUIDE.md).