import 'package:data/module_data.dart';
import 'package:http/http.dart';
import 'dart:convert';

class PersonRemoteDataSources implements PersonRepository {
  final String _url =
      'https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json';

  @override
  Future<List<PersonModel>> getAllPersons() async {
    final response = await get(Uri.parse(_url));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      List<PersonModel> persons =
          data.map((person) => PersonModel.fromJson(person)).toList();
      return persons;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
