import 'package:data/src/datasources/person_remote_data_source.dart';
import 'package:domain/module_domain.dart';

class PersonRepositoryImpl implements PersonRepository {
  final PersonRemoteDataSource personRemoteDataSource;

  PersonRepositoryImpl({required this.personRemoteDataSource});
  @override
  Future<List<PersonEntity>> getAllPersons() async {
    try {
      final remotePerson = await personRemoteDataSource.getAllPersons();

      return remotePerson;
    } catch (e) {
      throw Exception('Error: $e');
    }
  }
}
