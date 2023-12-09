import 'package:eduguard/data/cursus.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CursusNotifier extends StateNotifier<Cursus?> {
  CursusNotifier(Cursus cursus) : super(cursus);

  void updateCursus(Cursus cursus) {
    state = cursus;
  }
}

final cursusProvider = StateNotifierProvider<CursusNotifier, Cursus?>(
  (ref) => CursusNotifier(
    Cursus(
      title: "",
      description: '',
    ),
  ),
);
