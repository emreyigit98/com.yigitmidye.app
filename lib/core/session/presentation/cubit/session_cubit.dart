import 'dart:async';
import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/core/session/domain/entity/user_entity.dart';
import 'package:firebase_app/core/session/domain/use_cases/update_name_usecase.dart';
import 'package:firebase_app/core/session/domain/use_cases/user_changes_usecase.dart';
import 'package:firebase_app/core/session/domain/use_cases/user_reolad_usecase.dart';
import 'package:firebase_app/core/session/domain/use_cases/user_signout_usecase.dart';
import 'package:firebase_app/core/session/presentation/state/session_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SessionCubit extends Cubit<SessionState> {
  
  final UserChangesUsecase _userChangesUsecase;
  final UserReoladUsecase _userReoladUsecase;
  final UserSignoutUsecase _userSignoutUsecase;

  StreamSubscription<UserEntity?>? _streamSubscription;

  SessionCubit(
    this._userChangesUsecase,
    this._userReoladUsecase,
    this._userSignoutUsecase,
  ) : super(Idle());

  Future<void> userReolad() async {
    final result = await _userReoladUsecase.reolad();
    result.fold(
      (customException) => emit(ReoladFailed(customException.toMessage())),
      (_) => _listenUserChanges(),
    );
  }

  void _listenUserChanges() {
    _streamSubscription = _userChangesUsecase.userChanges.listen((user) {
      if (user != null) {
        emit(Authenticated(user));
      } else {
        emit(Unauthenticated());
      }
    });
  }

  Future<void> signOut() async {
    await _userSignoutUsecase.signOut();
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}