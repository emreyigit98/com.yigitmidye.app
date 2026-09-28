
sealed class OrderStatus { const OrderStatus(); } 

class OrderIdle extends OrderStatus { const OrderIdle(); }

class OrderSetLoading extends OrderStatus {
  const OrderSetLoading();
}
class OrderSetSuccess extends OrderStatus {
  const OrderSetSuccess();
}
class OrderSetFailure extends OrderStatus {
  final String message;
  const OrderSetFailure(this.message);
}