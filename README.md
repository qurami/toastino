# toastino

Toast component written in AngularDart.
Provides clear and easy to use notifying system. 

## Usage

1. Create a new ToastManagerComponent in your class by this way:

    ```dart
     ToastManagerComponent _toastManager;

      ToastinoExampleComponent(DynamicComponentLoader toastComponentLoader, ViewContainerRef viewContainerRef){
           _toastManager = new ToastManagerComponent(toastComponentLoader, viewContainerRef);
      }
    ```

2. Call ToastManager's toast method to create a new toast.

---

## Libraries

- **[toast_manager_component](./lib/src/toast_manager_component.dart)** - The core of Toastino: It keep trace of every toast created and manages their positioning and removal.
