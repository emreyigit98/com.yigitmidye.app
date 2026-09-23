
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';

sealed class AdressEvent { const AdressEvent(); }

class SaveAdressEvent extends AdressEvent { 
  final AdressEntity entity;
  const SaveAdressEvent(this.entity);
}

class GetAdressEvent extends AdressEvent {
  const GetAdressEvent();
}

class DeleteAdressEvent extends AdressEvent {
  final AdressEntity entity;
  const DeleteAdressEvent(this.entity);
}