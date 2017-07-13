import 'package:angular2/core.dart';
import 'package:angular2/platform/browser.dart';
import 'package:toastino/src/toast/toast_component.dart';
import 'dart:core';
import 'dart:html';
import 'dart:async';
import 'package:angular2/angular2.dart';
import 'package:angular_components/angular_components.dart';

@Component(
  selector: 'toast-container',
  template: '<span #toastContainer></span>'

)
class ToastContainer implements OnInit{
  DynamicComponentLoader toastLoader;
  @ViewChild('toastContainer', read:ViewContainerRef)
  ViewContainerRef containerRef;

  Map<int, Future<ComponentRef>> toastLoaded;
  int next;

  ToastContainer(this.toastLoader, this.containerRef){
    this.toastLoaded = new Map<int, Future<ComponentRef>>();
    this.next = 0;
  }

  @override
  ngOnInit() async {
    createToast();
    createToast();
    removeToast(0);
  }

  void createToast(){
    toastLoaded[this.next] = toastLoader.loadNextToLocation(Toast, containerRef);
    toastLoaded[this.next].then((ComponentRef c){Toast toast = c.instance; toast.setTitle("ciao");});
    next++;
    print(next);
  }

  void removeToast(int id){
    toastLoaded[id].then((ComponentRef c){print(c.toString()); c.destroy();});
  }
}
