import 'package:eduguard/data/insurance_type.dart';
import 'package:eduguard/ui/accueil.dart';
import 'package:eduguard/ui/registration_connexion/registration/model/authentificated_user.dart';
import 'package:eduguard/ui/shapes/container_clipper.dart';
import 'package:eduguard/ui/insurance_chosen/upload_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class PolicyHolderDetail extends ConsumerStatefulWidget {
  const PolicyHolderDetail({
    super.key,
    required this.index,
    required this.isForCurrentUser,
  });
  final int index;
  final bool isForCurrentUser;

  @override
  ConsumerState<PolicyHolderDetail> createState() => _PolicyHolderDetailState();
}

class _PolicyHolderDetailState extends ConsumerState<PolicyHolderDetail> {
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

  final user = User(
    fullName: "Ange Dieu-Donne",
    email: "",
    phoneNumber: "225787878787",
    profileImagePath: "",
    livingAddress: "Arconville",
    profession: "Etudiant",
    birthday: "26/07/2003",
    revenuAnnuel: "5600000 XOF",
  );

  final TextEditingController _nameController = TextEditingController();

  final TextEditingController _phoneController = TextEditingController();

  final TextEditingController _adresseController = TextEditingController();

  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _professionController = TextEditingController();

  final TextEditingController _numeroPieceIDController =
      TextEditingController();

  final TextEditingController _revenuController = TextEditingController();

  final TextEditingController _nationalityController = TextEditingController();

  final TextEditingController _statusEmploiController = TextEditingController();

  final TextEditingController _sexeController = TextEditingController();

  DateTime? _selectedDate;

  final formatter = DateFormat.yMd();

  int currentPage = 0;

  void _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(
      now.year - 60,
      now.month,
      now.day,
      now.second,
    );
    final initialDate = DateTime(
      now.year - 16,
      now.month,
      now.day,
      now.second,
    );
    final lastDate = DateTime(
      now.year - 9,
      now.month,
      now.day,
      now.second,
    );
    final pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: firstDate,
      lastDate: lastDate,
    );
    setState(() {
      _selectedDate = pickedDate;
    });
  }

  @override
  void initState() {
    super.initState();
    if (widget.isForCurrentUser) {
      _nameController.text = user.fullName!;
      _emailController.text = user.email!;
      _phoneController.text = user.phoneNumber!;
      _adresseController.text = user.livingAddress!;
      _professionController.text = user.profession!;
      _revenuController.text = user.revenuAnnuel!;
      final userBirthdayFormatted = user.birthday!.split("/");
      _selectedDate = DateTime(
        int.parse(userBirthdayFormatted[2]),
        int.parse(userBirthdayFormatted[1]),
        int.parse(userBirthdayFormatted[0]),
      );
    }
  }

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
                  onPressed: () {
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (_) => const Accueil(),
                      ),
                      (route) => false,
                    );
                  },
                  icon: const Icon(
                    Icons.home,
                    color: Color(
                      0xFF0486b1,
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
                      "Souscrire à une ${insurance.title.toLowerCase()}",
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
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(
                      width / 15,
                      width / 30,
                      width / 15,
                      0,
                    ),
                    child: Text(
                      widget.isForCurrentUser
                          ? "Veuillez vérifier les informations pour souscrire à votre assurance."
                          : "Veuillez renseigner les informations du bénéficaire",
                      textAlign: TextAlign.justify,
                      style: GoogleFonts.raleway(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        color: const Color(0xFF0486b1),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: width / 20,
                  ),
                  if (currentPage == 0)
                    Container(
                      margin: EdgeInsets.all(width / 40),
                      padding: EdgeInsets.fromLTRB(
                        width / 20,
                        width / 40,
                        width / 20,
                        width / 10,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(width / 40),
                            child: Text(
                              "Informations personnelles ",
                              style: GoogleFonts.raleway(
                                color: const Color(0xFF0486b1),
                                fontWeight: FontWeight.w600,
                                fontSize: width / 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                              controller: _nameController,
                              decoration: const InputDecoration(
                                hintText: "Nom complet * ",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                              controller: _emailController,
                              decoration: const InputDecoration(
                                hintText: "Email",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                              controller: _phoneController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: "Numéro de téléphone * ",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                              controller: _adresseController,
                              decoration: const InputDecoration(
                                hintText: "Adresse postal * ",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: widget.isForCurrentUser
                                      ? Text(
                                          user.birthday!.isEmpty
                                              ? "Date de naissance *"
                                              : "Date de naissance : "
                                                  "${user.birthday}",
                                          style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        )
                                      : Text(
                                          _selectedDate == null
                                              ? "Date de naissance *"
                                              : "Date de naissance : "
                                                  "${formatter.format(_selectedDate!)}",
                                          style: GoogleFonts.raleway(
                                            color: Colors.black,
                                            fontSize: 16,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                ),
                                IconButton(
                                  onPressed: _presentDatePicker,
                                  icon: const Icon(Icons.calendar_month),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  else if (currentPage == 1)
                    Container(
                      margin: EdgeInsets.all(width / 40),
                      padding: EdgeInsets.fromLTRB(
                        width / 20,
                        width / 40,
                        width / 20,
                        width / 10,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFFADD8E6),
                        borderRadius: BorderRadius.all(
                          Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(width / 40),
                            child: Text(
                              "Informations professionnelles ",
                              style: GoogleFonts.raleway(
                                color: const Color(0xFFFFFFFF),
                                fontWeight: FontWeight.w600,
                                fontSize: width / 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                              controller: _professionController,
                              decoration: const InputDecoration(
                                hintText: "Source de revenu *",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                              controller: _statusEmploiController,
                              decoration: const InputDecoration(
                                hintText: "Status",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                              controller: _revenuController,
                              keyboardType: TextInputType.phone,
                              decoration: const InputDecoration(
                                hintText: "Revenu annuel * ",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  else if (currentPage == 2)
                    Container(
                      margin: EdgeInsets.all(width / 40),
                      padding: EdgeInsets.fromLTRB(
                        width / 20,
                        width / 40,
                        width / 20,
                        width / 10,
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
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.all(width / 40),
                            child: Text(
                              "Informations complémentaires",
                              style: GoogleFonts.raleway(
                                color: const Color(0xFF0486b1),
                                fontWeight: FontWeight.w600,
                                fontSize: width / 20,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                              controller: _nationalityController,
                              keyboardType: TextInputType.name,
                              decoration: const InputDecoration(
                                hintText: "Nationalité *",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                errorBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                              controller: _numeroPieceIDController,
                              keyboardType: TextInputType.number,
                              decoration: const InputDecoration(
                                hintText: "N° carte d'identité ou "
                                    "passport *",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: width / 40),
                            padding: EdgeInsets.symmetric(
                              horizontal: width / 20,
                              vertical: width / 480,
                            ),
                            decoration: const BoxDecoration(
                              color: Color(0xAAD1F0FA),
                              borderRadius: BorderRadius.all(
                                Radius.circular(30),
                              ),
                            ),
                            child: TextFormField(
                              style: GoogleFonts.raleway(
                                fontWeight: FontWeight.w500,
                                color: const Color(0xFF333333),
                              ),
                              controller: _sexeController,
                              decoration: const InputDecoration(
                                hintText: "Sexe",
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide: BorderSide.none,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                ],
              ),
            ),
          ),
          Stack(
            children: [
              Positioned.fill(
                child: ClipPath(
                  clipper: ContainerClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(
                        int.parse(
                          "0xFF${insurance.colors![1]}",
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: width / 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentPage = 0;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(width / 30),
                              decoration: BoxDecoration(
                                color: currentPage == 0
                                    ? const Color(0xFF0486b1)
                                    : const Color(0xFFFFFFFF),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "1",
                                style: GoogleFonts.raleway(
                                  color: currentPage == 0
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF0486b1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width / 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              final isPersonalInfoReady =
                                  (_nameController.text.isNotEmpty &&
                                      _adresseController.text.isNotEmpty &&
                                      _phoneController.text.isNotEmpty &&
                                      _selectedDate != null);
                              setState(() {
                                currentPage = 1;
                              });
                              if (isPersonalInfoReady) {
                              } else {}
                            },
                            child: Container(
                              padding: EdgeInsets.all(width / 30),
                              decoration: BoxDecoration(
                                color: currentPage == 1
                                    ? const Color(0xFF0486b1)
                                    : const Color(0xFFFFFFFF),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "2",
                                style: GoogleFonts.raleway(
                                  color: currentPage == 1
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF0486b1),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: width / 40,
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                currentPage = 2;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(width / 30),
                              decoration: BoxDecoration(
                                color: currentPage == 2
                                    ? const Color(0xFF0486b1)
                                    : const Color(0xFFFFFFFF),
                                shape: BoxShape.circle,
                              ),
                              child: Text(
                                "3",
                                style: GoogleFonts.raleway(
                                  color: currentPage == 2
                                      ? const Color(0xFFFFFFFF)
                                      : const Color(0xFF0486b1),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final isPersonalInfoReady =
                              (_nameController.text.isNotEmpty &&
                                  _adresseController.text.isNotEmpty &&
                                  _phoneController.text.isNotEmpty &&
                                  _selectedDate != null);
                          final isProfInfoReady =
                              (_professionController.text.isNotEmpty &&
                                  _revenuController.text.isNotEmpty);
                          final isAnotherInfoReady =
                              (_nationalityController.text.isNotEmpty &&
                                  _numeroPieceIDController.text.isNotEmpty);
                          if (!isPersonalInfoReady) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Informations personnelles manquantes ",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          } else if (!isProfInfoReady) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Informations professionnelles manquantes ",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          } else if (!isAnotherInfoReady) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                  "Autres informations  manquantes ",
                                  style: TextStyle(
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w700,
                                    fontSize: 12,
                                  ),
                                ),
                              ),
                            );
                          } else {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => UploadData(
                                  index: widget.index,
                                ),
                              ),
                            );
                          }
                        },
                        child: Text(
                          "Suivant",
                          style: GoogleFonts.raleway(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: width / 30,
                  ),
                ],
              ),
            ],
          )
        ],
      ),
    );
  }
/*
  Widget _buildPageIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        3,
        (index) => _buildIndicator(index),
      ),
    );
  }

  Widget _buildIndicator(int index) {
    return Container(
      width: 8.0,
      height: 8.0,
      margin: const EdgeInsets.symmetric(horizontal: 4.0),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: _currentPage == index ? const Color(0xFF0486b1) : Colors.grey,
      ),
    );
  }
*/
}
