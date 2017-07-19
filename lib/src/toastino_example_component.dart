import 'dart:core';
import 'package:angular2/core.dart';
import 'toastino/toast_manager_component.dart';

@Component(
  selector: 'toastino-example',
  templateUrl: 'toastino_example_component.html',
  directives: const [ToastManagerComponent],
)
class ToastinoExampleComponent{
  DynamicComponentLoader toastComponentLoader;

  @ViewChild('toastino', read: ViewContainerRef)
  ViewContainerRef viewContainerRef;

  ToastManagerComponent _toastManager;

  ToastinoExampleComponent(this.toastComponentLoader, this.viewContainerRef){
    this._toastManager = new ToastManagerComponent(toastComponentLoader, viewContainerRef);
  }

  void toast(String title){
    _toastManager.newToast(title, callback: (){print('hi');});
  }
}