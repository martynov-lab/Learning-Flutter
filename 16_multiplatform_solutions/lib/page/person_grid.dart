import 'package:flutter/material.dart';
import 'package:multiplatform_solutions/model/person.dart';

class PersonGrid extends StatelessWidget {
  final int currentPerson;
  final void Function(int) onPersonTap;
  const PersonGrid({
    Key? key,
    required this.currentPerson,
    required this.onPersonTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: persons.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        crossAxisSpacing: 8.0,
        mainAxisSpacing: 8.0,
      ),
      itemBuilder: (BuildContext context, int index) {
        final person = persons[index];
        return GestureDetector(
          onTap: () => onPersonTap(index),
          child: Card(
            color: index == currentPerson ? Colors.blue[200] : Colors.blue[300],
            child: Column(
              children: [
                Expanded(
                  //flex: 1,
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: CircleAvatar(
                      radius: 50,
                      backgroundColor: Colors.blueGrey[100],
                      backgroundImage: AssetImage(person.image),
                    ),
                  ),
                ),
                Expanded(
                    //flex: 2,
                    child: Container(
                  // height: 70,
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Text(person.name),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          person.description,
                          maxLines: 5,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                )),
              ],
            ),
          ),
        );
      },
      // itemCount: persons.length,
      // itemBuilder: ((context, index) {
      //   final person = persons[index];
      //   return ;
      // }),
    );
  }
}
