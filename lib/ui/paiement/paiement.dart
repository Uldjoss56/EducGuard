import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class Paiement extends StatefulWidget {
  const Paiement({super.key});

  @override
  State<Paiement> createState() => _PaiementState();
}

class _PaiementState extends State<Paiement> {
  final TextEditingController _numTelController = TextEditingController();
  final format = NumberFormat("#,###", "fr");

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: width / 5,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(
              0,
              width / 15,
              0,
              width / 15,
            ),
            child: Text(
              "Moyen de paiement ",
              style: TextStyle(
                color: const Color(0xFF0486b1),
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: width / 18,
              ),
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                margin: EdgeInsets.fromLTRB(
                  width / 30,
                  width / 30,
                  width / 30,
                  0,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF0486b1),
                  ),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(20),
                  ),
                ),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: width / 5,
                      child: ClipOval(
                        child: AspectRatio(
                          aspectRatio: 1,
                          child: Image.asset(
                            "assets/images/mtn_logo.png",
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width / 20,
                    ),
                    Column(
                      children: [
                        Text(
                          "Numéro de paiement",
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                            fontSize: width / 20,
                            color: const Color(0xFFFFBD06),
                          ),
                        ),
                        Container(
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20),
                            ),
                            color: Color(0x10000000),
                          ),
                          margin: const EdgeInsets.all(10),
                          child: TextFormField(
                            controller: _numTelController,
                            keyboardType: TextInputType.phone,
                            style: GoogleFonts.raleway(
                              color: const Color(0xFF333333),
                            ),
                            decoration: InputDecoration(
                              contentPadding:
                                  const EdgeInsets.fromLTRB(20, 10, 20, 10),
                              hintText: "Ex : 22954545490",
                              hintStyle: GoogleFonts.raleway(),
                              enabledBorder: const UnderlineInputBorder(
                                borderSide: BorderSide.none,
                              ),
                              focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Color(0xFFFFBD06),
                                  width: 2,
                                ),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(20),
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: width / 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Montant à payer : ",
                              style: GoogleFonts.raleway(
                                color: const Color(0xFF333333),
                              ),
                            ),
                            Text(
                              "XOF ${format.format(50000)}",
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w800,
                                color: const Color(0xFF333333),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: width / 15,
                        ),
                      ],
                    ),
                    ElevatedButton(
                      onPressed: () async {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF0486b1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                            20,
                          ),
                        ),
                        foregroundColor: Colors.white,
                        padding: EdgeInsets.symmetric(
                          horizontal: width / 4,
                          vertical: width / 40,
                        ),
                      ),
                      child: Text(
                        "Envoyer",
                        style: GoogleFonts.raleway(
                          fontWeight: FontWeight.w600,
                          fontSize: width / 20,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: width / 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
