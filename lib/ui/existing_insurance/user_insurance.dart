import 'package:eduguard/data/insurance.dart';
import 'package:eduguard/data/insurance_type.dart';
import 'package:eduguard/ui/existing_insurance/widget/user_insurance_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class UserInsuranceListPage extends StatefulWidget {
  const UserInsuranceListPage({super.key});

  @override
  State<UserInsuranceListPage> createState() => _UserInsuranceListPageState();
}

class _UserInsuranceListPageState extends State<UserInsuranceListPage> {
  List<Insurance>? _listUserInsurance;
  final List<InsuranceType> _listInsuranceTypes = [
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
      imagePath: 'assets/images/travel_insurance.jpg',
      colors: ['ADD8E6', 'D1F0FA'],
    ),
  ];
  @override
  void initState() {
    super.initState();
    _listUserInsurance = [
      Insurance(
        insuranceID: "A12345",
        insuranceTypeID: "1",
        idAutoGenerate: "ID123",
        insuranceFrequency: "Mensuel",
        insuranceDuration: "1 an",
        renouvellement: "Oui",
        dateRenouvellement: "01/12/2023",
        dateDebutContrat: "01/12/2022",
        fullName: "John Doe",
        email: "john.doe@example.com",
        phoneNumber: "+1234567890",
        birthday: "01/01/1990",
        profession: "Ingénieur",
        statutionMatrimoniale: "Célibataire",
        cardID: "CARD456",
        revenuAnnuel: "50000\$",
        dateSave: "01/12/2022",
      ),
      Insurance(
        insuranceID: "B67890",
        insuranceTypeID: "2",
        idAutoGenerate: "ID456",
        insuranceFrequency: "Trimestriel",
        insuranceDuration: "6 mois",
        renouvellement: "Non",
        dateRenouvellement: "",
        dateDebutContrat: "01/03/2022",
        fullName: "Jane Smith",
        email: "jane.smith@example.com",
        phoneNumber: "+9876543210",
        birthday: "15/05/1985",
        profession: "Médecin",
        statutionMatrimoniale: "Marié(e)",
        cardID: "CARD789",
        revenuAnnuel: "70000\$",
        dateSave: "01/03/2022",
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(
              width / 30,
              width / 6,
              width / 30,
              0,
            ),
            child: SizedBox(
              width: width,
              child: Center(
                child: Row(
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
                        child: RichText(
                          text: TextSpan(
                            children: [
                              WidgetSpan(
                                child: Text(
                                  "Liste de mes ",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                              WidgetSpan(
                                child: Text(
                                  "assurances ",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFF333333),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(
                bottom: width / 5,
              ),
              child: (_listUserInsurance == null || _listUserInsurance!.isEmpty)
                  ? const Center(
                      child: Text(
                        "Aucune assurance",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF4169E1),
                          fontWeight: FontWeight.w300,
                          fontStyle: FontStyle.italic,
                          fontSize: 20,
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: _listUserInsurance == null
                          ? 0
                          : _listUserInsurance!.length,
                      itemBuilder: (context, index) {
                        final userInsurance = _listUserInsurance![index];
                        final insuranceType = _listInsuranceTypes[
                            int.parse(userInsurance.insuranceTypeID) - 1];
                        return UserInsuranceTile(
                          userInsurance: userInsurance,
                          insuranceType: insuranceType,
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
    );
  }
}
