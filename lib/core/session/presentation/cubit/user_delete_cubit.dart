
import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/core/session/domain/use_cases/user_delete_usecase.dart';
import 'package:firebase_app/core/session/presentation/state/user_delete_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class UserDeleteCubit extends Cubit<UserDeleteState> {

  final UserDeleteUsecase _userDeleteUsecase;

  UserDeleteCubit(this._userDeleteUsecase) : super(Idle());

  Future<void> userDelete() async {

    emit(UserDeleteLoading());
    
    final result = await _userDeleteUsecase.userDelete();

    result.fold((exception) {
      emit(UserDeleteFailure(exception.toMessage()));
    },(_) {
      emit(UserDeleteSuccess());
    });
  }
}