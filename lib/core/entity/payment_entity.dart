
class PaymentEntity {

  final String icon;
  final String paymentType;
  final String title;

  PaymentEntity({required this.icon,required this.paymentType,required this.title});

  Map<String,dynamic> toMap() {
    return {
      "payment_type" : paymentType
    };
  }
}