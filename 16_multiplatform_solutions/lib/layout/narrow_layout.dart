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
        showModalBottomSheet(
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ListTile(
                      leading: const Icon(Icons.person),
                      title: const Text('VIEW PROFILE'),
                      onTap: () {
                        onPersonTap(index);
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                            return Scaffold(
                                appBar:
                                    AppBar(title: Text(persons[index].name)),
                                body: PersonDetails(
                                  person: persons[index],
                                ));
                          }),
                        );
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
              );
            });
      },
    );
  }
}



                //  onPressed: () {
                //         showModalBottomSheet(
                //             shape: const RoundedRectangleBorder(
                //               borderRadius: BorderRadius.only(
                //                 topLeft: Radius.circular(20.0),
                //                 topRight: Radius.circular(20.0),
                //               ),
                //             ),
                //             context: context,
                //             isScrollControlled: true,
                //             builder: (context) {
                //               return const BottomSheetFilter();
                //             });
                //       },
