import 'dart:core';
import 'package:angular2/core.dart';
import 'package:toastino/toastino.dart';

@Component(
  selector: 'toastino-example',
  templateUrl: 'toastino_example_component.html',
)
class ToastinoExampleComponent{
  ToastManagerComponent _toastManager;

  ToastinoExampleComponent(DynamicComponentLoader toastComponentLoader, ViewContainerRef viewContainerRef){
    _toastManager = new ToastManagerComponent(toastComponentLoader, viewContainerRef);
  }

  void toast(String title){
    _toastManager.newToast(title, callback: (){print('hi');});
  }
}