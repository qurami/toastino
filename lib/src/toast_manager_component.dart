// Copyright (c) 2017, Marco Bramini, Qurami. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'dart:core';
import 'dart:async';
import 'package:angular2/angular2.dart';

import 'package:toastino/src/toast_component.dart';

/// A Toast manager component.
/// It creates and keeps trace of every [ToastComponent] created, managing their positioning and removal.
/// A new [ToastComponent] can be created using [newToast] method, after than [ToastComponent] has been initialized.
/// [newToast] takes as input the [ToastComponent]'s title and optional parameters, like callback.
///
/// __Example usage:__
///
///  ToastManagerComponent _toastManager;
///
///  ToastinoExampleComponent(DynamicComponentLoader toastComponentLoader, ViewContainerRef viewContainerRef){
///   _toastManager = new ToastManagerComponent(toastComponentLoader, viewContainerRef);
///  }
///
///  void toast(String title){
///   _toastManager.newToast(title, callback: (){print('hi');});
///  }
///
@Component(
  selector: 'toast-manager',
  template: '<ng-content></ng-content>',
)
class ToastManagerComponent {
  DynamicComponentLoader _toastComponentLoader;

  ViewContainerRef _viewContainerRef;

  List<ToastComponent> _activeToasts;
  int next;

  /// Constructor requires the injection of a [DynamicComponentLoader] and the [ViewContainerRef],
  /// next which new [ToastComponent]s will be appended.
  ToastManagerComponent(this._toastComponentLoader, this._viewContainerRef) {
    _activeToasts = new List<ToastComponent>();
    next = 0;
  }

  /// Handles the creation and removal of a new [ToastComponent] near the given [ViewContainerRef].
  void newToast(String title, {Function callback: null}) {
    this
        ._toastComponentLoader
        .loadNextToLocation(ToastComponent, _viewContainerRef)
        .then((ComponentRef cRef) {
      ToastComponent toast = cRef.instance;
      toast.init(title, next);
      _activeToasts.add(toast);
      next++;

      toast.show();
      new Timer(new Duration(milliseconds: 2500 * _activeToasts.length), () {
        toast.hide();
        new Timer(new Duration(milliseconds: 480), () {
          _killToast(cRef);
          callback();
        });
      });
    });
  }

  /// Removes a [ToastComponent] and updates every other's position.
  void _killToast(ComponentRef<ToastComponent> cRef) {
    _activeToasts.remove(cRef.instance);
    _activeToasts.forEach((ToastComponent toast) {
      if (toast.position > cRef.instance.position) toast.decreasePosition();
    });
    cRef.destroy();
    next--;
  }
}
