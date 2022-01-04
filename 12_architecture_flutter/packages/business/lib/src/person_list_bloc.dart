import 'package:data/module_data.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:model/model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'person_list_bloc.freezed.dart';

part 'person_list_event.dart';
part 'person_list_state.dart';

class PersonListBloc extends Bloc<PersonListEvent, PersonState> {
  final PersonRepository personRepository;

  PersonListBloc({required this.personRepository})
      : super(const PersonState.empty()) {
    on<PersonLoadedEvent>((event, emit) async {
      emit(const PersonState.loading());
      try {
        final List<PersonModel> _loadedPersonList =
            await personRepository.getAllPersons();

        emit(PersonState.loaded(personsList: _loadedPersonList));
      } catch (e) {
        emit(const PersonState.error());
      }
    });
  }
}
