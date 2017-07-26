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

2. Call ToastManager's newToast method to create a new toast.

   ```dart
    _toastManager.newToast(title, callback);
   ```
   
---

## Libraries

- **[toast_manager_component](./lib/src/toast_manager_component.dart)** - The core of Toastino: It keeps trace of every toast created and manages their positioning and removal.
