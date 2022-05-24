import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multiplatform_solutions/model/person.dart';
import 'package:multiplatform_solutions/page/person_details.dart';
import 'package:popover/popover.dart';

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
      ),
      itemBuilder: (BuildContext context, int index) {
        final person = persons[index];
        return GestureDetector(
          onTap: () {
            onPersonTap(index);

            showPopover(
              context: context,
              transitionDuration: const Duration(milliseconds: 150),
              bodyBuilder: (context) {
                return Scrollbar(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ListTile(
                          leading: const Icon(Icons.person),
                          title: const Text('VIEW PROFILE'),
                          onTap: () {
                            //onPersonTap(index);
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //       builder: (BuildContext context) {
                            //     return Scaffold(
                            //         appBar: AppBar(
                            //             title: Text(persons[index].name)),
                            //         body: PersonDetails(
                            //           person: persons[index],
                            //         ));
                            //   }),
                            // );
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.people),
                          title: const Text('FRIENDS'),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                        const Divider(),
                        ListTile(
                          leading: const Icon(Icons.description_outlined),
                          title: const Text('REPORT'),
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    ),
                  ),
                );
              },
              onPop: () => print('Popover was popped!'),
              direction: PopoverDirection.top,
              width: 200,
              height: 400,
              arrowHeight: 15,
              arrowWidth: 30,
            );
          },
          child: Card(
            color: index == currentPerson ? Colors.blue[200] : Colors.blue[300],
            semanticContainer: false,
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
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(vertical: 5),
                          child: Text(
                            person.description,
                            maxLines: 10,
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
      },
    );
  }
}
