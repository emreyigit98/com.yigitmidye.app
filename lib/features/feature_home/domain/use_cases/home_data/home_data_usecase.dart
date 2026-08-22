
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_home/domain/entities/home_entity.dart';
import 'package:firebase_app/features/feature_home/domain/repo/home_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class HomeDataUsecase {
  final HomeRepo _homeRepo;
  HomeDataUsecase(this._homeRepo);

  Future<Either<CustomException,HomeEntity>> getHomeData() async {
    return _homeRepo.getHomeData();
  }
}