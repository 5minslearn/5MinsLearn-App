// ignore_for_file: constant_identifier_names
// ignore_for_file: non_constant_identifier_names

import 'package:fiveminslearn/utils/function.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

// Api
final String GRAPHQL_ENDPOINT = dotenv.env['FIVE_MINUTES_LEARN_APP_GRAPHQL_ENDPOINT']!;

// Blog
final int BLOGS_PER_PAGE_LIMIT = stringToInt(dotenv.env['FIVE_MINUTES_LEARN_APP_BLOGS_PER_PAGE_LIMIT']) ?? 10;

// Local storage path
const String LOCAL_STORAGE_PATH = "five_minutes_learn.json";

// Local storage keys
const String USER_AUTH_TOKEN = 'USER_AUTH_TOKEN';
const String USER_DETAILS = 'USER_DETAILS';
