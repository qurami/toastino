// Copyright (c) 2019, Marco Bramini, Qurami. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:core';

import 'package:angular/angular.dart';

/// A Toast component.
/// It's used to display a toast.
///
@Component(
  selector: 'toast',
  template: '{{title}}',
  styleUrls: ['toast_component.css'],
)
class ToastComponent {
  String _title;
  String get title => _title;

  ToastComponent();

  /// Initialize [ToastComponent].
  void init(String title) {
    _title = title;
  }
}
