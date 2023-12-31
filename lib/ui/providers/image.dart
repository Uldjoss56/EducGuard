import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class ImageNotifier extends StateNotifier<File?> {
  ImageNotifier() : super(null);

  void updateImage(File? image) {
    state = image;
  }
}

final imageProvider =
    StateNotifierProvider<ImageNotifier, File?>(
  (ref) => ImageNotifier(),
);