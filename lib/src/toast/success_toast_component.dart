import 'toast_component.dart';
import 'package:angular2/core.dart';

@Component(
  selector: 'success-toast',
  templateUrl: 'toast_component.html',
  host: const {'[class]' : 'cssClasses',
    '[style.top.px]' : 'position * 60'},
  styleUrls: const ['toast_component.css'],
)
class SuccessToast extends Toast{

  SuccessToast() : super();

  @override
  void show() {
   this.cssClassesList.add('success');
   print(super.updateCss());
  }
}