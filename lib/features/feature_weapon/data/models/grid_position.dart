import 'package:equatable/equatable.dart';

class GridPosition extends Equatable {
  final int? row;
  final int? column;

  const GridPosition({this.row, this.column});

  factory GridPosition.fromMap(Map<String, dynamic> data) => GridPosition(
    row: data['row'] as int?,
    column: data['column'] as int?,
  );

  Map<String, dynamic> toMap() => {
    'row': row,
    'column': column,
  };

  @override
  List<Object?> get props => [row, column];
}
