library serializers;

import 'package:built_collection/built_collection.dart';
import 'package:built_value/serializer.dart';
import 'package:built_value/standard_json_plugin.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/category_item.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/transaction_item.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/transaction_result.dart';

part 'serializers.g.dart';

@SerializersFor(const [TransactionResult, TransactionItem, CategoryItem])
final Serializers serializers =
    (_$serializers.toBuilder()..addPlugin(StandardJsonPlugin())).build();
