import 'package:angular2/core.dart';
import 'package:toastino/src/toast/toast_component.dart';
import 'package:toastino/src/toast/success_toast_component.dart';
import 'dart:core';
import 'dart:async';
import 'package:angular2/angular2.dart';

@Component(
    selector: 'toast-container',
    templateUrl: 'toast_container_component.html',
    styleUrls: const ['toast_container_component.css'],
)
class ToastContainer implements OnInit {
  // Toast component factory
  DynamicComponentLoader toastLoader;
  // Reference to toastContainer
  @ViewChild('toastContainer', read: ViewContainerRef)
  ViewContainerRef containerRef;

  // List of created and living toast
  List<ComponentRef> activeToasts;
  int next;

  ToastContainer(this.toastLoader, this.containerRef) {
    this.activeToasts = new List<ComponentRef>();
    this.next = 0;
  }

  @override
  ngOnInit() async {
  }

  void successToast(String title, String message){
    createToast(SuccessToast, title, message);
  }

  // Implementing FIFO style management
  // createToast creates a new toast component, puts data in it and save it into map using sequential keys
  void createToast(Type toastType, String title, String message) {
    toastLoader.loadNextToLocation(toastType, containerRef).then((ComponentRef cRef) {
      this.activeToasts.add(cRef);
      Toast toast = cRef.instance;
      toast.setPosition(this.next);
      toast.setTitle(title);
      toast.setMessage(message);
      toast.getStream().listen((t) => t.updateCss());
      next++;

      new Timer(new Duration(milliseconds: 400), () => toast.show());
      new Timer(new Duration(milliseconds: 4600), () => toast.hide());
      new Timer(new Duration(seconds: 5), () => removeFirstToast());
    });
  }

  // removeFirstToast removes the first toast in toastList
  void removeFirstToast() {
    this.activeToasts.first.destroy();
    this.activeToasts.removeAt(0);
    updateActiveToasts();
    next--;
  }

  // updateActiveToast updates positions after toast removal
  void updateActiveToasts(){
    for (ComponentRef cRef in this.activeToasts){
      Toast toast = cRef.instance;
      toast.setPosition(toast.getPosition()-1);
    }
  }
}


