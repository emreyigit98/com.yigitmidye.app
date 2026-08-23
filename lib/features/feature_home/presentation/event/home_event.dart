
import 'package:firebase_app/features/feature_home/domain/entities/category_entity.dart';

sealed class HomeEvent { const HomeEvent(); }

class GetHomeDataEvent extends HomeEvent { const GetHomeDataEvent(); }
class SelectedCategoryEvent extends HomeEvent { 
  final CategoryEntity category;
  const SelectedCategoryEvent(this.category);
}