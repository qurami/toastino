import 'toast_component.dart';
import 'package:angular2/core.dart';

@Component(
  selector: 'success-toast',
  templateUrl: 'toast_component.html',
  host: const {'[class]' : 'classNames'},
  styleUrls: const ['toast_component.css'],
)
class SuccessToast extends Toast{

  @override
  void action() {
   this.classNames = classNames + " success";
  }
}