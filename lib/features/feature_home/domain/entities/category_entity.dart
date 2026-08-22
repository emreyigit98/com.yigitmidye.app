
class CategoryEntity {
  final String categoryId;
  final String categoryName;
  final bool isActive;
  final int sort;

  CategoryEntity({
    required this.categoryId,
    required this.categoryName,
    required this.isActive,
    required this.sort
  });
}