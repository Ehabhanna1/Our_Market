import 'package:equatable/equatable.dart';

class CommentDataModel extends Equatable {
  final String? id;
  final DateTime? createdAt;
  final String? comment;
  final String? forUser;
  final String? forProduct;
  final dynamic userName;
  final dynamic replay;

  const CommentDataModel({
    this.id,
    this.createdAt,
    this.comment,
    this.forUser,
    this.forProduct,
    this.userName,
    this.replay,
  });

  factory CommentDataModel.fromJson(Map<String, dynamic> json) {
    return CommentDataModel(
      id: json['id'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      comment: json['comment'] as String?,
      forUser: json['for_user'] as String?,
      forProduct: json['for_product'] as String?,
      userName: json['user_name'] as dynamic,
      replay: json['replay'] as dynamic,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'created_at': createdAt?.toIso8601String(),
        'comment': comment,
        'for_user': forUser,
        'for_product': forProduct,
        'user_name': userName,
        'replay': replay,
      };

  @override
  bool get stringify => true;

  @override
  List<Object?> get props {
    return [
      id,
      createdAt,
      comment,
      forUser,
      forProduct,
      userName,
      replay,
    ];
  }
}
