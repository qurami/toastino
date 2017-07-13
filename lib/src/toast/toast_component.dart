

import 'package:angular2/core.dart';


@Component(
  selector: 'toast',
  templateUrl: 'toast_component.html',
  styleUrls: const ['toast_component.css'],
)
class Toast{
  int id;
  String title, message;

  Toast(){
    this.title = "";
    this.message = "";
  }

  void setTitle(String title){
    this.title = title;
  }

  int getId() => this.id;

  void setId(int id) {
    this.id = id;
  }

}
