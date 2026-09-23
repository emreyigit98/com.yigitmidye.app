
import 'package:equatable/equatable.dart';
import 'package:firebase_app/features/feature_adress/domain/entity/adress_entity.dart';
import 'package:firebase_app/features/feature_adress/presentation/state/adress_status.dart';

class AdressState extends Equatable {

  final AdressStatus status;
  final List<AdressEntity> adresses;

  const AdressState({
    this.status = const Idle(),
    this.adresses = const []
  });

  AdressState copyWith({
    AdressStatus? status,
    List<AdressEntity>? adresses
  }) {
    return AdressState(
      status: status ?? this.status,
      adresses: adresses ?? this.adresses
    );
  }

  @override
  List<Object?> get props => [status,adresses];
}