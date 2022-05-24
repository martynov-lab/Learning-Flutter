import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/page/person_grid.dart';
import 'package:popover/popover.dart';

class WideLayout extends StatelessWidget {
  final int currentPerson;
  final void Function(int) onPersonTap;
  const WideLayout({
    Key? key,
    required this.currentPerson,
    required this.onPersonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
          child: PersonGrid(
            currentPerson: currentPerson,
            onPersonTap: (index) {
              onPersonTap(index);
            },
          ),
          flex: 3,
        ),
      ],
    );
  }
}
