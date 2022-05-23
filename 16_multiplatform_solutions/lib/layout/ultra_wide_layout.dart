import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/model/person.dart';
import 'package:multiplatform_solutions/page/person_details.dart';
import 'package:multiplatform_solutions/page/person_list.dart';

class UltraWideLayout extends StatelessWidget {
  final int currentPerson;
  final void Function(int) onPersonTap;
  const UltraWideLayout({
    Key? key,
    required this.currentPerson,
    required this.onPersonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            height: double.infinity,
            width: double.infinity,
            color: Colors.blue[300],
            child: const Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Adaptive App',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
        Expanded(
          child: PersonList(
              currentPerson: currentPerson, onPersonTap: onPersonTap),
          flex: 2,
        ),
        Expanded(
          child: PersonDetails(
            person: persons[currentPerson],
          ),
          flex: 3,
        ),
      ],
    );
  }
}
