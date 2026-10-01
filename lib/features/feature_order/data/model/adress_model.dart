import 'package:firebase_app/features/feature_order/domain/entity/adress_entity.dart';

class AdressModel extends AdressEntity {

  AdressModel({
    required super.id,
    required super.apartmentNo,
    required super.builderNo,
    required super.city,
    required super.district,
    required super.name,
    required super.neigh,
    required super.street,
    required super.surname,
  });

  factory AdressModel.fromMap(Map<String, dynamic> map) {
    return AdressModel(
      id: map["id"] ?? "",
      apartmentNo: map["apartment_no"] ?? "",
      builderNo: map["builder_no"] ?? "",
      city: map["city"] ?? "",
      district: map["district"] ?? "",
      name: map["name"] ?? "",
      neigh: map["neigh"] ?? "",
      street: map["street"] ?? "",
      surname: map["surname"] ?? "",
    );
  }
}
