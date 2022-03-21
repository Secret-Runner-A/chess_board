# Squares
### A flexible chessboard widget for Flutter.

Squares is a chessboard like you've never seen before. Or more accurately, it is a chessboard very much like the ones you have seen before, but one that can do a pretty wide variety of things.

It is a UI package only, meaning it doesn't handle game logic. The [Bishop](https://pub.dev/packages/bishop) package is recommended for game logic, and there is also a small interoperability package, [Square Bishop](https://pub.dev/packages/square_bishop) that provides convenience methods for common type, a state for Squares to use, and extension methods on `Bishop.Game` that generate it.

There are two examples: a simple one in less than 100 lines, and a more complex and featureful app that demonstrates the various features of Squares in a realistic architecture.

Squares has a stateless `Board` widget that can used to display a complete board representation, and can be integrated at a low level with your own UI logic. However, the more likely use case involves the `BoardController` widget, which implements all of the piece selection and movement logic you're likely to need, including premoves and piece promotion.

### Features
* Highlighting previous moves, possible moves, check/checkmate
* Board themes
<br>
<img src="https://raw.githubusercontent.com/alexobviously/squares/main/screenshots/themes.gif" width="300"/>

* Highlight themes
<br>
<img src="https://raw.githubusercontent.com/alexobviously/squares/main/screenshots/highlight_themes.gif" width="300"/>

* Piece animations
<br>
<img src="https://raw.githubusercontent.com/alexobviously/squares/main/screenshots/animations.gif" width="300"/>

* Premoves
<br>
<img src="https://raw.githubusercontent.com/alexobviously/squares/main/screenshots/premoves.gif" width="300"/>

* Supports arbitrary board sizes and pieces
<br>
<img src="https://raw.githubusercontent.com/alexobviously/squares/main/screenshots/nano.gif" width="300"/>
<img src="https://raw.githubusercontent.com/alexobviously/squares/main/screenshots/capablanca.gif" width="300"/>
<img src="https://raw.githubusercontent.com/alexobviously/squares/main/screenshots/grand.gif" width="300"/>

* Piece promotion
<br>
<img src="https://raw.githubusercontent.com/alexobviously/squares/main/screenshots/promotion.gif" width="300"/>

* Flexible piece set definitions - any widget will do, use an svg, image asset, text, etc
<br>
<img src="https://raw.githubusercontent.com/alexobviously/squares/main/screenshots/piecesets.gif" width="300"/>

* Dropping pieces from hands (à la Crazyhouse)
<br>
<img src="https://raw.githubusercontent.com/alexobviously/squares/main/screenshots/crazyhouse.gif" width="300"/>