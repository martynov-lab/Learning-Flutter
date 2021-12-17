import 'package:data/src/models/person_model.dart';

abstract class PersonRemoteDataSource {
  Future<List<PersonModel>> getAllPersons();
}
