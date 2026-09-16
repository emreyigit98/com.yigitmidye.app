import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_cart/domain/use_cases/get_cart_items_usecase.dart';
import 'package:firebase_app/features/feature_cart/presentation/event/cart_event.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_state.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUsecase _getCartItemsUsecase;

  CartBloc(this._getCartItemsUsecase) : super(CartState()) {
    on<GetCartItemsEvent>(_getCartItems);
  }

  Future<void> _getCartItems(GetCartItemsEvent event,Emitter<CartState> emit) async {
    emit(state.copyWith(status: CartItemsLoading()));
    final result = await _getCartItemsUsecase.getCartProductItems();

    result.fold((exception) {
      emit(state.copyWith(status: CartItemsFailure(exception.toMessage())));
    }, (data) {
      emit(state.copyWith(products: data, status: CartItemsSuccess()));
    });
  }
}
