import 'package:angular2/core.dart';
import 'package:toastino/src/toast/toast_component.dart';
import 'package:toastino/src/toast/success_toast_component.dart';
import 'dart:core';
import 'package:angular2/angular2.dart';

@Component(
    selector: 'toast-container',
    template: '<span #toastContainer></span><button (click)="successToast()" style="position: absolute; bottom: 100px;">create</button><button (click)="removeFirstToast()" style="position: absolute; bottom: 80px;">remove first</button>',
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

  void successToast(){
    createToast(SuccessToast);
  }

  // Implementing FIFO style management
  // createToast creates a new toast component, puts data in it and save it into map using sequential keys
  void createToast(Type toastType) {
    toastLoader.loadNextToLocation(toastType, containerRef).then((ComponentRef cRef) {
      this.activeToasts.add(cRef);
      Toast toast = cRef.instance;
      toast.setId(this.next);
      toast.setTitle("ciao"+this.next.toString());
      toast.action();
      next++;
      print(next);
      //Timer to remove toast
    });
  }

  // removeFirstToast removes the first toast in toastList
  void removeFirstToast() {
    this.activeToasts.first.destroy();
    this.activeToasts.removeAt(0);
    updateActiveToasts();
    next--;
  }
  // updateActiveToast updates id after toast removal
  void updateActiveToasts(){
    this.activeToasts.forEach((ComponentRef cRef) => cRef.instance.setId(cRef.instance.getId()-1));
  }
}
