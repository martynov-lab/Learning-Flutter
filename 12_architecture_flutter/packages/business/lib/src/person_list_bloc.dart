import 'package:data/module_data.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'person_list_event.dart';
part 'person_list_state.dart';

class PersonListBloc extends Bloc<PersonListEvent, PersonState> {
  final PersonRepository personRepository;

  PersonListBloc({required this.personRepository}) : super(PersonEmpty()) {
    on<PersonEventLoaded>((event, emit) async {
      emit(PersonLoading());
      try {
        final List<PersonModel> _loadedPersonList =
            await personRepository.getAllPersons();
        print(_loadedPersonList);
        emit(PersonLoaded(personsList: _loadedPersonList));
      } catch (e) {
        emit(PersonError());
      }
    });
  }
}
