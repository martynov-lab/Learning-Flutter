import 'package:domain/src/entities/person_entity.dart';

abstract class PersonRepository {
  Future<List<PersonEntity>> getAllPersons();
}
