part of 'person_list_bloc.dart';

abstract class PersonListEvent extends Equatable {
  const PersonListEvent();

  @override
  List<Object> get props => [];
}

class PersonListLoaded extends PersonListEvent {}
