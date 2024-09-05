class User {
  final int id;
  final String name;
  final String username;
  final String email;

  User(
      {required this.id,
      required this.name,
      required this.username,
      required this.email});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      username: json['username'],
      email: json['email'],
    );
  }
}

// Función para filtrar los usuarios con username mayor de 6 caracteres
void filterUserByUsername(List<User> users) {
  final filteredUsers =
      users.where((user) => user.username.length > 6).toList();
  filteredUsers.forEach((user) {
    print('ID: ${user.id}');
    print('Name: ${user.name}');
    print('Username: ${user.username}');
    print('Email: ${user.email}');
    print('---');
  });
}

// Función para contar los usuarios con dominio .biz
void countUsersByEmailDomain(List<User> users) {
  final count = users.where((user) => user.email.endsWith('.biz')).length;

  print(
      'Cantidad de usuarios cuyo correo electrónico pertenece al dominio \'.biz\': $count');
}
