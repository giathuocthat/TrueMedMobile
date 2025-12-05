interface class AuthenEntity {}

class AuthenRequestEntity extends AuthenEntity {
  AuthenRequestEntity({
    required this.username,
    required this.password,
    this.shouldRemeber = false,
  });

  final String username;
  final String password;
  final bool? shouldRemeber;
}

class AuthenResponseEntity extends AuthenEntity {
  AuthenResponseEntity({required this.accessToken});

  final String accessToken;
}
