part of 'person_list_bloc.dart';

@freezed
class PersonListEvent with _$PersonListEvent {
  const factory PersonListEvent.loaded() = PersonLoadedEvent;
}
