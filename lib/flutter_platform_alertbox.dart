library flutter_platform_alertbox;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io' show Platform;

class FlutterPlatFormAlertBox{

  String cancel = "Cancel";
  String ok = "Ok";
  String close = "Close";

  confirmationDialogBox({
    required BuildContext context,
    required String title,
    required String content,
    required String cancelText,
    required String submitText,
    required bool isCancelable,
    required Function() onSubmit,
  })
  {
    if(Platform.isIOS)
    {
      return showCupertinoDialog<void>(
        context: context,
        barrierDismissible: isCancelable,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: TextWidget().dialogTitleText(text: title),
          content: TextWidget().dialogContentText(text: title),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: TextWidget().dialogButtonText(text: cancel),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: TextWidget().dialogButtonText(text: ok),
              isDestructiveAction: true,
              onPressed: ()
              {
                Navigator.pop(context);
                onSubmit();
              },
            )
          ],
        ),
      );
    }else{
      return showDialog(
        context: context,
        barrierDismissible: isCancelable,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextWidget().dialogTitleText(text: title),
            content: content == "" ? SizedBox(height: 0,) :TextWidget().dialogContentText(text: content),
            actions: [
              TextButton(
                child:TextWidget().dialogButtonText(text: cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child:TextWidget().dialogButtonText(text: ok),
                onPressed: ()
                {
                  Navigator.pop(context);
                  onSubmit();
                },
              )
            ],
          );
        },
      );
    }
  }

  informationDialogBox({
    required BuildContext context,
    required String title,
    required String body,
    required String heading,
  }){

    if(Platform.isIOS)
    {
      return showCupertinoDialog<void>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: TextWidget().dialogTitleText(text: heading),
          content: Container(
            padding: EdgeInsets.symmetric(horizontal: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                title == "" ? Container() :
                Column(
                  children: [

                    SizedBox(height: 15,),

                    TextWidget().dialogContentText(text: title)

                  ],
                ),

                SizedBox(height: 15,),

                TextWidget().dialogContentText(text: body)
              ],
            ),
          ),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: TextWidget().dialogButtonText(text: close),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
      );
    }else{
      return showDialog(
          context: context,
          builder: (BuildContext context) {
            return Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius:
                  BorderRadius.circular(5.0)),
              child: Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [

                    Container(
                      padding: EdgeInsets.all(8),
                      color: Colors.grey.shade200,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [

                          Container(
                            child:
                            TextWidget().dialogHeadingText(text: heading, maximumLine: 3),
                          ),

                          GestureDetector(
                            onTap: ()
                            {
                              Navigator.pop(context);
                            },
                            child: Container(
                              child: Icon(
                                Icons.close_outlined,
                                color: Colors.black,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),

                    SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [

                            SizedBox(height: 8),

                            title == "" ? Container() :
                            Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.symmetric(horizontal: 8),
                                  child: TextWidget().dialogTitleText(text: title),
                                ),

                                Divider(color: Colors.grey,thickness: 1,),
                              ],
                            ),

                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8),
                              alignment: Alignment.center,
                              child: TextWidget().dialogTitleText(text: body)
                            ),

                            SizedBox(height:8,),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }

  }


  deleteItemDialogBox({
    required BuildContext context,
    required String title,
    required String cancelText,
    required String submitText,
    required bool isCancelable,
    required Function() onSubmit,
  })
  {
    if(Platform.isIOS)
    {
      return showCupertinoDialog<void>(
        context: context,
        barrierDismissible: isCancelable,
        builder: (BuildContext context) => CupertinoAlertDialog(
          title: TextWidget().dialogTitleText(text: title),
          actions: <CupertinoDialogAction>[
            CupertinoDialogAction(
              child: TextWidget().dialogButtonText(text: cancel),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            CupertinoDialogAction(
              child: TextWidget().dialogButtonText(text: ok),
              isDestructiveAction: true,
              onPressed: ()
              {
                Navigator.pop(context);
                onSubmit();
              },
            )
          ],
        ),
      );
    }else{
      return showDialog(
        context: context,
        barrierDismissible: isCancelable,
        builder: (BuildContext context) {
          return AlertDialog(
            title: TextWidget().dialogTitleText(text: title),
            actions: [
              TextButton(
                child:TextWidget().dialogButtonText(text: cancel),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
              TextButton(
                child:TextWidget().dialogButtonText(text: ok),
                onPressed: ()
                {
                  Navigator.pop(context);
                  onSubmit();
                },
              )
            ],
          );
        },
      );
    }
  }
}


class TextWidget {


  Widget dialogHeadingText({required String text,required int maximumLine}) {
    return Text(
      text,
      overflow: TextOverflow.ellipsis,
      maxLines: maximumLine,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  dialogTitleText({required String text,int maxLines = 10,})
  {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  dialogContentText({required String text,int maxLines = 10,})
  {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.grey,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    );
  }

  dialogButtonText({required String text,int maxLines = 1,})
  {
    return Text(
      text,
      maxLines: maxLines,
      textAlign: TextAlign.center,
      overflow: TextOverflow.ellipsis,
      style: const TextStyle(
        color: Colors.black,
        fontSize: 15,
        fontWeight: FontWeight.normal,
      ),
    );
  }
}