

import 'package:angular2/core.dart';


@Component(
  selector: 'toast',
  templateUrl: 'toast_component.html',
)
class Toast{
  String title, message;

  Toast(){
    this.title = "";
    this.message = "";
  }

  void setTitle(String title){
    this.title = title;
  }

}
