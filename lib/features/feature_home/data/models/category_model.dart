import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel {
  final String categoryId;
  final String categoryName;
  final bool isActive;
  final int sort;

  CategoryModel({
    required this.categoryId,
    required this.categoryName,
    required this.isActive,
    required this.sort,
  });

  factory CategoryModel.fromFirestore(DocumentSnapshot doc) {
    final snapshot = doc.data() as Map<String, dynamic>?;
    return CategoryModel(
      categoryId: doc.id,
      categoryName: snapshot?["category_name"] ?? "",
      isActive: snapshot?["is_active"] ?? false,
      sort: snapshot?["sort"] ?? 1,
    );
  }
}