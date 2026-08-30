import 'package:firebase_app/core/session/domain/use_cases/update_name_usecase.dart';
import 'package:firebase_app/core/session/presentation/state/display_name_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class DisplayNameCubit extends Cubit<DisplayNameState> {
  
  final UpdateNameUsecase _updateNameUsecase;
  DisplayNameCubit(this._updateNameUsecase) : super(Idle());

  Future<void> updateDisplayName(String name) async {
    final result = await _updateNameUsecase.updateDisplayName(name);

    result.fold(
      (customException) =>
          emit(UploadDisplayNameFailure(customException.toString())),
      (_) {
        emit(UploadDisplayNameSuccess());
      },
    );
  }
}