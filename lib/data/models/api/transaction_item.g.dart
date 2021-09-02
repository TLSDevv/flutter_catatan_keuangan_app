// GENERATED CODE - DO NOT MODIFY BY HAND

part of transaction_item;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionItem> _$transactionItemSerializer =
    new _$TransactionItemSerializer();

class _$TransactionItemSerializer
    implements StructuredSerializer<TransactionItem> {
  @override
  final Iterable<Type> types = const [TransactionItem, _$TransactionItem];
  @override
  final String wireName = 'TransactionItem';

  @override
  Iterable<Object?> serialize(Serializers serializers, TransactionItem object,
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
    value = object.type;
    if (value != null) {
      result
        ..add('type')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.categories;
    if (value != null) {
      result
        ..add('categories')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(CategoryItem)])));
    }
    value = object.amount;
    if (value != null) {
      result
        ..add('amount')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.desc;
    if (value != null) {
      result
        ..add('desc')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.lat;
    if (value != null) {
      result
        ..add('latitidue')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.lon;
    if (value != null) {
      result
        ..add('longitude')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(double)));
    }
    value = object.transactionAt;
    if (value != null) {
      result
        ..add('transactionAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.createdAt;
    if (value != null) {
      result
        ..add('createdAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    value = object.updatedAt;
    if (value != null) {
      result
        ..add('updatedAt')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(String)));
    }
    return result;
  }

  @override
  TransactionItem deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionItemBuilder();

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
        case 'type':
          result.type = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'categories':
          result.categories.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(CategoryItem)]))!
              as BuiltList<Object?>);
          break;
        case 'amount':
          result.amount = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'desc':
          result.desc = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'latitidue':
          result.lat = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'longitude':
          result.lon = serializers.deserialize(value,
              specifiedType: const FullType(double)) as double?;
          break;
        case 'transactionAt':
          result.transactionAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'createdAt':
          result.createdAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
        case 'updatedAt':
          result.updatedAt = serializers.deserialize(value,
              specifiedType: const FullType(String)) as String?;
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionItem extends TransactionItem {
  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? type;
  @override
  final BuiltList<CategoryItem>? categories;
  @override
  final int? amount;
  @override
  final String? desc;
  @override
  final double? lat;
  @override
  final double? lon;
  @override
  final String? transactionAt;
  @override
  final String? createdAt;
  @override
  final String? updatedAt;

  factory _$TransactionItem([void Function(TransactionItemBuilder)? updates]) =>
      (new TransactionItemBuilder()..update(updates)).build();

  _$TransactionItem._(
      {this.id,
      this.name,
      this.type,
      this.categories,
      this.amount,
      this.desc,
      this.lat,
      this.lon,
      this.transactionAt,
      this.createdAt,
      this.updatedAt})
      : super._();

  @override
  TransactionItem rebuild(void Function(TransactionItemBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionItemBuilder toBuilder() =>
      new TransactionItemBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionItem &&
        id == other.id &&
        name == other.name &&
        type == other.type &&
        categories == other.categories &&
        amount == other.amount &&
        desc == other.desc &&
        lat == other.lat &&
        lon == other.lon &&
        transactionAt == other.transactionAt &&
        createdAt == other.createdAt &&
        updatedAt == other.updatedAt;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc(
            $jc(
                $jc(
                    $jc(
                        $jc(
                            $jc(
                                $jc(
                                    $jc($jc($jc(0, id.hashCode), name.hashCode),
                                        type.hashCode),
                                    categories.hashCode),
                                amount.hashCode),
                            desc.hashCode),
                        lat.hashCode),
                    lon.hashCode),
                transactionAt.hashCode),
            createdAt.hashCode),
        updatedAt.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransactionItem')
          ..add('id', id)
          ..add('name', name)
          ..add('type', type)
          ..add('categories', categories)
          ..add('amount', amount)
          ..add('desc', desc)
          ..add('lat', lat)
          ..add('lon', lon)
          ..add('transactionAt', transactionAt)
          ..add('createdAt', createdAt)
          ..add('updatedAt', updatedAt))
        .toString();
  }
}

class TransactionItemBuilder
    implements Builder<TransactionItem, TransactionItemBuilder> {
  _$TransactionItem? _$v;

  int? _id;
  int? get id => _$this._id;
  set id(int? id) => _$this._id = id;

  String? _name;
  String? get name => _$this._name;
  set name(String? name) => _$this._name = name;

  String? _type;
  String? get type => _$this._type;
  set type(String? type) => _$this._type = type;

  ListBuilder<CategoryItem>? _categories;
  ListBuilder<CategoryItem> get categories =>
      _$this._categories ??= new ListBuilder<CategoryItem>();
  set categories(ListBuilder<CategoryItem>? categories) =>
      _$this._categories = categories;

  int? _amount;
  int? get amount => _$this._amount;
  set amount(int? amount) => _$this._amount = amount;

  String? _desc;
  String? get desc => _$this._desc;
  set desc(String? desc) => _$this._desc = desc;

  double? _lat;
  double? get lat => _$this._lat;
  set lat(double? lat) => _$this._lat = lat;

  double? _lon;
  double? get lon => _$this._lon;
  set lon(double? lon) => _$this._lon = lon;

  String? _transactionAt;
  String? get transactionAt => _$this._transactionAt;
  set transactionAt(String? transactionAt) =>
      _$this._transactionAt = transactionAt;

  String? _createdAt;
  String? get createdAt => _$this._createdAt;
  set createdAt(String? createdAt) => _$this._createdAt = createdAt;

  String? _updatedAt;
  String? get updatedAt => _$this._updatedAt;
  set updatedAt(String? updatedAt) => _$this._updatedAt = updatedAt;

  TransactionItemBuilder();

  TransactionItemBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _id = $v.id;
      _name = $v.name;
      _type = $v.type;
      _categories = $v.categories?.toBuilder();
      _amount = $v.amount;
      _desc = $v.desc;
      _lat = $v.lat;
      _lon = $v.lon;
      _transactionAt = $v.transactionAt;
      _createdAt = $v.createdAt;
      _updatedAt = $v.updatedAt;
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionItem other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionItem;
  }

  @override
  void update(void Function(TransactionItemBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransactionItem build() {
    _$TransactionItem _$result;
    try {
      _$result = _$v ??
          new _$TransactionItem._(
              id: id,
              name: name,
              type: type,
              categories: _categories?.build(),
              amount: amount,
              desc: desc,
              lat: lat,
              lon: lon,
              transactionAt: transactionAt,
              createdAt: createdAt,
              updatedAt: updatedAt);
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'categories';
        _categories?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TransactionItem', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
