
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';

abstract class AdressRepo {
  Future<Either<CustomException,Unit>> addAdress(AdressEntity entity);
  Future<Either<CustomException,List<AdressEntity>>> getAdress();
  Future<Either<CustomException,Unit>> deleteAdress(AdressEntity entity);
}