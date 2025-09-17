import 'package:equatable/equatable.dart';

import 'grid_position.dart';

class ShopData extends Equatable {
  final int? cost;
  final String? category;
  final int? shopOrderPriority;
  final String? categoryText;
  final GridPosition? gridPosition;
  final bool? canBeTrashed;
  final dynamic image;
  final String? newImage;
  final dynamic newImage2;

  const ShopData({
    this.cost,
    this.category,
    this.shopOrderPriority,
    this.categoryText,
    this.gridPosition,
    this.canBeTrashed,
    this.image,
    this.newImage,
    this.newImage2,
  });

  factory ShopData.fromMap(Map<String, dynamic> data) => ShopData(
    cost: data['cost'] as int?,
    category: data['category'] as String?,
    shopOrderPriority: data['shopOrderPriority'] as int?,
    categoryText: data['categoryText'] as String?,
    gridPosition: data['gridPosition'] == null
        ? null
        : GridPosition.fromMap(data['gridPosition'] as Map<String, dynamic>),
    canBeTrashed: data['canBeTrashed'] as bool?,
    image: data['image'] as dynamic,
    newImage: data['newImage'] as String?,
    newImage2: data['newImage2'] as dynamic,
  );

  Map<String, dynamic> toMap() => {
    'cost': cost,
    'category': category,
    'shopOrderPriority': shopOrderPriority,
    'categoryText': categoryText,
    'gridPosition': gridPosition?.toMap(),
    'canBeTrashed': canBeTrashed,
    'image': image,
    'newImage': newImage,
    'newImage2': newImage2,
  };

  @override
  List<Object?> get props {
    return [
      cost,
      category,
      shopOrderPriority,
      categoryText,
      gridPosition,
      canBeTrashed,
      image,
      newImage,
      newImage2,
    ];
  }
}
