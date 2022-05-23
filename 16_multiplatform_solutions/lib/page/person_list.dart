import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/model/person.dart';

class PersonList extends StatelessWidget {
  final int currentPerson;
  final void Function(int) onPersonTap;
  const PersonList({
    Key? key,
    required this.currentPerson,
    required this.onPersonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: persons.length,
      itemBuilder: ((context, index) {
        final person = persons[index];
        return GestureDetector(
          onTap: () => onPersonTap(index),
          child: Card(
            color: index == currentPerson ? Colors.blue[200] : Colors.blue[300],
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 30,
                      backgroundColor: Colors.blueGrey[100],
                      backgroundImage: AssetImage(person.image),
                    ),
                  ),
                ),
                Expanded(
                    flex: 4,
                    child: Container(
                      height: 80,
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 5),
                            child: Text(person.name),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Text(
                                person.description,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            ),
          ),
        );
      }),
    );
  }
}
