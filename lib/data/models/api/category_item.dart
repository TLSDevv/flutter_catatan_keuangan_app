library category_item;

import 'dart:convert';

import 'package:built_value/built_value.dart';
import 'package:built_value/serializer.dart';
import 'package:flutter_aplikasi_catatan_keuangan_app/data/models/serializers.dart';

part 'category_item.g.dart';

abstract class CategoryItem
    implements Built<CategoryItem, CategoryItemBuilder> {
  int? get id;
  String? get name;
  String? get icon;
  String? get color;

  CategoryItem._();

  factory CategoryItem([updates(CategoryItemBuilder b)]) = _$CategoryItem;

  String toJson() {
    return json
        .encode(serializers.serializeWith(CategoryItem.serializer, this));
  }

  static CategoryItem? fromJson(String jsonString) {
    return serializers.deserializeWith(
        CategoryItem.serializer, json.decode(jsonString));
  }

  static Serializer<CategoryItem> get serializer => _$categoryItemSerializer;
}
