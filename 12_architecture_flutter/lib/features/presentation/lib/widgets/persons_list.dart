import 'package:domain/module_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:presentation/bloc/person_list_bloc.dart';

class PersonsList extends StatelessWidget {
  const PersonsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PersonListBloc, PersonState>(
      builder: (context, state) {
        List<PersonEntity> persons = [];
        if (state is PersonLoading) {
          print(state);
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (state is PersonLoaded) {
          print(state);
          persons = state.personsList;
        }
        return ListView.separated(
          itemBuilder: (context, index) {
            return Text(persons[index].name);
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey[400],
            );
          },
          itemCount: persons.length,
        );
      },
    );
  }
}
