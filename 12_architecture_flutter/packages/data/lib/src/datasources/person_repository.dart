import 'package:model/model.dart';

abstract class PersonRepository {
  Future<List<PersonModel>> getAllPersons();
}
