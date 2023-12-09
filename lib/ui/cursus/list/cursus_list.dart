import 'package:eduguard/providers/cursus.dart';
import 'package:eduguard/ui/cursus/create/cursus_step01.dart';
import 'package:eduguard/ui/cursus/list/widget/cursus_tile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CursusList extends ConsumerStatefulWidget {
  const CursusList({
    super.key,
    this.isForInsurance,
  });
  final bool? isForInsurance;

  @override
  ConsumerState<CursusList> createState() => _CursusListState();
}

class _CursusListState extends ConsumerState<CursusList> {
  List<String>? userCursus = ["deeds"];
  @override
  Widget build(BuildContext context) {
    final cursus = ref.watch(cursusProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cursus"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: cursus!.title == ""
            ? Center(
                child: Text(
                  "Vide..",
                  style: GoogleFonts.raleway(
                    color: const Color(0xFF333333),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: 1,
                itemBuilder: (context, index) {
                  return CursusTile(
                    isForInsurance: widget.isForInsurance,
                    cursus: cursus,
                  );
                },
              ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return const CursusStep01();
              },
            ),
          );
        },
        child: Text(
          "Créer",
          style: GoogleFonts.raleway(
            color: const Color(0xFF333333),
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
