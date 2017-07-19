import 'package:angular2/core.dart';
import 'dart:core';
import 'dart:async';
import 'package:angular2/angular2.dart';

import 'toast_component.dart';

@Component(
  selector: 'toast-manager',
  template: '<ng-content></ng-content>',
)
class ToastManagerComponent{
  DynamicComponentLoader _toastComponentLoader;

  ViewContainerRef _viewContainerRef;

  List<ToastComponent> _activeToasts;
  int next;

  ToastManagerComponent(this._toastComponentLoader, this._viewContainerRef){
    _activeToasts = new List<ToastComponent>();
    next = 0;
  }

  void newToast(String title, {Function callback: null}){
    this._toastComponentLoader.loadNextToLocation(ToastComponent, _viewContainerRef).then((ComponentRef cRef){
      ToastComponent toast = cRef.instance;
      toast.init(title, next);
      _activeToasts.add(toast);
      next++;
      new Timer(new Duration(seconds: 3), (){
        killToast(cRef);
        callback();
      });
    });
  }

  void killToast(ComponentRef<ToastComponent> cRef){
    _activeToasts.remove(cRef.instance);
    _activeToasts.forEach((ToastComponent toast){
      if(toast.position > cRef.instance.position)
        toast.decreasePosition();
    });
    cRef.destroy();
    next--;
  }
}