library transaction_item;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/category_item.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/serializers.dart';

part 'transaction_item.g.dart';

abstract class TransactionItem
    implements Built<TransactionItem, TransactionItemBuilder> {
  int? get id;
  String? get name;
  String? get type;
  BuiltList<CategoryItem>? get categories;
  int? get amount;
  String? get desc;
  @BuiltValueField(wireName: 'latitidue')
  double? get lat;
  @BuiltValueField(wireName: 'longitude')
  double? get lon;
  String? get transactionAt;
  String? get createdAt;
  String? get updatedAt;

  TransactionItem._();

  factory TransactionItem([updates(TransactionItemBuilder b)]) =
      _$TransactionItem;

  String toJson() {
    return json
        .encode(serializers.serializeWith(TransactionItem.serializer, this));
  }

  static TransactionItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TransactionItem.serializer, json.decode(jsonString));
  }

  static Serializer<TransactionItem> get serializer =>
      _$transactionItemSerializer;
}
