import 'dart:core';
import 'package:angular2/core.dart';

@Component(
  selector: 'toast',
  template: '{{title}}',
  styleUrls: const['toast_component.css'],
  host: const {'[style.top.px]' : 'position * 60'},
)
class ToastComponent{
  String _title;
  String get title => _title;

  int _position;
  int get position => _position;

  ToastComponent();

  void init(String title, int position) {
    this._title = title;
    this._position = position;
  }

  void decreasePosition(){
    _position--;
  }
}