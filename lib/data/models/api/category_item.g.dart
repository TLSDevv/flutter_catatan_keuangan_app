// GENERATED CODE - DO NOT MODIFY BY HAND

part of category_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<CategoryItem> _$categoryItemSerializer =
    new _$CategoryItemSerializer();

class _$CategoryItemSerializer implements StructuredSerializer<CategoryItem> {
  @override
  final Iterable<Type> types = const [CategoryItem, _$CategoryItem];
  @override
  final String wireName = 'CategoryItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, CategoryItem object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.id;
    if (value != null) {
      result
        ..add('id')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.name;
    if (value != null) {
      result
        ..add('name')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.icon;
    if (value != null) {
      result
        ..add('icon')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.color;
    if (value != null) {
      result
        ..add('color')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  CategoryItem deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new CategoryItemBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'id':
          result.id = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'name':
          result.name = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'icon':
          result.icon = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'color':
          result.color = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$CategoryItem extends CategoryItem {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? icon;
  @override
  final String? color;

  factory _$CategoryItem([void Function(CategoryItemBuilder)? updates]) =>
      (new CategoryItemBuilder()..update(updates)).build();

  _$CategoryItem._({this.id, this.name, this.icon, this.color}) : super._();

  @override
  CategoryItem rebuild(void Function(CategoryItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  CategoryItemBuilder toBuilder() => new CategoryItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is CategoryItem &&
        id == other.id &&
        name == other.name &&
        icon == other.icon &&
        color == other.color;
  }

  @override
  int get hashCode {
    return $jf($jc($jc($jc($jc(0, id.hashCode), name.hashCode), icon.hashCode),
        color.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('CategoryItem')
          ..add('id', id)
          ..add('name', name)
          ..add('icon', icon)
          ..add('color', color))
        .toString();
  }
}

class CategoryItemBuilder
    implements Builder<CategoryItem, CategoryItemBuilder> {
  _$CategoryItem? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _icon;
  String? get icon => _$this._icon;
  set icon(String? icon) => _$this._icon = icon;

  String? _color;
  String? get color => _$this._color;
  set color(String? color) => _$this._color = color;

  CategoryItemBuilder();

  CategoryItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _icon = $v.icon;
      _color = $v.color;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(CategoryItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$CategoryItem;
  }

  @override
  void update(void Function(CategoryItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$CategoryItem build() {
    final _$result = _$v ??
        new _$CategoryItem._(id: id, name: name, icon: icon, color: color);
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
