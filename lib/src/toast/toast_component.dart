import 'dart:async';
abstract class Toast{
  // Toast position
  int position;

  String title, message;

  // List of toast's css classes
  List<String> cssClassesList;
  // cssClassesList to string
  String cssClasses;

  // Stream used to call updateCss() when something changes
  var streamController;
  Stream<Toast> stream;

  Toast(){
    this.title = "";
    this.message = "";

    this.cssClasses = "";
    this.cssClassesList = new List<String>();
    this.cssClasses = "hidden";

    this.streamController = new StreamController<Toast>();
    this.stream = this.streamController.stream;
  }

  int getPosition() => this.position;

  void setPosition(int position) => this.position = position;

  void setTitle(String title) => this.title = title;

  void setMessage(String message) => this.message = message;

  Stream<Toast> getStream() => this.stream;

  // updateCss updates CSS classes when component position changes
  String updateCss() {
    this.cssClasses = "";
    this.cssClassesList.forEach((String s) => this.cssClasses += s + " ");
    return cssClasses;
  }

  // Each toast has three animation case:
  // Hidden: become Showed after show() animation
  // Showed: become Faded-Out after hide() animation
  void show();

  void hide(){

  }
}