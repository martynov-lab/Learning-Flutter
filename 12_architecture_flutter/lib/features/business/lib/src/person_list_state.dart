part of 'person_list_bloc.dart';

abstract class PersonState extends Equatable {
  const PersonState();

  @override
  List<Object> get props => [];
}

class PersonEmpty extends PersonState {}

class PersonLoading extends PersonState {}

class PersonLoaded extends PersonState {
  final List<PersonModel> personsList;
  const PersonLoaded({required this.personsList});

  @override
  List<Object> get props => [personsList];
}

class PersonError extends PersonState {}
