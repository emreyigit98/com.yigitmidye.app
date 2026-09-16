
import 'dart:async';

import 'package:firebase_app/features/feature_cart/domain/use_cases/cart_count_usecase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCountCubit extends Cubit<int> {

  final CartCountUsecase _cartCountUsecase;
  StreamSubscription? _streamSubscription;

  CartCountCubit(this._cartCountUsecase) :super(0);

  void cartCount()  {
    _streamSubscription?.cancel();
    _streamSubscription = _cartCountUsecase.cartCount().listen((count) {
      debugPrint("debug print count $count");
      emit(count);
    },onError: (e) {
      debugPrint("hata $e");
      emit(0);
    });
  }

  void reset() {
    _streamSubscription?.cancel();
    _streamSubscription = null;
    emit(0);
  }

  @override
  Future<void> close() {
    _streamSubscription?.cancel();
    return super.close();
  }
}