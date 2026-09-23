
sealed class AdressStatus { const AdressStatus(); }

class Idle extends AdressStatus { const Idle(); }  

class SaveAdressLoading extends AdressStatus {
  const SaveAdressLoading();
}
class SaveAdressSuccess extends AdressStatus {
  const SaveAdressSuccess();
}
class SaveAdressFailure extends AdressStatus {
  final String message;
  const SaveAdressFailure(this.message);
}

class GetAdressLoading extends AdressStatus {
  const GetAdressLoading();
}
class GetAdressSuccess extends AdressStatus {
  const GetAdressSuccess();
}
class GetAdressFailure extends AdressStatus {
  final String message;
  const GetAdressFailure(this.message);
}

class DeleteAdressLaoding extends AdressStatus {
  const DeleteAdressLaoding();
}
class DeleteAdressSuccess extends AdressStatus {
  const DeleteAdressSuccess();
}
class DeleteAdressFailure extends AdressStatus {
  final String message;
  const DeleteAdressFailure(this.message);
}