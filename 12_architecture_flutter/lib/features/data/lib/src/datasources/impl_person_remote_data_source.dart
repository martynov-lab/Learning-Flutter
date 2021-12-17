import 'package:data/module_data.dart';
import 'package:data/src/models/person_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PersonRemoteDataSourcesImpl implements PersonRemoteDataSource {
  final http.Client client;

  PersonRemoteDataSourcesImpl({required this.client});
  @override
  Future<List<PersonModel>> getAllPersons() async {
    final response = await client.get(Uri.parse(
        'https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json'));

    if (response.statusCode == 200) {
      final person = json.decode(response.body);
      return (person as List)
          .map((person) => PersonModel.fromJson(person))
          .toList();
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
