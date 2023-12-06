import 'package:eduguard/ui/paiement/paiement.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationDetail extends StatefulWidget {
  const NotificationDetail({super.key});

  @override
  State<NotificationDetail> createState() => _NotificationDetailState();
}

class _NotificationDetailState extends State<NotificationDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Détails"),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: Card(
                  //margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Détails sur votre demande",
                          style: GoogleFonts.raleway(
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Type de la demande : ",
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Souscription à une assurance santé",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Nom du bénéficiaire : ",
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "TOTON Alban",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Date de naissance : ",
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "15-03-2002",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Date de la demande : ",
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "20-07-2024",
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w600,
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
              Expanded(
                child: Card(
                  //margin: const EdgeInsets.all(10),
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      children: [
                        Text(
                          "Autre informations",
                          style: GoogleFonts.raleway(
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Périodicité : ",
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "Mensuelle",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Montant à payer : ",
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "XOF 25 000",
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
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                "Nom du demandeur : ",
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                            Expanded(
                              child: Text(
                                "TOTON SENOU Come",
                                style: GoogleFonts.raleway(
                                  color: const Color(0xFF333333),
                                  fontWeight: FontWeight.w600,
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
            ],
          ),
          Card(
            //margin: const EdgeInsets.all(10),
            child: Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(
                    "Concernant l'assurance santé",
                    style: GoogleFonts.raleway(
                      color: const Color(0xFF333333),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "L' ",
                          style: GoogleFonts.raleway(
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: "assurance crédit",
                          style: GoogleFonts.raleway(
                            color: const Color.fromARGB(255, 126, 166, 179),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: " est une forme d'assurance liée à un "
                              "prêt ou à une ligne de crédit. Elle vise à protéger l'emprunteur en "
                              "couvrant les remboursements en cas d'événements imprévus tels que le "
                              "décès, l'invalidité ou la perte d'emploi. Cela offre ",
                          style: GoogleFonts.raleway(
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: "une sécurité financière",
                          style: GoogleFonts.raleway(
                            color: const Color.fromARGB(255, 126, 166, 179),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text:
                              " en garantissant que le prêt sera remboursé même si "
                              "l'emprunteur rencontre ",
                          style: GoogleFonts.raleway(
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: "des difficultés",
                          style: GoogleFonts.raleway(
                            color: const Color.fromARGB(255, 126, 166, 179),
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                          ),
                        ),
                        TextSpan(
                          text: ".",
                          style: GoogleFonts.raleway(
                            color: const Color(0xFF333333),
                            fontWeight: FontWeight.w400,
                            fontSize: 18,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) {
                      return const Paiement();
                    },
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 126, 166, 179),
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
                    "Passez au paiement",
                    style: GoogleFonts.raleway(
                      color: const Color(0xFFFFFFFF),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(Icons.payment)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
