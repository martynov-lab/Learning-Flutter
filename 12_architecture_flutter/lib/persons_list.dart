import 'package:business/module_domain.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonsList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final state = context.watch<PersonListBloc>().state;
    //List persons = [];
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
        loaded: (state) =>
            //persons = state.personsList;
            ListView.separated(
          itemBuilder: (context, index) {
            return Row(
              children: [
                // Container(
                //     height: 200,
                //     child: Image.network(state.personsList[index].images)),
                Container(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Text(state.personsList[index].name),
                      //Text(state.personsList[index].appearance.gender),
                      //Text(state.personsList[index].relatives),
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
      //BlocBuilder<PersonListBloc, PersonState>(
      //   builder: (context, state) {
      //     List persons = [];
      //     if (state is PersonEmpty) {
      //       return Center(
      //         child: Text(
      //           'No data received. Press button "Load"',
      //           style: TextStyle(fontSize: 20.0),
      //         ),
      //       );
      //     }
      //     if (state is PersonLoading) {
      //       print(state);
      //       return const Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //     if (state is PersonLoaded) {
      //       print(state);
      //       persons = state.personsList;
      //       return ListView.separated(
      //         itemBuilder: (context, index) {
      //           return Row(
      //             children: [
      //               Container(
      //                   height: 200,
      //                   child: Image.network(state.personsList[index].images)),
      //               Text(state.personsList[index].name),
      //             ],
      //           );
      //         },
      //         separatorBuilder: (context, index) {
      //           return Divider(
      //             color: Colors.grey[400],
      //           );
      //         },
      //         itemCount: persons.length,
      //       );
      //     }
      //     // return ListView.separated(
      //     //   itemBuilder: (context, index) {
      //     //     return Text(persons[index].name);
      //     //   },
      //     //   separatorBuilder: (context, index) {
      //     //     return Divider(
      //     //       color: Colors.grey[400],
      //     //     );
      //     //   },
      //     //   itemCount: persons.length,
      //     // );
      //     return SizedBox.shrink();
      //   },
      // ),
    );
  }
}
