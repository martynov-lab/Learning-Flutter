import 'package:data/module_data.dart';
import 'package:model/model.dart';
import 'package:http/http.dart';
import 'dart:convert';

class PersonRemoteDataSources implements PersonRepository {
  final String _url =
      'https://cdn.jsdelivr.net/gh/akabab/superhero-api@0.3.0/api/all.json';

  @override
  Future<List<PersonModel>> getAllPersons() async {
    final response = await get(Uri.parse(_url));

    if (response.statusCode == 200) {
      List<dynamic> data = json.decode(response.body);
      //print(response.body);
      // print(data);
      List<PersonModel> persons = [];
      for (var item in data) {
        //print(item);

        PersonModel person = PersonModel.fromJson(item);
        persons.add(person);
      }
      //persons = data.map((item) => PersonModel.fromJson(item)).toList();
      // for (var item in persons) {
      //   print(item.name);
      // }

      // List<PersonModel> persons =
      //     body.map((dynamic item) => PersonModel.fromJson(item)).toList();

      return persons;
    } else {
      throw "Unable to retrieve posts.";
    }
  }
}
