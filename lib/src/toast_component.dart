// Copyright (c) 2017, Marco Bramini. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

import 'dart:core';
import 'package:angular2/core.dart';

/// A Toast component.
/// It is created by a [ToastManager], which handles its positioning and removal too.
///
/// [ToastComponent]'s [_position] affects the host's top property. TODO: optional positioning of toasts and mobile
///
@Component(
    selector: 'toast',
    template: '{{title}}',
    styleUrls: const [
      'toast_component.css'
    ],
    host: const {
      '[style.top.px]': 'position * 60',
      '[style.animation-name]': 'animation'
    },
    styles: const ['''
@-webkit-keyframes show {
from{top:100%; opacity: 0}
to{top:position; opacity: 1}
}
@keyframes show {
from{top:100%; opacity: 0}
to{top:position; opacity: 1}
}
@-webkit-keyframes hide {
from{top:position; opacity: 1}
to{top:-10%; opacity: 0}
}
@keyframes hide {
from{top:position; opacity: 1}
to{top:-10%; opacity: 0}
}
'''
    ])
class ToastComponent {
  String _title;

  String get title => _title;

  int _position;

  int get position => _position;

  String _animation;

  String get animation => _animation;

  ToastComponent();

  /// Initialize [ToastComponent].
  void init(String title, int position) {
    _title = title;
    _position = position;
  }

  /// Decrease [ToastComponent]'s position by one.
  void decreasePosition() {
    _position--;
  }

  void show() {
    _animation = "show";
  }

  void hide() {
    _animation = "hide";
  }
}
