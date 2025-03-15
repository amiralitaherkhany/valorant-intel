import 'package:equatable/equatable.dart';

import 'location.dart';

class Callout extends Equatable {
  final String? regionName;
  final String? superRegionName;
  final Location? location;

  const Callout({this.regionName, this.superRegionName, this.location});

  factory Callout.fromMap(Map<String, dynamic> data) => Callout(
        regionName: data['regionName'] as String?,
        superRegionName: data['superRegionName'] as String?,
        location: data['location'] == null
            ? null
            : Location.fromMap(data['location'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toMap() => {
        'regionName': regionName,
        'superRegionName': superRegionName,
        'location': location?.toMap(),
      };

  Callout copyWith({
    String? regionName,
    String? superRegionName,
    Location? location,
  }) {
    return Callout(
      regionName: regionName ?? this.regionName,
      superRegionName: superRegionName ?? this.superRegionName,
      location: location ?? this.location,
    );
  }

  @override
  List<Object?> get props => [regionName, superRegionName, location];
}
