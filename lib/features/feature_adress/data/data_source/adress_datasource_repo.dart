
import 'package:firebase_app/features/feature_adress/data/model/adress_model.dart';

abstract class AdressDatasourceRepo {
  Future<void> addAdress(AdressModel model);
  Future<List<AdressModel>> getAdress();
  Future<void> deleteAdress(AdressModel model); 
}