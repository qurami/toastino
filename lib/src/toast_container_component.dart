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
    template: '<span #toastContainer></span><button (click)="createToast()">create</button><button (click)="removeFirstToast()">remove first</button>',
    styleUrls: const ['toast_container_component.css'],
)
class ToastContainer implements OnInit {
  DynamicComponentLoader toastLoader;
  @ViewChild('toastContainer', read: ViewContainerRef)
  ViewContainerRef containerRef;

  List<ComponentRef> toastLoaded;
  int next;

  ToastContainer(this.toastLoader, this.containerRef) {
    this.toastLoaded = new List<ComponentRef>();
    this.next = 0;
  }

  @override
  ngOnInit() async {
  }

  // Implementing FIFO style management
  // createToast creates a new toast component, puts data in it and save it into map using sequential keys
  void createToast() {
    toastLoader.loadNextToLocation(Toast, containerRef).then((ComponentRef cRef) {
      this.toastLoaded.add(cRef);
      Toast toast = cRef.instance;
      toast.setId(this.next);
      toast.setTitle("ciao"+this.next.toString());
      next++;
      print(next);
    });
  }

  //
  void removeFirstToast() {
    this.toastLoaded.first.destroy();
    this.toastLoaded.removeAt(0);
    updateActiveToasts();
    next--;
  }
  
  void updateActiveToasts(){
    this.toastLoaded.forEach((ComponentRef cRef) => cRef.instance.setId(cRef.instance.getId()-1));
  }
}
