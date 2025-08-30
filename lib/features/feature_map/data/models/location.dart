import 'package:equatable/equatable.dart';

class Location extends Equatable {
  final double? x;
  final double? y;

  const Location({this.x, this.y});

  factory Location.fromMap(Map<String, dynamic> data) => Location(
    x: (data['x'] as num?)?.toDouble(),
    y: (data['y'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    'x': x,
    'y': y,
  };

  Location copyWith({
    double? x,
    double? y,
  }) {
    return Location(
      x: x ?? this.x,
      y: y ?? this.y,
    );
  }

  @override
  List<Object?> get props => [x, y];
}
