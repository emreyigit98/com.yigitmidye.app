class UserEntity {
  final String uid;
  final String phoneNumber;
  final String? displayName;
  final DateTime? createdAt;

  UserEntity({
    required this.uid,
    required this.phoneNumber,
    this.displayName,
    this.createdAt,
  });
}