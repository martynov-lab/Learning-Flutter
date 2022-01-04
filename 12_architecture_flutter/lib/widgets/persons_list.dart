import 'package:business/module_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<PersonListBloc>().state;

    return Scaffold(
      appBar: AppBar(
        title: Text('List of superheroes'),
      ),
      body: state.map<Widget>(
        empty: (_) => Center(
          child: Text(
            'No data received',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
        loading: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        loaded: (state) => ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(state.personsList[index].name),
                    ],
                  ),
                ),
              ],
            );
          },
          separatorBuilder: (context, index) {
            return Divider(
              color: Colors.grey[400],
            );
          },
          itemCount: state.personsList.length,
        ),
        error: (_) => Center(
          child: Text(
            'Error',
            style: TextStyle(fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
