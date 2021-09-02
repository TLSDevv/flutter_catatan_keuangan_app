library transaction_result;

import 'dart:convert';

import 'package:built_collection/built_collection.dart';
import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/api/transaction_item.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/serializers.dart';

part 'transaction_result.g.dart';

abstract class TransactionResult
    implements Built<TransactionResult, TransactionResultBuilder> {
  @BuiltValueField(wireName: 'current_page')
  int? get currentPage;
  @BuiltValueField(wireName: 'total_pages')
  int? get totalPages;
  @BuiltValueField(wireName: 'per_page')
  int? get perPage;
  @BuiltValueField(wireName: 'data')
  BuiltList<TransactionItem>? get items;

  TransactionResult._();

  factory TransactionResult([updates(TransactionResultBuilder b)]) =
      _$TransactionResult;

  String toJson() {
    return json
        .encode(serializers.serializeWith(TransactionResult.serializer, this));
  }

  static TransactionResult? fromJson(String jsonString) {
    return serializers.deserializeWith(
        TransactionResult.serializer, json.decode(jsonString));
  }

  static Serializer<TransactionResult> get serializer =>
      _$transactionResultSerializer;
}
