import 'package:eduguard/data/cursus.dart';
import 'package:eduguard/providers/cursus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';

class CursusStep02 extends ConsumerStatefulWidget {
  const CursusStep02({super.key});

  @override
  ConsumerState<CursusStep02> createState() => _CursusStep02State();
}

class _CursusStep02State extends ConsumerState<CursusStep02> {
  final listoflevel = [
    "Licence",
    "Technicien",
    "Ingenieur",
    "Master",
    "Doctorat",
  ];
  final listofchoice = [
    "Internet et Multimedia",
    "Extended Reality (XR)",
    "Finance des banques",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Créer votre cursus"),
        scrolledUnderElevation: 1,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.all(10),
                child: Column(
                  children: [
                    Card(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            Text(
                              "Description (RoadMap)",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                fontSize: 18,
                                color: const Color(0xFF4169E1),
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Objectif : ",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    "Obtenir le master",
                                    style: GoogleFonts.raleway(
                                      color: const Color(0xFF333333),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Domaine : ",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: Text(
                                    "Internet et télécoms",
                                    style: GoogleFonts.raleway(
                                      color: const Color(0xFF333333),
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Filière : ",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    value: "Extended Reality (XR)",
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
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Niveau d'étude actuel : ",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    value: "Licence",
                                    items: listoflevel.map(
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
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Niveau à atteindre : ",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                  child: DropdownButtonFormField<String>(
                                    value: "Master",
                                    items: listoflevel.map(
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
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Débourchés",
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
                              "XR developer",
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
                              "Concepteur 2D/3D",
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
                              "Game designer",
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
                              "Animateur audio",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                final cursus = Cursus(
                  title: 'Cursus 1',
                  description: 'Internet et Telecom',
                );
                final cursusNotifier = ref.read(cursusProvider.notifier);
                cursusNotifier.updateCursus(cursus);
                Navigator.pop(context);
                Navigator.pop(context);
                /*Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (_) {
                    return const CursusList();
                  }),
                );*/
              },
              style: ElevatedButton.styleFrom(
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
                    "Terminer",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
