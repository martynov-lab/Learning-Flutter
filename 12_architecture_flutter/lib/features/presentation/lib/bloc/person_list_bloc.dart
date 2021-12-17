import 'package:domain/module_domain.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'person_list_event.dart';
part 'person_list_state.dart';

class PersonListBloc extends Bloc<PersonListEvent, PersonState> {
  final GetAllPersons getAllPersons;
  PersonListBloc({required this.getAllPersons}) : super(PersonEmpty()) {
    on<PersonListLoaded>((event, emit) async {
      emit(PersonLoading());
      try {
        final List<PersonEntity> _loadedPersonList =
            await getAllPersons.getPerson();

        emit(PersonLoaded(personsList: _loadedPersonList));
      } catch (e) {
        emit(PersonError());
      }
    });
  }
}
