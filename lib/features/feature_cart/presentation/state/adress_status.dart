
sealed class AdressStatus { const AdressStatus(); }

class AdressIdle extends AdressStatus { const AdressIdle(); }

class GetAdressItemLoading extends AdressStatus {
  const GetAdressItemLoading();
}
class GetAdressItemSuccess extends AdressStatus {
  const GetAdressItemSuccess();
}
class GetAdressItemFailure extends AdressStatus {
  final String message;
  const GetAdressItemFailure(this.message);
}