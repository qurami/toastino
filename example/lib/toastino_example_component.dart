// Copyright (c) 2017, Marco Bramini, Qurami. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'package:angular/angular.dart';
import 'package:angular/core.dart';
import 'package:toastino/toastino.dart';

@Component(
    selector: 'toastino-example',
    templateUrl: 'toastino_example_component.html')
class ToastinoExampleComponent {
  ToastManagerComponent _toastManager;

  ToastinoExampleComponent(SlowComponentLoader toastComponentLoader,
      ViewContainerRef viewContainerRef) {
    _toastManager =
        new ToastManagerComponent(toastComponentLoader, viewContainerRef);
  }

  void toast(String title) {
    _toastManager.newToast(title, callback: () {
      print('hi');
    });
  }
}
