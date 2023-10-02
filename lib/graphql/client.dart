import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import "package:fiveminslearn/contants.dart" as constants;

void main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    constants.GRAPHQL_ENDPOINT,
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
    // OR
    // getToken: () => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> graphqlClient = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );
}
