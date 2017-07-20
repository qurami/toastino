# toastino

Toast component written in AngularDart.
Provides clear and easy to use notifying system. 

## Install

1. Add the dependency to your package's yaml file, provide a password and run pub get:

     ```yaml
    dependencies:
      toastino:
        git: git://qurami-robot:password@github.com/qurami/toastino.git
    ```
  
2. Add the marker '#toastino' to an html element near which you want to spawn toasts (toasts are created on the same level of the marked container):

     ```html
     <div>
       <span #toastino></span>
       <!-- Created toasts will appear here -->
     </div>
     ```

3. Create a new ToastManagerComponent in your class by this way:

    ```dart
    DynamicComponentLoader toastComponentLoader;
    @ViewChild('toastino', read: ViewContainerRef)
    ViewContainerRef toastContainerRef;
    
    ClassConstructor(this.toastComponentLoader, this.toastContainerRef)
    ToastManagerComponent toastManager = new ToastManagerComponent(toastComponentLoader, toastContainerRef);
    ```
    
4. Call ToastManager's toast method to create a new toast. 

---

## Libraries

- **[toast_manager_component](./lib/src/toast_manager_component.dart)** - The core of Toastino: It keep trace of every toast created and manages their positioning and removal.
