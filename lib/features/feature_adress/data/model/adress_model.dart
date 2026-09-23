import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';

class AdressModel extends AdressEntity {
  AdressModel({
    required super.id,
    required super.name,
    required super.surname,
    required super.city,
    required super.district,
    required super.neigh,
    required super.street,
    required super.apartmentNo,
    required super.builderNo,
    required super.note,
  });

  factory AdressModel.fromFirestore(DocumentSnapshot document) {
    final snapshot = document.data() as Map<String, dynamic>?;
    return AdressModel(
      id: document.id,
      name: snapshot?["name"] ?? "",
      surname: snapshot?["surname"] ?? "",
      city: snapshot?["city"] ?? "",
      district: snapshot?["district"] ?? "",
      neigh: snapshot?["neigh"] ?? "",
      street: snapshot?["street"] ?? "",
      apartmentNo: snapshot?["apartment_no"] ?? "",
      builderNo: snapshot?["builder_no"] ?? "",
      note: snapshot?["note"] ?? "",
    );
  }

  factory AdressModel.toEntity(AdressEntity entity) {
    return AdressModel(
      id: entity.id,
      name: entity.name,
      surname: entity.surname,
      city: entity.city,
      district: entity.district,
      neigh: entity.neigh,
      street: entity.street,
      apartmentNo: entity.apartmentNo,
      builderNo: entity.builderNo,
      note: entity.note,
    );
  }

  AdressEntity toModel() {
    return AdressEntity(
      id: id,
      name: name,
      surname: surname,
      city: city,
      district: district,
      neigh: neigh,
      street: street,
      apartmentNo: apartmentNo,
      builderNo: builderNo,
      note: note,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "surname": surname,
      "city": city,
      "district": district,
      "neigh": neigh,
      "street": street,
      "apartment_no": apartmentNo,
      "builder_no": builderNo,
      "note": note,
    };
  }
}