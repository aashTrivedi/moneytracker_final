// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'entry_category.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EntryCategory _$EntryCategoryFromJson(Map<String, dynamic> json) {
  return _EntryCategory.fromJson(json);
}

/// @nodoc
mixin _$EntryCategory {
  int get categoryId => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  int get orderNum => throw _privateConstructorUsedError;
  CategoryIcon get icon => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EntryCategoryCopyWith<EntryCategory> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EntryCategoryCopyWith<$Res> {
  factory $EntryCategoryCopyWith(
          EntryCategory value, $Res Function(EntryCategory) then) =
      _$EntryCategoryCopyWithImpl<$Res, EntryCategory>;
  @useResult
  $Res call(
      {int categoryId,
      String title,
      String type,
      int orderNum,
      CategoryIcon icon});

  $CategoryIconCopyWith<$Res> get icon;
}

/// @nodoc
class _$EntryCategoryCopyWithImpl<$Res, $Val extends EntryCategory>
    implements $EntryCategoryCopyWith<$Res> {
  _$EntryCategoryCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? title = null,
    Object? type = null,
    Object? orderNum = null,
    Object? icon = null,
  }) {
    return _then(_value.copyWith(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as CategoryIcon,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $CategoryIconCopyWith<$Res> get icon {
    return $CategoryIconCopyWith<$Res>(_value.icon, (value) {
      return _then(_value.copyWith(icon: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EntryCategoryImplCopyWith<$Res>
    implements $EntryCategoryCopyWith<$Res> {
  factory _$$EntryCategoryImplCopyWith(
          _$EntryCategoryImpl value, $Res Function(_$EntryCategoryImpl) then) =
      __$$EntryCategoryImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int categoryId,
      String title,
      String type,
      int orderNum,
      CategoryIcon icon});

  @override
  $CategoryIconCopyWith<$Res> get icon;
}

/// @nodoc
class __$$EntryCategoryImplCopyWithImpl<$Res>
    extends _$EntryCategoryCopyWithImpl<$Res, _$EntryCategoryImpl>
    implements _$$EntryCategoryImplCopyWith<$Res> {
  __$$EntryCategoryImplCopyWithImpl(
      _$EntryCategoryImpl _value, $Res Function(_$EntryCategoryImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? categoryId = null,
    Object? title = null,
    Object? type = null,
    Object? orderNum = null,
    Object? icon = null,
  }) {
    return _then(_$EntryCategoryImpl(
      categoryId: null == categoryId
          ? _value.categoryId
          : categoryId // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as int,
      icon: null == icon
          ? _value.icon
          : icon // ignore: cast_nullable_to_non_nullable
              as CategoryIcon,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$EntryCategoryImpl implements _EntryCategory {
  const _$EntryCategoryImpl(
      {required this.categoryId,
      required this.title,
      required this.type,
      required this.orderNum,
      required this.icon});

  factory _$EntryCategoryImpl.fromJson(Map<String, dynamic> json) =>
      _$$EntryCategoryImplFromJson(json);

  @override
  final int categoryId;
  @override
  final String title;
  @override
  final String type;
  @override
  final int orderNum;
  @override
  final CategoryIcon icon;

  @override
  String toString() {
    return 'EntryCategory(categoryId: $categoryId, title: $title, type: $type, orderNum: $orderNum, icon: $icon)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EntryCategoryImpl &&
            (identical(other.categoryId, categoryId) ||
                other.categoryId == categoryId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.orderNum, orderNum) ||
                other.orderNum == orderNum) &&
            (identical(other.icon, icon) || other.icon == icon));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, categoryId, title, type, orderNum, icon);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EntryCategoryImplCopyWith<_$EntryCategoryImpl> get copyWith =>
      __$$EntryCategoryImplCopyWithImpl<_$EntryCategoryImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EntryCategoryImplToJson(
      this,
    );
  }
}

abstract class _EntryCategory implements EntryCategory {
  const factory _EntryCategory(
      {required final int categoryId,
      required final String title,
      required final String type,
      required final int orderNum,
      required final CategoryIcon icon}) = _$EntryCategoryImpl;

  factory _EntryCategory.fromJson(Map<String, dynamic> json) =
      _$EntryCategoryImpl.fromJson;

  @override
  int get categoryId;
  @override
  String get title;
  @override
  String get type;
  @override
  int get orderNum;
  @override
  CategoryIcon get icon;
  @override
  @JsonKey(ignore: true)
  _$$EntryCategoryImplCopyWith<_$EntryCategoryImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
