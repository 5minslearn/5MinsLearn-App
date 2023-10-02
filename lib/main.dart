import 'package:fiveminslearn/screens/splash.dart';
import "package:fiveminslearn/contants.dart" as constants;

import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    constants.GRAPHQL_ENDPOINT,
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer <YOUR_PERSONAL_ACCESS_TOKEN>',
  );

  final Link link = authLink.concat(httpLink);

  ValueNotifier<GraphQLClient> graphqlClient = ValueNotifier(
    GraphQLClient(
      link: link,
      // The default store is the InMemoryStore, which does NOT persist to disk
      cache: GraphQLCache(store: HiveStore()),
    ),
  );

  runApp(MyApp(graphqlClient: graphqlClient));
}

class MyApp extends StatelessWidget {
  final ValueNotifier<GraphQLClient> graphqlClient;

  const MyApp({super.key, required this.graphqlClient});

  @override
  Widget build(BuildContext context) {
    return GraphQLProvider(
      client: graphqlClient,
      child: MaterialApp(
        title: '5MinsLearn',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          useMaterial3: true,
        ),
        home: const Splash(),
      ),
    );
  }
}
