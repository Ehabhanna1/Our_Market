import 'package:equatable/equatable.dart';

import 'favorite_product.dart';
import 'purchase_table.dart';

class ProductsModel extends Equatable {
  final String? productId;
  final DateTime? createdAt;
  final String? productName;
  final String? price;
  final String? oldPrice;
  final String? sale;
  final String? discription;
  final String? category;
  final String? imageUrl;
  final List<FavoriteProduct>? favoriteProducts;
  final List<PurchaseTable>? purchaseTable;

  const ProductsModel({
    this.productId,
    this.createdAt,
    this.productName,
    this.price,
    this.oldPrice,
    this.sale,
    this.discription,
    this.category,
    this.imageUrl,
    this.favoriteProducts,
    this.purchaseTable,
  });

  factory ProductsModel.fromJson(Map<String, dynamic> json) => ProductsModel(
        productId: json['product_id'] as String?,
        createdAt: json['created_at'] == null
            ? null
            : DateTime.parse(json['created_at'] as String),
        productName: json['product_name'] as String?,
        price: json['price'] as String?,
        oldPrice: json['old_price'] as String?,
        sale: json['sale'] as String?,
        discription: json['discription'] as String?,
        category: json['category'] as String?,
        imageUrl: json['image_url'] as String?,
        favoriteProducts: (json['favorite_products'] as List<dynamic>?)
            ?.map((e) => FavoriteProduct.fromJson(e as Map<String, dynamic>))
            .toList(),
        purchaseTable: (json['purchase_table'] as List<dynamic>?)
            ?.map((e) => PurchaseTable.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'product_id': productId,
        'created_at': createdAt?.toIso8601String(),
        'product_name': productName,
        'price': price,
        'old_price': oldPrice,
        'sale': sale,
        'discription': discription,
        'category': category,
        'image_url': imageUrl,
        'favorite_products': favoriteProducts?.map((e) => e.toJson()).toList(),
        'purchase_table': purchaseTable?.map((e) => e.toJson()).toList(),
      };

  @override
  List<Object?> get props {
    return [
      productId,
      createdAt,
      productName,
      price,
      oldPrice,
      sale,
      discription,
      category,
      imageUrl,
      favoriteProducts,
      purchaseTable,
    ];
  }
}
