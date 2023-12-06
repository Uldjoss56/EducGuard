
import 'package:eduguard/data/insurance.dart';
import 'package:eduguard/data/insurance_type.dart';
import 'package:eduguard/ui/insurance_chosen/receiver_can_dispose.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RenewInsurance extends StatefulWidget {
  const RenewInsurance({
    super.key,
    required this.userInsurance,
  });
  final Insurance userInsurance;
  @override
  State<RenewInsurance> createState() => _RenewInsuranceState();
}

class _RenewInsuranceState extends State<RenewInsurance> {
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final List<InsuranceType> listInsuranceTypes = [
      InsuranceType(
        title: "Assurance santé",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing"
            " elit, sed do eiusmod tempor incididunt ut labore et "
            "dolore magna aliqua. Ut enim ad minim veniam, quis "
            "nostrud exercitation ullamco laboris nisi ut aliquip "
            "ex ea commodo consequat. Duis aute irure dolor in "
            "reprehenderit in voluptate velit esse cillum dolore eu "
            "fugiat nulla pariatur. Excepteur sint occaecat cupidatat"
            " non proident, sunt in culpa qui officia deserunt mollit"
            " anim id est laborum.",
        imagePath: 'assets/images/health_insurance.jpg',
        colors: ['ADD8E6', 'D1F0FA'],
      ),
      InsuranceType(
        title: "Assurance crédit",
        description: "Lorem ipsum dolor sit amet, consectetur adipiscing"
            " elit, sed do eiusmod tempor incididunt ut labore et "
            "dolore magna aliqua. Ut enim ad minim veniam, quis "
            "nostrud exercitation ullamco laboris nisi ut aliquip "
            "ex ea commodo consequat. Duis aute irure dolor in "
            "reprehenderit in voluptate velit esse cillum dolore eu "
            "fugiat nulla pariatur. Excepteur sint occaecat cupidatat"
            " non proident, sunt in culpa qui officia deserunt mollit"
            " anim id est laborum.",
        imagePath: 'assets/images/health_insurance.jpg',
        colors: ['ADD8E6', 'D1F0FA'],
      ),
    ];
    final insuranceType = listInsuranceTypes[0];
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
                      "Renouvellement d'assurance",
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
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.fromLTRB(
                width / 15,
                width / 100,
                width / 15,
                0,
              ),
              child: Text(
                "À cette étape, vous aurez à fournir les documents nécessaires "
                "pour votre demande",
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w600,
                  fontSize: 18,
                  color: const Color(0xFF4169E1),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Text(
                      "Télécharger ici le contrat",
                      textAlign: TextAlign.center,
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(
                          20,
                        ),
                      ),
                    ),
                    child: const Icon(
                      Icons.file_download,
                    ),
                  ),
                ],
              ),
            ),
            Image.asset(
              insuranceType.imagePath,
              width: width,
            ),
            Container(
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
              child: ListTile(
                title: Container(
                  margin: EdgeInsets.all(width / 80),
                  padding: EdgeInsets.fromLTRB(
                    width / 20,
                    width / 200,
                    width / 20,
                    width / 200,
                  ),
                  decoration: const BoxDecoration(
                    color: Color(0xFFFFFFFF),
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Text(
                    "Contrat",
                    style: GoogleFonts.raleway(),
                  ),
                ),
                subtitle: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "chosen file name (.jpg, .pdf, .png)",
                        style: GoogleFonts.raleway(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: const Color(0xFF0486b1),
                        ),
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.upload_file,
                        color: Color(0xFF0486b1),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: width / 10,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (_) {
                      return const ReceiverCanDispose();
                    },
                  ),
                  (route) => route.isFirst,
                );
              },
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: width / 3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    10,
                  ),
                ),
              ),
              child: Text(
                "Terminer",
                style: GoogleFonts.raleway(
                  fontWeight: FontWeight.w800,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: width / 10,
            ),
          ],
        ),
      ),
    );
  }
}
