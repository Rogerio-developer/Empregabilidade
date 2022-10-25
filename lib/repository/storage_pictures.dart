import 'dart:typed_data';

import 'package:firebase_storage/firebase_storage.dart';

class StoragePictures {
  static final Map<String, dynamic> _pictures = {};

  static Future<Uint8List?> _download(String path) async {
    final storageRef = FirebaseStorage.instance.ref();
    final pathReference = storageRef.child(path);
    try {
      const oneMegabyte = 1024 * 1024 * 4;
      final Uint8List? data = await pathReference.getData(oneMegabyte);
      return data;
    } on FirebaseException {
      return null;
    }
  }

  static Future<Uint8List?> getPicture(String? path) async {
    if (path == null) {
      return null;
    }
    if (_pictures.containsKey(path)) {
      return _pictures[path];
    }
    try {
      Uint8List? data = await _download(path);
      _pictures[path] = data;
      return data;
    } on FirebaseException {
      return null;
    }
  }
}
