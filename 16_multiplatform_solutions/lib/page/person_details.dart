import 'package:flutter/material.dart';

import '../model/person.dart';

class PersonDetails extends StatelessWidget {
  final Person person;
  const PersonDetails({
    Key? key,
    required this.person,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(person.image, fit: BoxFit.cover),
            ),
          ),
          Expanded(
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(person.name,
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20)),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: Text(person.description,
                    style: const TextStyle(fontWeight: FontWeight.w400)),
              )
            ]),
          )
        ],
      ),
    );
  }
}
