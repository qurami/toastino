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

  // updateToast updates CSS classes when component position changes
  String cssClassesToString() {
    this.cssClasses = "";
    this.cssClassesList.forEach((String s) => this.cssClasses += s+" ");
    return cssClasses;
  }

  void updatePosition(){
    this.cssClassesList.removeWhere((String s) => (s.contains('pos')));
    this.cssClassesList.add("pos"+this.position.toString());
  }

  void show();

  void hide(){

  }
}
