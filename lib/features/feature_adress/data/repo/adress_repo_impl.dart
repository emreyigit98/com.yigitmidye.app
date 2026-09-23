
import 'package:dartz/dartz.dart';
import 'package:firebase_app/core/exceptions/custom_exception.dart';
import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_adress/data/data_source/adress_datasource_repo.dart';
import 'package:firebase_app/features/feature_adress/data/model/adress_model.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_adress/domain/repo/adress_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AdressRepo)
class AdressRepoImpl extends AdressRepo {

  final AdressDatasourceRepo _adressDatasourceRepo;
  AdressRepoImpl(this._adressDatasourceRepo);

  @override
  Future<Either<CustomException, Unit>> addAdress(AdressEntity entity) async {
    try {
      await _adressDatasourceRepo.addAdress(AdressModel.toEntity(entity));
      return Right(unit);
    }catch(exception) {
      return Left(exception.toCustomException());
    }
  }

  @override
  Future<Either<CustomException, List<AdressEntity>>> getAdress() async {
    try {
      final result = await _adressDatasourceRepo.getAdress();
      final adresses = result.map((adress) => adress.toModel()).toList();
      return Right(adresses);
    }catch(exception) {
      return Left(exception.toCustomException());
    }
  }

  @override
  Future<Either<CustomException, Unit>> deleteAdress(AdressEntity entity) async {
    try {
      await _adressDatasourceRepo.deleteAdress(AdressModel.toEntity(entity));
      return Right(unit);
    }catch(exception) {
      return Left(exception.toCustomException());
    }
  }
}