# Flutter Platform AlertBox

## Features

* Information AlertBox
* Confirmation AlertBox
* Delete Item AlertBox

## Supported platforms

* Flutter Android
* Flutter iOS
* Flutter web
* Flutter desktop

## Installation

Add `flutter_platform_alertbox: <latest_version>` to your `pubspec.yaml` dependencies. And import it:

```dart
import 'package:flutter_platform_alertbox/flutter_platform_alertbox.dart';
```

# How to Use


## information AlertBox
```          
 FlutterPlatFormAlertBox().informationDialogBox(
      context: context,
      title: "Alert Title",
      body: "This is alert body",
      heading: "This is alert heading"
  );
```

## Confirmation AlertBox
```          
 FlutterPlatFormAlertBox().confirmationDialogBox(
      context: context,
      title: "Alert Title",
      content: "This is alert body",
      cancelText: "Cancel",
      submitText: "Submit",
      isCancelable: true,
      onSubmit: ()
      {
        debugPrint("submit click");
      }
    );
```

## Delete Item AlertBox
```          
 FlutterPlatFormAlertBox().deleteItemDialogBox(
      context: context,
      title: "Are you sure to want to delete this item",
      cancelText: "Cancel",
      submitText: "Delete",
      isCancelable: true,
      onSubmit: ()
      {
        debugPrint("submit click");
      }
  );
```

## Screenshot

Android                   |  IOS
:-------------------------:|:-------------------------:
<img src="alert_android.gif" width="250" height="500">  |  <img src="alert_ios.gif" width="250" height="500">

![image](info_android.png)
![image](confirm_android.png)
![image](delete_android.png)

![image](info_ios.png)
![image](confirm_ios.png)
![image](delete_ios.png)