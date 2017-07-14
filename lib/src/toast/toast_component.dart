abstract class Toast{
  int id;
  String title, message;

  String classNames;

  Toast(){
    this.title = "";
    this.message = "";
    this.classNames = "";
  }

  void setTitle(String title){
    this.title = title;
  }

  int getId() => this.id;

  void setId(int id) {
    this.id = id;
    this.classNames = "pos"+id.toString();
  }

  void action();
}
