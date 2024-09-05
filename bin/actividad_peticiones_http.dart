import 'dart:convert';
import 'package:http/http.dart' as http;
import 'user.dart';

void main() async {
  final url = Uri.parse('https://jsonplaceholder.typicode.com/users');

  final response = await http.get(url);

  print(response);

  if (response.statusCode == 200) {
    List<dynamic> jsonData = json.decode(response.body);

    List<User> users = jsonData.map((json) => User.fromJson(json)).toList();

    users.forEach((user) {
      print('ID: ${user.id}');
      print('Name: ${user.name}');
      print('Username: ${user.username}');
      print('Email: ${user.email}');
      print('---');
    });

    print('---');
    print('Usuarios con username mayor de 6 caracteres:');
    filterUserByUsername(users);
    print('---');
    print('Usuarios con dominio .biz:');
    countUsersByEmailDomain(users);
  } else {
    print('Error al obtener los datos: ${response.statusCode}');
  }
}
