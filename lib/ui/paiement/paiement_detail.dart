import 'package:eduguard/providers/user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PaiementDetail extends ConsumerStatefulWidget {
  const PaiementDetail({super.key});

  @override
  ConsumerState<PaiementDetail> createState() => _PaiementDetailState();
}

class _PaiementDetailState extends ConsumerState<PaiementDetail> {
  bool isPressedBack = false;
  final NumberFormat format = NumberFormat("#,###", "fr");

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(userProvider);
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(
          top: width / 16,
        ),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(bottom: width / 20),
              decoration: const BoxDecoration(
                  color: Colors.white,
                  // borderRadius: BorderRadius.all(
                  //   Radius.circular(20),
                  // ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(0, 0),
                      blurRadius: 2,
                      spreadRadius: 2,
                      color: Color(0x21000000),
                    ),
                  ]),
              child: Column(
                children: [
                  Image.asset(
                    "assets/logo/logo.png",
                    height: width / 4,
                    width: width / 4,
                  ),
                  GestureDetector(
                    onTapDown: (TapDownDetails details) {
                      setState(() {
                        isPressedBack = true;
                      });
                    },
                    onTapUp: (TapUpDetails details) {
                      setState(() {
                        isPressedBack = false;
                      });
                    },
                    onTapCancel: () {
                      setState(() {
                        isPressedBack = false;
                      });
                    },
                    onTap: () => Navigator.of(context).pop(),
                    child: Container(
                      margin: EdgeInsets.fromLTRB(
                          width / 16, 0, 11 * width / 16, 0),
                      padding: const EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        boxShadow: isPressedBack
                            ? const [
                                BoxShadow(
                                  color: Color(0x22000000),
                                  offset: Offset(0, 2),
                                  blurRadius: 2.0,
                                  spreadRadius: 2.0,
                                ),
                              ]
                            : [],
                        border: Border.all(
                          color: const Color(0xFF146CC2),
                        ),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(10),
                        ),
                        color: const Color(0xFFF7F7F8),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.chevron_left,
                            color: Color(0xFF146CC2),
                          ),
                          Text(
                            "Retour",
                            style: GoogleFonts.raleway(
                              color: const Color(0xFF146CC2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(20),
                margin: EdgeInsets.all(width / 15),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(
                    Radius.circular(30),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x22000000),
                      offset: Offset(0, 2),
                      blurRadius: 2.0,
                      spreadRadius: 2.0,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        padding:
                            EdgeInsets.fromLTRB(width / 40, 0, width / 40, 0),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  right: width / 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        bottom: 20,
                                      ),
                                      child: Text(
                                        "Entreprise",
                                        style: GoogleFonts.raleway(
                                          color: const Color(0xFF212121),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Adresse",
                                            style: GoogleFonts.raleway(
                                              color: const Color(0xFF212121),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "Arconville, Bénin",
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.raleway(
                                              color: const Color(0xFF212121),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        bottom: 05,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mail",
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.raleway(
                                              color: const Color(0xFF212121),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "contact@gmail.com",
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.raleway(
                                              color: const Color(0xFF212121),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(
                                        bottom: 05,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Contact",
                                            style: GoogleFonts.raleway(
                                              color: Color(0xFF212121),
                                              fontWeight: FontWeight.w400,
                                              fontSize: 18,
                                            ),
                                          ),
                                          Text(
                                            "+229 64548929",
                                            textAlign: TextAlign.justify,
                                            style: GoogleFonts.raleway(
                                              color: const Color(0xFF212121),
                                              fontWeight: FontWeight.w300,
                                              fontSize: 14,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                margin: EdgeInsets.only(
                                  left: width / 20,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.only(
                                        bottom: 20,
                                      ),
                                      child: Text(
                                        "Utilisateur",
                                        style: GoogleFonts.raleway(
                                          color: Color(0xFF212121),
                                          fontWeight: FontWeight.w800,
                                          fontSize: 20,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      "Nom",
                                      style: GoogleFonts.raleway(
                                        color: Color(0xFF212121),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18,
                                      ),
                                    ),
                                    Text(
                                      "${user!.fullName}",
                                      textAlign: TextAlign.justify,
                                      softWrap: true,
                                      style: GoogleFonts.raleway(
                                        color: const Color(0xFF212121),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(
                          width / 40,
                          width / 10,
                          width / 40,
                          0,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: width / 40,
                              ),
                              child: Text(
                                "Détails de la transaction ",
                                style: GoogleFonts.raleway(
                                  color: Color(0xFF212121),
                                  fontWeight: FontWeight.w800,
                                  fontSize: 20,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Motif : ",
                                    style: GoogleFonts.raleway(
                                      color: const Color(0xFF212121),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "Paiement mensuel de l'assurance ",
                                      style: GoogleFonts.raleway(
                                        color: const Color(0xFF212121),
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Total de payement : ",
                                    style: GoogleFonts.raleway(
                                      color: const Color(0xFF212121),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "XOF ${format.format(20000)}",
                                      style: GoogleFonts.raleway(
                                        color: const Color(0xFF212121),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Par : ",
                                    style: GoogleFonts.raleway(
                                      color: const Color(0xFF212121),
                                      fontWeight: FontWeight.w400,
                                      fontSize: 18,
                                    ),
                                  ),
                                  Expanded(
                                    child: Text(
                                      "MTN MoMo",
                                      style: GoogleFonts.raleway(
                                        color: const Color(0xFF212121),
                                        fontWeight: FontWeight.w300,
                                        fontSize: 14,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: width / 10,
                      ),
                      Row(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(10),
                            child: const Icon(
                              Icons.print,
                            ),
                          ),
                          Text(
                            "Télécharger ma facture",
                            style: GoogleFonts.raleway(
                              color: const Color(0xFF00AA00),
                              fontWeight: FontWeight.w400,
                              fontSize: width / 25,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
