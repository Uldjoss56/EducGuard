import 'package:eduguard/ui/cursus/create/cursus_step02.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CursusStep01 extends StatefulWidget {
  const CursusStep01({super.key});

  @override
  State<CursusStep01> createState() => _CursusStep01State();
}

class _CursusStep01State extends State<CursusStep01> {
  final _searchingDataController = TextEditingController();

  final listofchoice = [
    "Allez le plus loin possible dans ce domaine",
    "Obtenir le doctorat dans mon domaine",
    "Obtenir le master",
    "Autres *(à préciser)",
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer votre cursus"),
        scrolledUnderElevation: 1,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.symmetric(horizontal: width / 4),
                height: 2,
                color: const Color(0xAA333333),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                      margin: EdgeInsets.fromLTRB(
                        width / 20,
                        width / 10,
                        width / 20,
                        0,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFDDDDDD),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                      child: TextField(
                        onChanged: (value) {},
                        controller: _searchingDataController,
                        decoration: InputDecoration(
                          hintText: 'Entrez le domaine',
                          hintStyle: GoogleFonts.raleway(
                            //fontSize: 18,
                            color: const Color(0xFF333333),
                          ),
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          border: const UnderlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                        ),
                        style: GoogleFonts.raleway(
                          color: const Color(0xFF333333),
                          //fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(
                      0,
                      width / 10,
                      width / 20,
                      0,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.search_rounded,
                      ),
                      style: IconButton.styleFrom(
                        shape: const ContinuousRectangleBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        backgroundColor: const Color(0xFFDDDDDD),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Filières",
                    style: GoogleFonts.raleway(
                      color: const Color(0xFF333333),
                    ),
                  ),
                ),
              ),
              Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Multimédia",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Génie logiciel",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Droit civil",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    color: const Color(0xFF4169E1),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Internet et Télécoms",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFFFFFFFF),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Finance & Economie",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Mathématiques inférentielles",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Sécurité des systèmes informatiques",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          color: const Color(0xFF333333),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Universités",
                    style: GoogleFonts.raleway(
                      color: const Color(0xFF333333),
                    ),
                  ),
                ),
              ),
              Wrap(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Université d'Abomey-Calavi (Benin)",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "Internet et Multimedia (IFRI)",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "Journalisme et Multimedia (ENSTIC-UAC)",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "Réseaux télécoms (EPAC)",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(
                            "Université d'Ottawa (Canada)",
                            style: GoogleFonts.raleway(
                              fontWeight: FontWeight.w600,
                              color: const Color(0xFF333333),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "Informatique et Technologies de l'Information",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.check,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                child: Text(
                                  "Informatique appliquée et intelligence artificielle",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Définissez votre objectif",
                    style: GoogleFonts.raleway(
                      color: const Color(0xFF333333),
                    ),
                  ),
                ),
              ),
              DropdownButtonFormField<String>(
                value: "Allez le plus loin possible dans ce domaine",
                items: listofchoice.map(
                  (choice) {
                    return DropdownMenuItem(
                      value: choice,
                      child: Text(choice),
                    );
                  },
                ).toList(),
                padding: const EdgeInsets.all(8),
                style: GoogleFonts.raleway(
                  color: const Color(0xFF333333),
                  fontWeight: FontWeight.w600,
                ),
                onChanged: (value) {},
              ),
              const SizedBox(
                height: 10,
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) {
                        return const CursusStep02();
                      },
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFFFFFF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(
                      10,
                    ),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Continuer",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        color: const Color(0xFF4169E1),
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
