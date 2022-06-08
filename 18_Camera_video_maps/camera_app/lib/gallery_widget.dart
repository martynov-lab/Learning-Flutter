import 'dart:io';

import 'package:camera_app/services_privider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GalleryWidget extends StatelessWidget {
  const GalleryWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final service = Provider.of<ServiceProvider>(context);
    return ListView.builder(
      itemBuilder: (context, index) {
        if (service.listImage.isEmpty) {
          const Center(
            child: Text('Вы еще не сделали фото!'),
          );
        }
        return SizedBox(
          height: 200,
          child: Image.file(
            File(service.listImage[index].path),
            fit: BoxFit.cover,
          ),
        );
      },
      itemCount: service.listImage.length,
    );
  }
}
