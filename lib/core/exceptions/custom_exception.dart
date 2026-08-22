
sealed class CustomException { const CustomException(); }

class UserNotFound extends CustomException { const UserNotFound(); }
class InvalidPhoneNumber extends CustomException { const InvalidPhoneNumber(); }

class UnknownError extends CustomException { const UnknownError(); }