

import 'package:angular2/core.dart';


@Component(
  selector: 'toast',
  templateUrl: 'toast_component.html',
  host: const {'[class]' : 'classNames'},
  styleUrls: const ['toast_component.css'],
)
class Toast{
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

}
