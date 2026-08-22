
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_home/domain/entities/home_entity.dart';

abstract class HomeRepo {
  Future<Either<CustomException,HomeEntity>> getHomeData();
}