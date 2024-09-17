import 'dart:convert';
import 'package:http/http.dart' as http;

class RandomUserService {
  static const String _apiUrl = 'https://randomuser.me/api/';

  // Method to fetch random users
  Future<List<dynamic>> fetchRandomUsers({int count = 10}) async {
    final response = await http.get(Uri.parse('$_apiUrl?results=$count'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      return data['results'];
    } else {
      throw Exception('Failed to load random users');
    }
  }
}
