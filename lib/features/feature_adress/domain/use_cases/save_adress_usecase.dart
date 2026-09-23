
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_adress/domain/repo/adress_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class SaveAdressUsecase {
  final AdressRepo _adressRepo;
  SaveAdressUsecase(this._adressRepo);

  Future<Either<CustomException,Unit>> saveAdress(AdressEntity entity) {
    return _adressRepo.addAdress(entity);
  }
}