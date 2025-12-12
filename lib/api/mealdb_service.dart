import 'dart:convert';
import 'package:http/http.dart' as http;

class MealDBService {
  static const String _baseUrl = 'https://www.themealdb.com/api/json/v1/1';

  Future<List<String>> fetchAreas() async {
    final url = Uri.parse('$_baseUrl/list.php?a=list');
    final res = await http.get(url);
    if (res.statusCode != 200) {
      throw Exception('Failed to load areas (${res.statusCode})');
    }
    final data = json.decode(res.body) as Map<String, dynamic>;
    final List areas = data['meals'] ?? [];
    return areas
        .map((e) => (e['strArea'] as String?)?.trim())
        .whereType<String>()
        .toList();
  }

  Future<List<Map<String, String>>> fetchMealsByArea(String area) async {
    final url = Uri.parse('$_baseUrl/filter.php?a=${Uri.encodeComponent(area)}');
    final res = await http.get(url);
    if (res.statusCode != 200) {
      throw Exception('Failed to load meals (${res.statusCode})');
    }
    final data = json.decode(res.body) as Map<String, dynamic>;
    final List meals = data['meals'] ?? [];
    return meals
        .map((e) => {
              'idMeal': e['idMeal']?.toString() ?? '',
              'strMeal': e['strMeal']?.toString() ?? '',
              'strMealThumb': e['strMealThumb']?.toString() ?? '',
            })
        .toList();
  }
}
