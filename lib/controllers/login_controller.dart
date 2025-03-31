import 'package:http/http.dart' as http;

class LoginController {
  final String apiUrl = 'https://magicloops.dev/api/loop/98f0194f-5747-49a5-8923-b38575b74742/run';

  Future<bool> login(String username, String password) async {
    try {
      final response = await http.get(
        Uri.parse('$apiUrl?usuario=$username&contraseña=$password'),
      );

      if (response.statusCode == 304 || response.statusCode == 200) {        
        return true;
      }
      print('Error en la autenticación: ${response.statusCode}');
      return false;

    } catch (e) {
      print('Error en la autenticación: $e');
      return false;
    }
  }
}