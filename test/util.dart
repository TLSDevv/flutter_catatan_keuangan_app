import 'dart:io';

import 'package:flutter_aplikasi_catatan_keuangan_app/constants/api_url.dart';

String fixtures(String name) =>
    File('test/data/fixtures/$name.json').readAsStringSync();

Uri defineUri(String path, {Map<String, String>? params}) =>
    Uri.https('$BASE_URL', '$path', params);
