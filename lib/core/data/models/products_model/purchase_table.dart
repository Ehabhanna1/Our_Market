import 'package:equatable/equatable.dart';

class PurchaseTable extends Equatable {
  final String? id;
  final String? forUser;
  final bool? isBought;
  final DateTime? createdAt;
  final String? forProduct;

  const PurchaseTable({
    this.id,
    this.forUser,
    this.isBought,
    this.createdAt,
    this.forProduct,
  });

  factory PurchaseTable.fromJson(Map<String, dynamic> json) => PurchaseTable(
        id: json['id'] as String?,
        forUser: json['for_user'] as String?,
        isBought: json['is_bought'] as bool?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        forProduct: json['for_product'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'for_user': forUser,
        'is_bought': isBought,
        'created_at': createdAt?.toIso8601String(),
        'for_product': forProduct,
      };

  @override
  List<Object?> get props {
    return [
      id,
      forUser,
      isBought,
      createdAt,
      forProduct,
    ];
  }
}
