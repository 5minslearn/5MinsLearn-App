import 'dart:developer';

import 'package:fiveminslearn/utils/ui.dart';

import 'package:flutter_dropdown_alert/model/data_alert.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void handleGraphqlError(OperationException? error, {bool? shoudShowAlert}) {
  if (error!.graphqlErrors.isNotEmpty) {
    log('Graphql Error:', error: error.graphqlErrors);

    if (shoudShowAlert!) {
      showNotify(
        title: "",
        message: error.graphqlErrors[0].message,
        type: TypeAlert.error,
      );
    }
  }
}
