import 'package:domain/src/entities/person_entity.dart';
import 'package:domain/src/repositories/person_repository.dart';

class GetAllPersons {
  final PersonRepository personRepository;

  GetAllPersons({required this.personRepository});

  Future<List<PersonEntity>> getPerson() async {
    return await personRepository.getAllPersons();
  }
}
