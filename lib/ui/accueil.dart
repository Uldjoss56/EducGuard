import 'package:eduguard/ui/cursus/list/cursus_list.dart';
import 'package:eduguard/ui/insurance_chosen/insurance_types_pages.dart';
import 'package:eduguard/ui/notification/notification.dart';
import 'package:eduguard/ui/profil.dart';
import 'package:eduguard/ui/registration_connexion/registration/model/authentificated_user.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:eduguard/providers/image.dart';

class Accueil extends ConsumerStatefulWidget {
  const Accueil({
    super.key,
    this.user,
  });
  final User? user;

  @override
  ConsumerState<Accueil> createState() => _AccueilState();
}

class _AccueilState extends ConsumerState<Accueil> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final selectedImage = ref.watch(imageProvider);
    return Scaffold(
      backgroundColor: const Color(0xEEFFFFFF),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const NotificationPage(),
                ),
              );
            },
            style: IconButton.styleFrom(
              backgroundColor: const Color(0xFF333333),
            ),
            icon: Stack(
              children: [
                const Icon(
                  Icons.notifications,
                  color: Color(0xFF4169E1),
                ),
                Positioned(
                  right: 0,
                  top: -2,
                  child: Text(
                    "+9",
                    style: GoogleFonts.raleway(
                      //color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Bourses et opportunités",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      color: const Color(0xFF333333),
                    ),
                  ),
                  Text(
                    "voir plus",
                    style: GoogleFonts.raleway(
                      fontWeight: FontWeight.w600,
                      fontSize: 12,
                      color: const Color(0xFF333333),
                    ),
                  ),
                ],
              ),
              CarouselSlider(
                options: CarouselOptions(height: 100, autoPlay: true),
                items: [1, 2, 3, 4, 5].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                            color: Colors.amber,
                            borderRadius: BorderRadius.circular(10)),
                        child: Image.asset(
                          "assets/images/smile.jpg",
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                color: const Color(0xFF333333),
                height: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 155,
                            height: 214,
                            decoration: const BoxDecoration(
                              color: Color(0xFFADD8E6),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(23)),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        const InsuranceTypePage(),
                                  ),
                                );
                              },
                              child: const CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 25,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    child: SvgPicture.asset(
                                      'assets/image/undraw_address_re_yaoj.svg',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      "Souscrire à une assurance",
                                      style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 155,
                            height: 162,
                            decoration: const BoxDecoration(
                              color: Color(0xFF4169E1),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(23)),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: InkWell(
                              onTap: () {},
                              child: const CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 35,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    child: SvgPicture.asset(
                                      'assets/image/undraw_address_re_yaoj.svg',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Historique",
                                    style: GoogleFonts.raleway(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: 155,
                            height: 162,
                            decoration: const BoxDecoration(
                              color: Color(0xFF40E0D0),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(23)),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const Profil(),
                                  ),
                                );
                              },
                              child: const CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 35,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    foregroundImage: selectedImage != null
                                        ? FileImage(selectedImage)
                                        : null,
                                    child: selectedImage == null
                                        ? ClipOval(
                                            child: AspectRatio(
                                              aspectRatio: 0.7,
                                              child: Image.asset(
                                                'assets/icon/user_icon.png',
                                                width: 60,
                                              ),
                                            ),
                                          )
                                        : null,
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Text(
                                    "Profil",
                                    style: GoogleFonts.raleway(),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Stack(
                        children: [
                          Container(
                            width: 155,
                            height: 214,
                            decoration: const BoxDecoration(
                              color: Color(0xFF333333),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(23)),
                            ),
                          ),
                          Positioned(
                            bottom: 10,
                            right: 10,
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => const CursusList(),
                                  ),
                                );
                              },
                              child: const CircleAvatar(
                                radius: 16,
                                child: Icon(
                                  Icons.arrow_forward,
                                  size: 16,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 30,
                              ),
                              Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  CircleAvatar(
                                    radius: 40,
                                    child: SvgPicture.asset(
                                      'assets/image/undraw_address_re_yaoj.svg',
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 100,
                                    child: Text(
                                      "Planifier son cursus universitaire",
                                      style: GoogleFonts.raleway(
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
