
import 'package:firebase_app/features/feature_cart/domain/repo/cart_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CartCountUsecase {
  final CartRepo _cartRepo;

  CartCountUsecase(this._cartRepo);  

  Stream<int> cartCount() => _cartRepo.cartCount();
}