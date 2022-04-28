import 'dart:io';

import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

class StorageScreen extends StatefulWidget {
  @override
  State<StorageScreen> createState() => _StorageScreenState();
}

class _StorageScreenState extends State<StorageScreen> {
  final storageRef = FirebaseStorage.instance.ref();

  String _downloadImageUrl = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Storage Screen'),
      ),
      body: Center(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () async {
              final imageRef = storageRef.child("anh/Banner-KHLT-Android.png");

              _downloadImageUrl = await imageRef.getDownloadURL();

              setState(() {});

              // final appDocDir = await getApplicationDocumentsDirectory();
              // String filePath = "${appDocDir.path}";
              // final file = File(filePath);
              //
              // final downloadTask = islandRef.writeToFile(file);
              // downloadTask.snapshotEvents.listen((taskSnapshot) {
              //   switch (taskSnapshot.state) {
              //     case TaskState.running:
              //     // TODO: Handle this case.
              //       break;
              //     case TaskState.paused:
              //     // TODO: Handle this case.
              //       break;
              //     case TaskState.success:
              //
              //       print('Download images successfully!');
              //     // TODO: Handle this case.
              //       break;
              //     case TaskState.canceled:
              //     // TODO: Handle this case.
              //       break;
              //     case TaskState.error:
              //     // TODO: Handle this case.
              //       break;
              //   }
              // });
            },
            child: Text('Download File'),
          ),
          ElevatedButton(
            onPressed: () async {},
            child: Text('Upload File'),
          ),
          if (_downloadImageUrl != '')
            Image.network(_downloadImageUrl),
        ],
      )),
    );
  }
}
