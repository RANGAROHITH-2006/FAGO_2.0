// import 'dart:convert';
import 'package:fago/models/restaurant_model.dart';
import 'package:http/http.dart' as http;


class ApiService {
  static const String baseUrl = 'https://your-api-url.com/api/restaurants';

  Future<Welcome> fetchRestaurants() async {
    final response = await http.get(Uri.parse(baseUrl),
    headers: {
      'Authorization': 'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VybmFtZSI6InJhaHVsIiwicm9sZSI6IlBSSU1FX1VTRVIiLCJpYXQiOjE2MjMwNjU1MzJ9.D13s5wN3Oh59aa_qtXMo3Ec4wojOx0EZh8Xr5C5sRkU',
      'Content-Type': 'application/json',
    },
    );

    if (response.statusCode == 200) {
      final welcome = Welcome.fromRawJson(response.body);

     
      return welcome.copyWith(
        restaurants: welcome.restaurants.take(10).toList(),
      );
    } else {
      throw Exception('Failed to load data');
    }
  }
}
