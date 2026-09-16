
import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_entity.dart';
import 'package:firebase_app/features/feature_cart/domain/use_cases/set_cart_item_usecase.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/set_cart_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class SetCartCubit extends Cubit<SetCartState> {

  final SetCartItemUsecase _setCartItemUsecase;

  SetCartCubit(this._setCartItemUsecase) : super(Idle());

  Future<void> setCartItem(int quantity,String productId) async {
    emit(SetCartLoading());
    final result = await _setCartItemUsecase.setCartItem(
      CartEntity(id: productId, quantity: quantity)
    );
    result.fold(
      (exception) => emit(SetCartError(exception.toMessage())),
       (_) => emit(SetCartSuccess())
    );
  }
}