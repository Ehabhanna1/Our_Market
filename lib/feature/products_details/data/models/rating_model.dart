import 'package:equatable/equatable.dart';

class RatingModel extends Equatable {
  final String? id;
  final DateTime? createdAt;
  final String? forUser;
  final String? forProduct;
  final int? rate;

  const RatingModel({
    this.id,
    this.createdAt,
    this.forUser,
    this.forProduct,
    this.rate,
  });

  factory RatingModel.fromJson(Map<String, dynamic> json) => RatingModel(
        id: json['id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        forUser: json['for_user'] as String?,
        forProduct: json['for_product'] as String?,
        rate: json['rate'] as int?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'for_user': forUser,
        'for_product': forProduct,
        'rate': rate,
      };

  @override
  List<Object?> get props => [id, createdAt, forUser, forProduct, rate];
}
