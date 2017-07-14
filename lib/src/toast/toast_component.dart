abstract class Toast{
  int position;
  String title, message;

  String classNames;

  Toast(){
    this.title = "";
    this.message = "";
    this.classNames = "";
  }

  int getPosition() => this.position;

  void setPosition(int position) => this.position = position;

  void setTitle(String title) => this.title = title;

  void setMessage(String message) => this.message = message;

  // updateToast updates CSS classes when component position changes
  void updateCSS() {
    this.classNames = "pos"+this.position.toString();
  }

  void action();
}
