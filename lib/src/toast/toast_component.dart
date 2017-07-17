abstract class Toast{
  int position;

  String title, message;

  List<String> cssClassesList;
  String cssClasses;

  Toast(){
    this.title = "";
    this.message = "";
    this.cssClasses = "";
    this.cssClassesList = new List<String>();
    this.cssClasses = "hidden";
  }

  int getPosition() => this.position;

  void setPosition(int position) => this.position = position;

  void setTitle(String title) => this.title = title;

  void setMessage(String message) => this.message = message;

  // updateCss updates CSS classes when component position changes
  String updateCss() {
    this.cssClasses = "";
    this.cssClassesList.forEach((String s) => this.cssClasses += s+" ");
    return cssClasses;
  }

  // Each toast has three animation case:
  // Hidden: become showed after show() animation
  // Showed: become Fade-Out after hide() animation
  void show();

  void hide(){
  }
}
