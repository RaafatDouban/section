import 'dart:convert';
import 'package:section_1/Quote/quote.dart';
import 'package:http/http.dart' as http;

Future<List<Quote>> fetchQuote() async {
  final response = await http.get(
    Uri.parse("https://api.api-ninjas.com/v1/quotes"),
    headers: {'X-Api-Key': 'aCHm4SjRFGwy18t40YSH4g==RTviUtFNu5BczlPw'},
  );

  if (response.statusCode == 200) {
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => Quote.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load quote');
  }
}
