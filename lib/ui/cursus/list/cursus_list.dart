import 'package:eduguard/ui/cursus/create/cursus_step01.dart';
import 'package:eduguard/ui/cursus/list/widget/cursus_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CursusList extends StatefulWidget {
  const CursusList({
    super.key,
    this.isForInsurance,
  });
  final bool? isForInsurance;

  @override
  State<CursusList> createState() => _CursusListState();
}

class _CursusListState extends State<CursusList> {
  List<String>? userCursus = ["deeds"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cursus"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: userCursus == null || userCursus == []
            ? Center(
                child: Text(
                  "Vide..",
                  style: GoogleFonts.raleway(
                    color: const Color(0xFF333333),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return CursusTile(
                    isForInsurance: widget.isForInsurance,
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
