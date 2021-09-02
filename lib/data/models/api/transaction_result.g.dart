// GENERATED CODE - DO NOT MODIFY BY HAND

part of transaction_result;

// **************************************************************************
// BuiltValueGenerator
// **************************************************************************

Serializer<TransactionResult> _$transactionResultSerializer =
    new _$TransactionResultSerializer();

class _$TransactionResultSerializer
    implements StructuredSerializer<TransactionResult> {
  @override
  final Iterable<Type> types = const [TransactionResult, _$TransactionResult];
  @override
  final String wireName = 'TransactionResult';

  @override
  Iterable<Object?> serialize(Serializers serializers, TransactionResult object,
      {FullType specifiedType = FullType.unspecified}) {
    final result = <Object?>[];
    Object? value;
    value = object.currentPage;
    if (value != null) {
      result
        ..add('current_page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.totalPages;
    if (value != null) {
      result
        ..add('total_pages')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.perPage;
    if (value != null) {
      result
        ..add('per_page')
        ..add(serializers.serialize(value, specifiedType: const FullType(int)));
    }
    value = object.items;
    if (value != null) {
      result
        ..add('data')
        ..add(serializers.serialize(value,
            specifiedType: const FullType(
                BuiltList, const [const FullType(TransactionItem)])));
    }
    return result;
  }

  @override
  TransactionResult deserialize(
      Serializers serializers, Iterable<Object?> serialized,
      {FullType specifiedType = FullType.unspecified}) {
    final result = new TransactionResultBuilder();

    final iterator = serialized.iterator;
    while (iterator.moveNext()) {
      final key = iterator.current as String;
      iterator.moveNext();
      final Object? value = iterator.current;
      switch (key) {
        case 'current_page':
          result.currentPage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'total_pages':
          result.totalPages = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'per_page':
          result.perPage = serializers.deserialize(value,
              specifiedType: const FullType(int)) as int?;
          break;
        case 'data':
          result.items.replace(serializers.deserialize(value,
                  specifiedType: const FullType(
                      BuiltList, const [const FullType(TransactionItem)]))!
              as BuiltList<Object?>);
          break;
      }
    }

    return result.build();
  }
}

class _$TransactionResult extends TransactionResult {
  @override
  final int? currentPage;
  @override
  final int? totalPages;
  @override
  final int? perPage;
  @override
  final BuiltList<TransactionItem>? items;

  factory _$TransactionResult(
          [void Function(TransactionResultBuilder)? updates]) =>
      (new TransactionResultBuilder()..update(updates)).build();

  _$TransactionResult._(
      {this.currentPage, this.totalPages, this.perPage, this.items})
      : super._();

  @override
  TransactionResult rebuild(void Function(TransactionResultBuilder) updates) =>
      (toBuilder()..update(updates)).build();

  @override
  TransactionResultBuilder toBuilder() =>
      new TransactionResultBuilder()..replace(this);

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is TransactionResult &&
        currentPage == other.currentPage &&
        totalPages == other.totalPages &&
        perPage == other.perPage &&
        items == other.items;
  }

  @override
  int get hashCode {
    return $jf($jc(
        $jc($jc($jc(0, currentPage.hashCode), totalPages.hashCode),
            perPage.hashCode),
        items.hashCode));
  }

  @override
  String toString() {
    return (newBuiltValueToStringHelper('TransactionResult')
          ..add('currentPage', currentPage)
          ..add('totalPages', totalPages)
          ..add('perPage', perPage)
          ..add('items', items))
        .toString();
  }
}

class TransactionResultBuilder
    implements Builder<TransactionResult, TransactionResultBuilder> {
  _$TransactionResult? _$v;

  int? _currentPage;
  int? get currentPage => _$this._currentPage;
  set currentPage(int? currentPage) => _$this._currentPage = currentPage;

  int? _totalPages;
  int? get totalPages => _$this._totalPages;
  set totalPages(int? totalPages) => _$this._totalPages = totalPages;

  int? _perPage;
  int? get perPage => _$this._perPage;
  set perPage(int? perPage) => _$this._perPage = perPage;

  ListBuilder<TransactionItem>? _items;
  ListBuilder<TransactionItem> get items =>
      _$this._items ??= new ListBuilder<TransactionItem>();
  set items(ListBuilder<TransactionItem>? items) => _$this._items = items;

  TransactionResultBuilder();

  TransactionResultBuilder get _$this {
    final $v = _$v;
    if ($v != null) {
      _currentPage = $v.currentPage;
      _totalPages = $v.totalPages;
      _perPage = $v.perPage;
      _items = $v.items?.toBuilder();
      _$v = null;
    }
    return this;
  }

  @override
  void replace(TransactionResult other) {
    ArgumentError.checkNotNull(other, 'other');
    _$v = other as _$TransactionResult;
  }

  @override
  void update(void Function(TransactionResultBuilder)? updates) {
    if (updates != null) updates(this);
  }

  @override
  _$TransactionResult build() {
    _$TransactionResult _$result;
    try {
      _$result = _$v ??
          new _$TransactionResult._(
              currentPage: currentPage,
              totalPages: totalPages,
              perPage: perPage,
              items: _items?.build());
    } catch (_) {
      late String _$failedField;
      try {
        _$failedField = 'items';
        _items?.build();
      } catch (e) {
        throw new BuiltValueNestedFieldError(
            'TransactionResult', _$failedField, e.toString());
      }
      rethrow;
    }
    replace(_$result);
    return _$result;
  }
}

// ignore_for_file: always_put_control_body_on_new_line,always_specify_types,annotate_overrides,avoid_annotating_with_dynamic,avoid_as,avoid_catches_without_on_clauses,avoid_returning_this,deprecated_member_use_from_same_package,lines_longer_than_80_chars,omit_local_variable_types,prefer_expression_function_bodies,sort_constructors_first,test_types_in_equals,unnecessary_const,unnecessary_new
