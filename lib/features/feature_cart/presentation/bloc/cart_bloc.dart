import 'package:firebase_app/core/extensions/custom_exceptions_mapper.dart';
import 'package:firebase_app/features/feature_adress/domain/use_cases/get_adreses_usecase.dart';
import 'package:firebase_app/features/feature_cart/domain/entity/cart_entity.dart';
import 'package:firebase_app/features/feature_cart/domain/use_cases/delete_cart_item_usecase.dart';
import 'package:firebase_app/features/feature_cart/domain/use_cases/get_cart_items_usecase.dart';
import 'package:firebase_app/features/feature_cart/domain/use_cases/set_cart_item_usecase.dart';
import 'package:firebase_app/features/feature_cart/presentation/event/cart_event.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/adress_status.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_state.dart';
import 'package:firebase_app/features/feature_cart/presentation/state/cart_status.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:rxdart/rxdart.dart';

EventTransformer<T> debounce<T>(Duration duration) {
  return (events, mapper) {
    return events.debounceTime(duration).switchMap(mapper);
  };
}

@injectable
class CartBloc extends Bloc<CartEvent, CartState> {
  final GetCartItemsUsecase _getCartItemsUsecase;
  final SetCartItemUsecase _setCartItemUsecase;
  final DeleteCartItemUsecase _deleteCartItemUsecase;
  final GetAdresesUsecase _getAdresesUsecase;

  CartBloc(
    this._getCartItemsUsecase,
    this._setCartItemUsecase,
    this._deleteCartItemUsecase,
    this._getAdresesUsecase
  ) : super(CartState()) {
    on<GetCartItemsEvent>(_getCartItems);
    on<UploadCartItemsEvent>(_uploadCartItem);
    on<UpdateCartItemEvent>(
      _updateCartItem,
      transformer: debounce(Duration(seconds: 1)),
    );
    on<DeleteCartItemEvent>(_deleteCartItem);
    on<GetAdressItemEvent>(_getAdressItem);
  }

  Future<void> _getCartItems(GetCartItemsEvent event,Emitter<CartState> emit) async {
    emit(state.copyWith(cartStatus: CartItemsLoading()));
    final result = await _getCartItemsUsecase.getCartProductItems();

    result.fold(
      (exception) {
        emit(state.copyWith(cartStatus: CartItemsFailure(exception.toMessage())));
      },
      (data) {
        emit(state.copyWith(products: data, cartStatus: CartItemsSuccess()));
      },
    );
  }

  Future<void> _uploadCartItem(UploadCartItemsEvent event,Emitter<CartState> emit) async {
    final uploadItems = state.products.map((cartItem) {
      if (cartItem.productId == event.productId) {
        return cartItem.copyWith(quantity: event.quantity);
      }
      return cartItem;
    }).toList();

    emit(state.copyWith(products: uploadItems));

    add(
      UpdateCartItemEvent(productId: event.productId, quantity: event.quantity),
    );
  }

  Future<void> _updateCartItem( UpdateCartItemEvent event,Emitter<CartState> emit) async {

    final cartEntity = CartEntity(
      id: event.productId,
      quantity: event.quantity,
    );

    final result = await _setCartItemUsecase.setCartItem(cartEntity);

    result.fold(
      (exception) {
        emit(
          state.copyWith(cartStatus: UploadCartItemFailure(exception.toMessage())),
        );
      },
      (_) {
        emit(state.copyWith(cartStatus: UploadCartItemSuccess()));
        add(GetCartItemsEvent());
      },
    );
  }

  Future<void> _deleteCartItem(DeleteCartItemEvent event,Emitter<CartState> emit) async {

    emit(state.copyWith(cartStatus: DeleteCartItemLoading()));
    final result = await _deleteCartItemUsecase.deleteCartItem(event.productId);

    result.fold(
      (exception) {
        emit(state.copyWith(cartStatus: DeleteCartItemFailure(exception.toMessage())));
      },
       (_) {
        emit(state.copyWith(cartStatus: DeleteCartItemSuccess()));
        add(GetCartItemsEvent());
       }
    );
  }

  Future<void> _getAdressItem(GetAdressItemEvent event,Emitter<CartState> emit) async {
    emit(state.copyWith(adressStatus: GetAdressItemLoading()));
    final result = await _getAdresesUsecase.getAdress();
    result.fold((exception) {
      emit(state.copyWith(adressStatus: GetAdressItemFailure(exception.toMessage())));
    },(data) {
      emit(state.copyWith(
        adressStatus: GetAdressItemSuccess(),
        adresses: data
      ));
    });
  }
}