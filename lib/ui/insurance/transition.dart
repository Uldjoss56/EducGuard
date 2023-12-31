import 'package:edu_guard/data/insurance_type.dart';
import 'package:edu_guard/ui/insurance/policyholder_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Transition extends StatefulWidget {
  const Transition({
    super.key,
    required this.index,
  });

  final int index;

  @override
  State<Transition> createState() => _TransitionState();
}

class _TransitionState extends State<Transition> {
  final List<InsuranceType> _listInsurances = [
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
      imagePath: 'asset/images/health_insurance.jpg',
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
      imagePath: 'asset/images/travel_insurance.jpg',
      colors: ['ADD8E6', 'D1F0FA'],
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final insurance = _listInsurances[widget.index];
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
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.fromLTRB(
              width / 15,
              width / 15,
              width / 15,
              0,
            ),
            child: Text(
              "Une assurance pour vous-même ou pour une personne tierce ?",
              style: GoogleFonts.raleway(
                fontWeight: FontWeight.w600,
                fontSize: 22,
                color: const Color(0xFF4169E1),
              ),
            ),
          ),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: width / 3,
            child: ClipOval(
              child: AspectRatio(
                aspectRatio: 1,
                child: Image.asset(
                  insurance.imagePath,
                ),
              ),
            ),
          ),
          SizedBox(
            height: width / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: width / 40,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PolicyHolderDetail(
                          index: widget.index,
                          isForCurrentUser: false,
                        ),
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
                  child: Text(
                    "Pour une autre personne",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.raleway(
                      color: const Color(0xFF4169E1),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width / 40,
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PolicyHolderDetail(
                          index: widget.index,
                          isForCurrentUser: true,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: Text(
                    "Moi-même",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: width / 40,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
