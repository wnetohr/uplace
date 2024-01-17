class NewUserDTO {
  String email;
  String password;
  String confirmPassword;
  String name;
  DateTime birthDate;

  NewUserDTO.FromDefaultEmail(this.email, this.password, this.confirmPassword,
      this.name, this.birthDate);
}
