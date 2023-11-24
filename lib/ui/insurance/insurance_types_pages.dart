import 'package:edu_guard/data/insurance_type.dart';
import 'package:edu_guard/ui/insurance/notification/user_insurance.dart';
import 'package:edu_guard/ui/insurance/transition.dart';
import 'package:edu_guard/ui/shapes/container_clipper.dart';
import 'package:expandable_text/expandable_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class InsuranceTypePage extends StatefulWidget {
  const InsuranceTypePage({super.key});

  @override
  State<InsuranceTypePage> createState() => _InsuranceTypePageState();
}

class _InsuranceTypePageState extends State<InsuranceTypePage> {
  final List<InsuranceType> _listInsuranceTypes = [
    InsuranceType(
      title: "Assurance santé",
      description:
          "Cher/es étudiant/es, parent d'élèves, l'assurance santé est un type de contrat financier"
          " qui offre une protection financière aux assurés en cas de dépenses "
          "liées à la santé. Elle fonctionne en remboursant une partie ou la "
          "totalité des frais médicaux encourus par l'assuré, en échange du "
          "paiement de cotisations régulières."
          "Les assurés paient des cotisations périodiques (mensuelles, "
          "trimestrielles ou annuelles) à la compagnie d'assurance. "
          "Ces paiements permettent de maintenir la couverture.",
      imagePath: 'asset/images/health_insurance.jpg',
      colors: ['ADD8E6', 'D1F0FA'],
    ),
    InsuranceType(
      title: "Assurance crédit",
      description: "L'assurance crédit est une forme d'assurance liée à un "
          "prêt ou à une ligne de crédit. Elle vise à protéger l'emprunteur en "
          "couvrant les remboursements en cas d'événements imprévus tels que le "
          "décès, l'invalidité ou la perte d'emploi. Cela offre une sécurité "
          "financière en garantissant que le prêt sera remboursé même si "
          "l'emprunteur rencontre des difficultés.",
      imagePath: 'asset/images/travel_insurance.jpg',
      colors: ['ADD8E6', 'D1F0FA'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: false,
        toolbarHeight: width / 3,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.home,
                    color: Color(
                      0xFF4169E1,
                    ),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.keyboard_arrow_left,
                    size: 30,
                    color: Color(0xDD333333),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Text(
                      "Souscrire à une assurance",
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w700,
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
      body: Container(
        padding: EdgeInsets.all(width / 30),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Type d'assurance",
                  style: GoogleFonts.raleway(
                    fontWeight: FontWeight.w800,
                    color: const Color(0xFF4169E1),
                    fontSize: 25,
                  ),
                ),
              ),
              SizedBox(
                height: width / 20,
              ),
              Wrap(
                children: List.generate(2, (index) {
                  return Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color(0xFFADD8E6),
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),
                        ),
                        child: Stack(
                          children: [
                            Positioned.fill(
                              child: ClipPath(
                                clipper: ContainerClipper(),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Color(
                                      int.parse(
                                        "0xFF${_listInsuranceTypes[index].colors![1]}",
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: width / 40,
                                  ),
                                  Text(
                                    _listInsuranceTypes[index].title,
                                    style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w800,
                                      fontSize: width / 20,
                                      color: const Color.fromARGB(
                                          255, 126, 166, 179),
                                    ),
                                  ),
                                  SizedBox(
                                    height: width / 20,
                                  ),
                                  CircleAvatar(
                                    backgroundColor: Colors.white,
                                    radius: width / 5,
                                    child: ClipOval(
                                      child: AspectRatio(
                                        aspectRatio: 1,
                                        child: Image.asset(
                                          _listInsuranceTypes[index].imagePath,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: width / 40,
                                  ),
                                  ExpandableText(
                                    _listInsuranceTypes[index].description,
                                    style: GoogleFonts.raleway(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                    ),
                                    expandText: "En savoir plus",
                                    collapseText: "Réduire",
                                    maxLines: 2,
                                    linkColor: const Color(0xFF4169E1),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Align(
                                        alignment: Alignment.bottomLeft,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) {
                                                  return const UserInsuranceListPage();
                                                },
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 126, 166, 179),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "Renouveller",
                                            style: GoogleFonts.raleway(
                                              color: const Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Align(
                                        alignment: Alignment.bottomRight,
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (_) {
                                                  return Transition(
                                                    index: index,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor:
                                                const Color.fromARGB(
                                                    255, 126, 166, 179),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                10,
                                              ),
                                            ),
                                          ),
                                          child: Text(
                                            "Souscrire",
                                            style: GoogleFonts.raleway(
                                              color: const Color(0xFFFFFFFF),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: width / 40,
                        //width: width / 40,
                      ),
                    ],
                  );
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
