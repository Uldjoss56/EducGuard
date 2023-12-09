import 'package:eduguard/data/services/momo_service/momo_service.dart';
import 'package:eduguard/ui/paiement/paiement_detail.dart';
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

  final momoService = MomoService();

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Column(
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
                                  hintText: "Ex : 54545490",
                                  hintStyle: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                  ),
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
                                  "XOF ${format.format(20000)}",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                    fontWeight: FontWeight.w600,
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
                          onPressed: () async {
                            final numero = _numTelController.text;
                            if (numero.length == 8) {
                              _showPasswordFormField(width);
                              final response =
                                  await momoService.requestToPay(numero);
                              if (response == "Success") {
                                // ignore: use_build_context_synchronously
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      "Paiement éffectuer avec succès",
                                      style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w700,
                                        fontSize: 12,
                                      ),
                                    ),
                                    backgroundColor: const Color(0xFF0486b1),
                                  ),
                                );
                                // ignore: use_build_context_synchronously
                                Navigator.of(context).pushAndRemoveUntil(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const PaiementDetail(),
                                  ),
                                  (route) => route.isFirst,
                                );
                              }
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    "Numéro de téléphone incorrect ",
                                    style: GoogleFonts.raleway(
                                      fontWeight: FontWeight.w700,
                                      fontSize: 12,
                                    ),
                                  ),
                                  backgroundColor: const Color(0xFF0486b1),
                                ),
                              );
                            }
                          },
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
                            style: TextStyle(
                              fontFamily: 'Poppins',
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
        ],
      ),
    );
  }

  void _showPasswordFormField(double width) {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return const Dialog(
          backgroundColor: Colors.transparent,
          insetAnimationDuration: Duration(
            seconds: 5,
          ),
          child: LinearProgressIndicator(),
        );
      },
    );
  }
}
