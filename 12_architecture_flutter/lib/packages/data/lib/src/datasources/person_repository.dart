import 'package:data/module_data.dart';

abstract class PersonRepository {
  Future<List<PersonModel>> getAllPersons();
}
