// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kanban_board_cubit.dart';

// **************************************************************************
// CopyWithGenerator
// **************************************************************************

abstract class _$KanbanBoardStateCWProxy {
  KanbanBoardState status(KanbanBoardStatus status);

  KanbanBoardState cards(MapCards cards);

  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `KanbanBoardState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// KanbanBoardState(...).copyWith(id: 12, name: "My name")
  /// ```
  KanbanBoardState call({KanbanBoardStatus status, MapCards cards});
}

/// Callable proxy for `copyWith` functionality.
/// Use as `instanceOfKanbanBoardState.copyWith(...)` or call `instanceOfKanbanBoardState.copyWith.fieldName(value)` for a single field.
class _$KanbanBoardStateCWProxyImpl implements _$KanbanBoardStateCWProxy {
  const _$KanbanBoardStateCWProxyImpl(this._value);

  final KanbanBoardState _value;

  @override
  KanbanBoardState status(KanbanBoardStatus status) => call(status: status);

  @override
  KanbanBoardState cards(MapCards cards) => call(cards: cards);

  @override
  /// Creates a new instance with the provided field values.
  /// Passing `null` to a nullable field nullifies it, while `null` for a non-nullable field is ignored. To update a single field use `KanbanBoardState(...).copyWith.fieldName(value)`.
  ///
  /// Example:
  /// ```dart
  /// KanbanBoardState(...).copyWith(id: 12, name: "My name")
  /// ```
  KanbanBoardState call({
    Object? status = const $CopyWithPlaceholder(),
    Object? cards = const $CopyWithPlaceholder(),
  }) {
    return KanbanBoardState._(
      status: status == const $CopyWithPlaceholder() || status == null
          ? _value.status
          // ignore: cast_nullable_to_non_nullable
          : status as KanbanBoardStatus,
      cards: cards == const $CopyWithPlaceholder() || cards == null
          ? _value.cards
          // ignore: cast_nullable_to_non_nullable
          : cards as MapCards,
    );
  }
}

extension $KanbanBoardStateCopyWith on KanbanBoardState {
  /// Returns a callable class used to build a new instance with modified fields.
  /// Example: `instanceOfKanbanBoardState.copyWith(...)` or `instanceOfKanbanBoardState.copyWith.fieldName(...)`.
  // ignore: library_private_types_in_public_api
  _$KanbanBoardStateCWProxy get copyWith => _$KanbanBoardStateCWProxyImpl(this);
}
