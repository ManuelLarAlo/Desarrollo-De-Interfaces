import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;


class UserListScreen extends StatefulWidget {
  const UserListScreen({super.key});


  @override
  UserListScreenState createState() => UserListScreenState();
}


class UserListScreenState extends State<UserListScreen> {
  late Future<List<User>> _users;


  @override
  void initState() {
    super.initState();
    _users = fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Users')),
      body: FutureBuilder<List<User>>(
        future: _users,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No users found'));
          }
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(snapshot.data![index].name),
                subtitle: Text(snapshot.data![index].email),
              );
            },
          );
        },
      ),
    );
  }
}


//Prueba Unitaria con Mockito
Future<List<User>> fetchUsers([http.Client? client]) async {
  client ??= http.Client(); // Usa el cliente proporcionado o crea uno nuevo
  final response = await client.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));


  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}

class User {
  final String name;
  final String email;


  User({required this.name, required this.email});


  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      name: json['name'],
      email: json['email'],
    );
  }
}

// Prueba Unitaria
User parseUser(String jsonString) {
  final Map<String, dynamic> json = jsonDecode(jsonString);
  return User.fromJson(json);
}
