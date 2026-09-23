
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_adress/domain/repo/adress_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAdresesUsecase {
  final AdressRepo _adressRepo;
  GetAdresesUsecase(this._adressRepo);

  Future<Either<CustomException,List<AdressEntity>>> getAdress() {
    return _adressRepo.getAdress();
  }
}