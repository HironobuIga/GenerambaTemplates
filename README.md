# GenerambaTemplates

Repository for Generamba Templates.
There are templates for architectures below.
I will add other architectures template in the future.

### MVC
Making templates of ViewController, ViewController.storyboard, Router.
It's compatible with Viper Architecture.
 
### MVVM
Making template of ViewController, ViewController.storyboard, ViewModel, Wireframe and their protocols.
 
## Usage
Please check URL below if you would like to know how to use generamba in your project.

* https://github.com/strongself/Generamba
 
### Git
1. In your project's Rambafile, add lines below.
2. Execute command `generamba template insatall`.Then there will be MVVM template in Templates folder.


```swift
# add this lines
catalogs:
- 'https://github.com/HironobuIga/GenerambaTemplates'
templates:
- { name: mvvm }
# end
```


 
### local
1. Locate Templates file into your project directory.
2. Add Lines below.
3. Execute command `generamba template insatall`.Then there will be MVVM template in Templates folder.

```swift
# add this lines
templates:
- { name: mvvm, local: 'Absolute path to your templates' }
# end
```
