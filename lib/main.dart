import 'package:fiveminslearn/screens/splash.dart';
import 'package:fiveminslearn/constants.dart' as constants;
import 'package:fiveminslearn/utils/function.dart';

import 'package:flutter/material.dart';
import 'package:flutter_dropdown_alert/dropdown_alert.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter();

  final HttpLink httpLink = HttpLink(
    constants.GRAPHQL_ENDPOINT,
  );

  final AuthLink authLink = AuthLink(
    getToken: () async => 'Bearer $getUserAuthToken()',
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
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        builder: (context, child) => Stack(
          children: [
            child!,
            const DropdownAlert(),
          ],
        ),
        home: const Splash(),
      ),
    );
  }
}
