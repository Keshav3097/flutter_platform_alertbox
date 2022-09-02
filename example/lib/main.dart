import 'package:flutter/material.dart';
import 'package:flutter_platform_alertbox/flutter_platform_alertbox.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AlertBoxExample(),
    );
  }
}

class AlertBoxExample extends StatefulWidget {
  const AlertBoxExample({Key? key}) : super(key: key);

  @override
  State<AlertBoxExample> createState() => _AlertBoxExampleState();
}

class _AlertBoxExampleState extends State<AlertBoxExample> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("AlertBox Example")),
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            TextButton(
                onPressed: ()
                {
                  FlutterPlatFormAlertBox().informationDialogBox(
                      context: context,
                      title: "Alert Title",
                      body: "This is alert body",
                      heading: "This is alert heading"
                  );
                },
                child: Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                    "Information Box Alert"
                  ),
                )
            ),

            SizedBox(height: 10,),

            TextButton(
                onPressed: ()
                {
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
                },
                child: Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                      "Confirmation Box Alert"
                  ),
                )
            ),

            SizedBox(height: 10,),

            TextButton(
                onPressed: ()
                {
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
                },
                child: Container(
                  color: Colors.yellow,
                  padding: const EdgeInsets.all(8),
                  child: const Text(
                      "Delete Box Alert"
                  ),
                )
            ),
          ],
        ),
      ),
    );
  }
}
