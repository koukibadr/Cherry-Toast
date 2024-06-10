# Cherry Toast

  

<p  align="center">

<img  src="https://github.com/koukibadr/Cherry-Toast/blob/main/cherry_toast_logo.gif?raw=true"  height="200"/>

<br>

<b>A new way to display toasts in Flutter in an elegant design and animations</b>

</p>

  

| ![info_cherry_toast.gif](https://github.com/koukibadr/Cherry-Toast/blob/main/example/info_cherry_toast.gif?raw=true) | ![error_cherry_toast.gif](https://github.com/koukibadr/Cherry-Toast/blob/main/example/error_cherry_toast.gif?raw=true) | ![bottom_cherry_toast.gif](https://github.com/koukibadr/Cherry-Toast/blob/main/example/bottom_cherry_toast.gif?raw=true) |
| -------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------ |
| ![warning_cherry_toast.gif](https://github.com/koukibadr/Cherry-Toast/blob/main/example/warning_cherry_toast.gif?raw=true) | ![success_cherry_toast.gif](https://github.com/koukibadr/Cherry-Toast/blob/main/example/success_cherry_toast.gif?raw=true) | ![right_layout_cherry_toast.gif](https://github.com/koukibadr/Cherry-Toast/blob/main/example/right_layout_cherry_toast.gif?raw=true) |

  

## Cherry Toast

  

- Support all platforms
- Top and Bottom display position
- Customizable background color
- Support RTL layout rendering (for arabic text)
- Multiple built-in themes
- Built-in animations
- Support null safety
- Elegant design
- Full customizable
- Heartbeat animation on icons
- Customizable icon size and color and display
- Dismissable notification
- Customizable toast constraints, height and width

## Installation

  

To add cherry toast to your project add this line to your `pubspec.yaml` file

  

```yaml
dependencies:
    cherry_toast: ^1.11.0
```

  

## Parameters

```dart
///Text widget displayed as a title in the toast
  ///required parameter for all toast types
  final Text? title;

  ///Text widget displayed as a description in the toast
  final Text? description;

  ///THe action button displayed below description
  ///by default there's no action added
  final Text? action;

  ///the toast icon, it's required when using the default constructor
  ///
  late IconData icon;

  ///the Icon color
  ///this parameter is only available on the default constructor
  ///for the built-in themes the color  will be set automatically
  late Color iconColor;
  //background color of container
  final Color backgroundColor;
  //box shadow color of container
  final Color shadowColor;
  //Custom widget displayed at the place of the predefined icons
  final Widget? iconWidget;

  ///the icon size
  ///by default is 20
  ///this parameter is available in default constructor
  late double iconSize;

  ///the toast display postion, possible values
  ///```dart
  ///{
  ///top,
  ///bottom
  ///}
  ///```
  final Position toastPosition;

  ///The color that will be applied on the circle behind the icon
  ///for better rendering the action button must have the same color
  ///
  late Color themeColor;

  ///the function invoked when clicking on the action button
  ///
  final Function? actionHandler;

  ///The duration of the animation by default it's 1.5 seconds
  ///
  final Duration animationDuration;

  ///the animation curve by default it's set to `Curves.ease`
  ///
  final Cubic animationCurve;

  ///The animation type applied on the toast
  ///```dart
  ///{
  ///fromTop,
  ///fromLeft,
  ///fromRight
  ///}
  ///```
  final AnimationType animationType;

  ///indicates whether the toast will be hidden automatically or not
  ///
  final bool autoDismiss;

  ///the duration of the toast if [autoDismiss] is true
  ///by default it's 3 seconds
  ///
  final Duration toastDuration;

  ///the layout of the toast
  ///```dart
  ///{
  ///ltr,
  ///rtl
  ///}
  ///```
  final ToastLayout layout;

  ///Display / Hide the close button icon
  ///by default it's true
  final bool displayCloseButton;

  ///define the border radius applied on the toast
  ///by default it's 20
  ///
  final double borderRadius;

  ///Define whether the icon will be  rendered or not
  ///
  final bool displayIcon;

  ///Define wether the animation on the icon will be rendered or not
  ///
  final bool enableIconAnimation;

  /// The attribute  is declaring a final variable named "width" of type double with a nullable value.
  /// width attribute define the toast width
  final double? width;

  /// The attribute is declaring a final variable named "height" of type double with a nullable type
  /// modifier.
  /// height attribute define the toast height
  final double? height;

  ///Enable taost constraints customization (by default it's null)
  final BoxConstraints? constraints;

  ///indicate whether the toast animation is enabled or not
  ///by default the toast animation is enabled
  final bool disableToastAnimation;

  /// Indicate toast should inherit theme colors sheme, to apply in background
  /// and shadow color.
  final bool inheritThemeColors;

  ///Callback invoked when toast get dismissed (closed by button or dismissed automtically)
  final Function()? onToastClosed;
```
  

## Usage

  

- Simple cherry toast with only title

  

```dart

CherryToast.success(

title:  Text("The simplest cherry toast", style: TextStyle(color: Colors.black))

).show(context);

  

```

  

- Simple cherry toast with action button

  

```dart

CherryToast.info(

title:  Text("User added", style: TextStyle(color: Colors.black)),

action: Text("Display information", style: TextStyle(color: Colors.black)),

actionHandler: (){

print("Action button pressed");

},

).show(context);

  

```

  

<p  align="center">

<img  src="https://github.com/koukibadr/Cherry-Toast/blob/main/example/cherry_toast_animation.gif?raw=true"  height="600"/>

<br>

  

<b>A new way to display toasts in Flutter in an elegant design and animations</b>

  

</p>

  

- Toast with description without title

  

```dart

CherryToast.warning(

description:  Text("All information may be deleted after this action", style: TextStyle(color: Colors.black)),

animationType:  AnimationType.fromLeft,

action:  Text("Backup data", style: TextStyle(color: Colors.black)),

actionHandler: (){

print("Hello World!!");

},

).show(context);

  

```

  

- Toast with nothing but description with different animation type and auto dismiss

  

```dart

CherryToast.error(

description:  Text("Invalid account information", style: TextStyle(color: Colors.black)),

animationType:  AnimationType.fromRight,

animationDuration:  Duration(milliseconds:  1000),

autoDismiss:  true

).show(context);

  

```

  

- Bottom displayed cherry toast

  

```dart

CherryToast(

icon:  Icons.alarm_add,

themeColor:  Colors.pink,

description:  Text("A bottom cherry toast example", style:  TextStyle(color:  Colors.black)),

toastPosition:  Position.bottom,

animationDuration:  Duration(milliseconds:  1000),

autoDismiss:  true

).show(context);

  
```

  

- Right layout rendered cherry toast

  

```dart

CherryToast(

icon:  Icons.car_repair,

themeColor:  Colors.green,

description: const Text("هذا مثال تصميم من اليمين",  style:  TextStyle(color:  Colors.black)),

toastPosition:  Position.bottom,

layout:  ToastLayout.rtl,

animationType:  AnimationType.fromRight,

action: const Text("انقر هنا", style:  TextStyle(color:  Colors.green)),


animationDuration: const Duration(milliseconds:  1000),

autoDismiss:  true)

.show(context);

  

```

  

## Contribution

  

Of course the project is open source, and you can contribute to it [repository link](https://github.com/koukibadr/Cherry-Toast)

  

- If you **found a bug**, open an issue.

- If you **have a feature request**, open an issue.

- If you **want to contribute**, submit a pull request.


## Contributors

<a  href  =  "https://github.com/koukibadr/Cherry-Toast/graphs/contributors">
<img  src  =  "https://contrib.rocks/image?repo=koukibadr/Cherry-Toast"/>
</a>
