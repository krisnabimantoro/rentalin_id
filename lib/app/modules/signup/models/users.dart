class Users {
  String? usersId;
  String emailAddress;
  String? fileName;
  String? fullName;
  String? nameRent;
  String password;
  String? phoneNumber;

  Users(
      {this.usersId,
      required this.emailAddress,
      this.fileName,
      this.fullName,
      this.nameRent,
      required this.password,
      this.phoneNumber});
}
