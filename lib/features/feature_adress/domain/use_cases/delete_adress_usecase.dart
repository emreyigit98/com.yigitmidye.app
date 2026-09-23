
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_adress/domain/repo/adress_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class DeleteAdressUsecase {
  final AdressRepo _adressRepo;
  DeleteAdressUsecase(this._adressRepo);

  Future<Either<CustomException,Unit>> deleteAdress(AdressEntity entity) {
    return _adressRepo.deleteAdress(entity);
  }
}