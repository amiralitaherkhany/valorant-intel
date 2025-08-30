import 'package:equatable/equatable.dart';

class DamageRange extends Equatable {
  final int? rangeStartMeters;
  final int? rangeEndMeters;
  final double? headDamage;
  final int? bodyDamage;
  final double? legDamage;

  const DamageRange({
    this.rangeStartMeters,
    this.rangeEndMeters,
    this.headDamage,
    this.bodyDamage,
    this.legDamage,
  });

  factory DamageRange.fromMap(Map<String, dynamic> data) => DamageRange(
    rangeStartMeters: data['rangeStartMeters'] as int?,
    rangeEndMeters: data['rangeEndMeters'] as int?,
    headDamage: (data['headDamage'] as num?)?.toDouble(),
    bodyDamage: data['bodyDamage'] as int?,
    legDamage: (data['legDamage'] as num?)?.toDouble(),
  );

  Map<String, dynamic> toMap() => {
    'rangeStartMeters': rangeStartMeters,
    'rangeEndMeters': rangeEndMeters,
    'headDamage': headDamage,
    'bodyDamage': bodyDamage,
    'legDamage': legDamage,
  };

  @override
  List<Object?> get props {
    return [
      rangeStartMeters,
      rangeEndMeters,
      headDamage,
      bodyDamage,
      legDamage,
    ];
  }
}
