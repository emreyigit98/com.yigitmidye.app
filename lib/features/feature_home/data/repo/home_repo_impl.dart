import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_home/data/data_source/home_datasource_repo.dart';
import 'package:firebase_app/features/feature_home/data/mapper/home_mapper.dart';
import 'package:firebase_app/features/feature_home/data/models/category_model.dart';
import 'package:firebase_app/features/feature_home/data/models/product_model.dart';
import 'package:firebase_app/features/feature_home/domain/entities/category_entity.dart';
import 'package:firebase_app/features/feature_home/domain/entities/home_entity.dart';
import 'package:firebase_app/features/feature_home/domain/entities/product_entity.dart';
import 'package:firebase_app/features/feature_home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeDatasourceRepo _homeDatasourceRepo;
  HomeRepoImpl(this._homeDatasourceRepo);

  @override
  Future<Either<CustomException, HomeEntity>> getHomeData() async {
    
    try {
      final result = await Future.wait([
        _homeDatasourceRepo.getCategories(),
        _homeDatasourceRepo.getProducts(),
      ]);

      final categoryModels = result[0] as List<CategoryModel>;
      final productModels = result[1] as List<ProductModel>; 

      final categories = categoryModels.map((category) => category.toCategoryModel()).toList();
      final products = productModels.map((product) => product.toProductEntity()).toList();
      final initialCategory = categories.first;

      return Right(
        HomeEntity(
          categories: categories,
          products: products,
          initialCategory: initialCategory,
        ),
      );
    } catch (e) {
      return Left(e.toCustomException());
    }
  }
}