import 'package:fiveminslearn/widgets/text_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/alert_controller.dart';
import 'package:flutter_dropdown_alert/model/data_alert.dart';

Future<void> showAlertDialog(
  BuildContext context, {
  String? title,
  String? message,
  String? acceptTitle,
  String? rejectTitle,
  Function? onPressAccept,
  Function? onPressReject,
  TextStyle? titleStyle,
  TextStyle? messageStyle,
}) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return AlertDialog(
        title: title != null
            ? TextWidget(
                variant: TextVariant.title,
                style: titleStyle,
                text: title,
              )
            : null,
        content: message != null
            ? TextWidget(
                style: messageStyle,
                text: message,
              )
            : null,
        actions: <Widget>[
          if (onPressAccept != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onPressAccept();
              },
              child: TextWidget(
                style: const TextStyle(color: Colors.blue),
                text: acceptTitle ?? 'Yes',
              ),
            ),
          if (onPressReject != null)
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                onPressReject();
              },
              child: TextWidget(
                style: const TextStyle(color: Colors.blue),
                text: rejectTitle ?? 'No',
              ),
            ),
        ],
        shape: BeveledRectangleBorder(borderRadius: BorderRadius.circular(1)),
      );
    },
  );
}

void showNotify({String? title, String? message, TypeAlert type = TypeAlert.success}) {
  AlertController.show(title ?? "", message ?? "", type);
}
