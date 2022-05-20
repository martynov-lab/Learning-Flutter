import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/model/person.dart';
import 'package:multiplatform_solutions/page/person_details.dart';
import 'package:multiplatform_solutions/page/person_list.dart';

class NarrowLayout extends StatelessWidget {
  final int currentPerson;
  final void Function(int) onPersonTap;
  const NarrowLayout({
    Key? key,
    required this.currentPerson,
    required this.onPersonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PersonList(
      currentPerson: currentPerson,
      onPersonTap: (index) {
        onPersonTap(index);
        Navigator.of(context).push(
          MaterialPageRoute(builder: (BuildContext context) {
            return Scaffold(
                appBar: AppBar(title: Text(persons[index].name)),
                body: PersonDetails(
                  person: persons[index],
                ));
          }),
        );
      },
    );
  }
}
