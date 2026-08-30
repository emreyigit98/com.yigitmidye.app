
sealed class DisplayNameState { const DisplayNameState(); }

class Idle extends DisplayNameState { const Idle(); }

class UploadDisplayNameSuccess extends DisplayNameState { const UploadDisplayNameSuccess(); }

class UploadDisplayNameFailure extends DisplayNameState {
  final String message;
  const UploadDisplayNameFailure(this.message);
}