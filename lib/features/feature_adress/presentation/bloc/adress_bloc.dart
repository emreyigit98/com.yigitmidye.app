import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_adress/domain/use_cases/delete_adress_usecase.dart';
import 'package:firebase_app/features/feature_adress/domain/use_cases/get_adreses_usecase.dart';
import 'package:firebase_app/features/feature_adress/domain/use_cases/save_adress_usecase.dart';
import 'package:firebase_app/features/feature_adress/presentation/event/adress_event.dart';
import 'package:firebase_app/features/feature_adress/presentation/state/adress_state.dart';
import 'package:firebase_app/features/feature_adress/presentation/state/adress_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class AdressBloc extends Bloc<AdressEvent,AdressState> {

  final SaveAdressUsecase _saveAdressUsecase;
  final GetAdresesUsecase _getAdresesUsecase;
  final DeleteAdressUsecase _deleteAdressUsecase;

  AdressBloc(
    this._saveAdressUsecase,
    this._getAdresesUsecase,
    this._deleteAdressUsecase
  ) : super(AdressState()) {
    on<SaveAdressEvent>(_saveAdress);
    on<GetAdressEvent>(_getAdress);
    on<DeleteAdressEvent>(_deleteAdress);
  }


  Future<void> _saveAdress(SaveAdressEvent event,Emitter<AdressState> emit) async {
    emit(state.copyWith(status: SaveAdressLoading()));
    final result = await _saveAdressUsecase.saveAdress(event.entity);
    result.fold((exception) {
      emit(state.copyWith(status: SaveAdressFailure(exception.toMessage())));
    },(_) {
      emit(state.copyWith(status: SaveAdressSuccess()));
    });
  }

  Future<void> _getAdress(GetAdressEvent event,Emitter<AdressState> emit) async {
    emit(state.copyWith(status: GetAdressLoading()));
    final result = await _getAdresesUsecase.getAdress();
    result.fold((exception) {
      emit(state.copyWith(status: GetAdressFailure(exception.toMessage())));
    },(data) {
      emit(state.copyWith(
        adresses: data,
        status: GetAdressSuccess()));
    });
  }

  Future<void> _deleteAdress(DeleteAdressEvent event,Emitter<AdressState> emit) async {
    emit(state.copyWith(status: DeleteAdressLaoding()));
    final result = await _deleteAdressUsecase.deleteAdress(event.entity);
    result.fold((exception) {
      emit(state.copyWith(status: DeleteAdressFailure(exception.toMessage())));
    }, (_) {
      emit(state.copyWith(status: DeleteAdressSuccess()));
      add(GetAdressEvent());
    });
  }
}