import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
//import 'package:mockito/mockito.dart';
import 'package:ejemplo_test/user_list_screen.dart';


import 'user_list_screen_test.mocks.dart';


// Generate a MockClient using the Mockito package.
// Create new instances of this class in each test.
@GenerateMocks([http.Client])
void main() {
  group ('parseUser', () {
        test('parseUser convierte correctamente un JSON en un objeto User', () {
      // JSON de prueba
      const jsonString = '{"name": "Rafael Delgado", "email": "rdelcub359@g.educaand.es"}';
      // Llamamos a la función que queremos probar
      final user = parseUser(jsonString);
      // Verificamos que los valores sean los esperados
      expect(user.name, 'Rafael Delgado');
      expect(user.email, 'rdelcub359@g.educaand.es');
    });


    test('parseUser lanza una excepción si el JSON es inválido', () {
      const invalidJsonString = '{"name": "Rafael Delgado"}'; // Falta el email


      expect(() => parseUser(invalidJsonString), throwsA(isA<TypeError>()));
    });
  });


  group ('fetchUsers', () {
    late MockClient mockClient;


    setUp(() {
      mockClient = MockClient();
    });


    test('devuelve una lista de usuarios cuando la respuesta es exitosa', () async {
      // Simulamos la respuesta de la API con un JSON válido
      when(mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/users')))
          .thenAnswer((_) async => http.Response(
                '[{"name": "Rafael Delgado", "email": "rdelcub359@g.educaand.es"}]',
                200,
              ));


      // Llamamos a fetchUsers pasándole el cliente mockeado
      final users = await fetchUsers(mockClient);
      // Comprobamos que devuelve un usuario correctamente
      expect(users.length, 1);
      expect(users.first.name, 'Rafael Delgado');
      expect(users.first.email, 'rdelcub359@g.educaand.es');
    });

    test('lanza una excepción cuando la respuesta falla', () async {
      // Simulamos un error 404 en la API
      when(mockClient.get(Uri.parse('https://jsonplaceholder.typicode.com/users')))
          .thenAnswer((_) async => http.Response('Not Found', 404));


      // Verificamos que fetchUsers lanza una excepción
      expect(() => fetchUsers(mockClient), throwsException);
    });
  });
}
