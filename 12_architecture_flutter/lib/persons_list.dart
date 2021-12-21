import 'package:business/module_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List of superheroes'),
      ),
      body: BlocBuilder<PersonListBloc, PersonState>(
        builder: (context, state) {
          var persons = [];
          if (state is PersonEmpty) {
            return Center(
              child: Text(
                'No data received. Press button "Load"',
                style: TextStyle(fontSize: 20.0),
              ),
            );
          }
          if (state is PersonLoading) {
            print(state);
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is PersonLoaded) {
            print(state);
            persons = state.personsList;
            // return ListView.separated(
            //   itemBuilder: (context, index) {
            //     return Text(persons[index].name);
            //   },
            //   separatorBuilder: (context, index) {
            //     return Divider(
            //       color: Colors.grey[400],
            //     );
            //   },
            //   itemCount: persons.length,
            // );
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
          // return SizedBox.shrink();
        },
      ),
    );
  }
}
