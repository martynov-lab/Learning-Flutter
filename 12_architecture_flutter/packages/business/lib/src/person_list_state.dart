part of 'person_list_bloc.dart';

@freezed
class PersonState with _$PersonState {
  const factory PersonState.empty() = _PersonEmpty;
  const factory PersonState.loading() = _PersonLoading;
  const factory PersonState.loaded({required List<PersonModel> personsList}) =
      _PersonLoaded;
  const factory PersonState.error() = _PersonError;
}
