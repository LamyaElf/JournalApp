# Journali 📔
Journali is a friendly companion app designed for lovers of daily reflection, helping users capture and preserve whatever crosses their mind throughout the day.

![Journali Cover](cover.png)

## ✨ Features
-  📝 Write a new journal entry anytime, with a title and your thoughts 
- ✏️ Edit and delete any journal entry anytime
- 🔍 Find any entry quickly by searching just one word
- 🔖 Bookmark your favorite journal entries
- 🗄️ Sort your journal by date or by bookmark
- 💾 Works offline; your entries stay saved even after closing the app


 ## 👩🏻‍💻 Technologies
- Swift
- SwiftUI
- MVVM
- Liquid Glass
- Codable

## 🎨 Design

Journali always uses a calm dark theme, made for writing your thoughts
anytime. The app icon adapts to your device's light, dark, or tinted mode,
and the interface uses Apple's native components with Liquid Glass.

- **Typography:** SF Pro
- **Icons:** SF Symbols

| | Color | Hex | Used for |
|---|---|---|---|
| ![](https://placehold.co/15x15/7F81FF/7F81FF.png) | Primary Accent | `#7F81FF` | Save button, active actions |
| ![](https://placehold.co/15x15/AF99FD/AF99FD.png) | Text Accent | `#AF99FD` | Journal titles, empty-state heading |
| ![](https://placehold.co/15x15/FFFFFF/FFFFFF.png) | Text Primary | `#FFFFFF` | Main headings, journal content |
| ![](https://placehold.co/15x15/A39A9A/A39A9A.png) | Text Secondary | `#A39A9A` | Entry dates |
| ![](https://placehold.co/15x15/1C1C1E/1C1C1E.png) | Surface Card | `#1C1C1E` | Journal cards |
| ![](https://placehold.co/15x15/FD453C/FD453C.png) | Destructive | `#FD453C` | Delete action |


## 📚 What I Learned

- **MVVM:** How to separate my app into a Model (what a journal entry is),
  a ViewModel (the logic), and Views (what the user sees).
- **Sharing data between screens:** Using `@StateObject` to create the
  ViewModel once, and `@ObservedObject` to pass it to other screens.
- **State & Binding:** How `@State` stores data inside a view, and how `$`
  lets another view read and change it.
- **Saving data offline:** Using `Codable` to save my journal entries to the
  device, so they stay after closing the app.
- **Native iOS components:** Building with sheets, alerts, swipe actions,
  search, and Liquid Glass instead of designing everything from scratch.
- **Handling empty states:** Showing the right message when there are no
  entries or no search results.
- **Debugging:** A single missing dot before `.sheet` froze my whole app,
  even though the build succeeded. Small details matter! 😅





