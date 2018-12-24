// Copyright (c) 2017, Marco Bramini, Qurami. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.
import 'dart:async';
import 'dart:core';

import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:toastino/src/toast_component.dart';
import 'package:toastino/src/toast_component.template.dart' as toastino;

/// A Toast manager component.
/// It handles the creation of [ToastComponent]s, one at a time, and schedules their removal.
///
/// A new [ToastComponent] can be created using [newToast] method, after than [ToastComponent] has been initialized.
/// [newToast] takes as input the [ToastComponent]'s title and optional parameters, like callback.
///
/// __Example usage:__
///
///  ToastManagerComponent _toastManager;
///
///  ToastinoExampleComponent(SlowComponentLoader toastComponentLoader, ViewContainerRef viewContainerRef){
///   _toastManager = new ToastManagerComponent(toastComponentLoader, viewContainerRef);
///  }
///
///  void toast(String title){
///   _toastManager.newToast(title, callback: (){print('hi');});
///  }
///
@Component(selector: 'toast-manager', template: '<ng-content></ng-content>')
class ToastManagerComponent {
  ComponentLoader _toastComponentLoader;

  ViewContainerRef _viewContainerRef;

  StreamController<String> _streamController;
  Stream<String> _stream;

  List<Map> _toastsQueue;

  ComponentRef _activeToastRef;

  /// Constructor requires the injection of a [ComponentLoader] and the [ViewContainerRef],
  /// next which new [ToastComponent]s will be appended.
  ToastManagerComponent(this._toastComponentLoader, this._viewContainerRef) {
    _streamController = new StreamController<String>();
    _stream = _streamController.stream;
    _toastsQueue = new List<Map>();

    _stream.listen((String eventType) {
      if (eventType == "toast_added" && _activeToastRef == null)
        loadNextToast();
      else if (eventType == "toast_removed" && _toastsQueue.length > 0)
        loadNextToast();
    });
  }

  /// Adds new toast properties list to [_toastsQueue] list.
  /// An event is propagated to trigger [ToastComponent] loading.
  void newToast(String title, {Function callback: null}) {
    _toastsQueue.add({"title": title, "callback": callback});
    _streamController.add("toast_added");
  }

  /// Creates dynamically a [ToastComponent] near [_viewContainerRef] and schedules its removal.
  /// When removal is completed, an event is propagated.
  void loadNextToast() {
    ComponentRef cRef = _toastComponentLoader.loadNextToLocation(
      toastino.ToastComponentNgFactory,
      _viewContainerRef,
    );
    _activeToastRef = cRef;
    ToastComponent toast = cRef.instance;
    toast.init(_toastsQueue.first['title']);

    _toastsQueue.remove(_toastsQueue.first);

    toast.show();
    new Timer(
      new Duration(milliseconds: 3000),
      () {
        toast.hide();
        new Timer(
          new Duration(milliseconds: 500),
          () {
            cRef.destroy();
            _activeToastRef = null;
            _streamController.add("toast_removed");
          },
        );
      },
    );
  }
}
