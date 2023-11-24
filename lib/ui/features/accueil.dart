import 'package:edu_guard/ui/features/profil.dart';
import 'package:edu_guard/ui/insurance/insurance_types_pages.dart';
import 'package:edu_guard/ui/paiement/paiement.dart';
import 'package:edu_guard/ui/providers/image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Accueil extends ConsumerStatefulWidget {
  const Accueil({super.key});

  @override
  ConsumerState<Accueil> createState() => _AccueilState();
}

class _AccueilState extends ConsumerState<Accueil> {
  @override
  Widget build(BuildContext context) {
    final selectedImage = ref.watch(imageProvider);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.home),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          children: [
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
                        "asset/images/smile.jpg",
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
                            borderRadius: BorderRadius.all(Radius.circular(23)),
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
                              radius: 12,
                              child: Icon(Icons.arrow_forward),
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
                                      color: const Color(0xFFFFFFFF),
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
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => const Paiement(),
                                ),
                              );
                            },
                            child: const CircleAvatar(
                              radius: 12,
                              child: Icon(Icons.arrow_forward),
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
                                  "Paiement",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFFFFFFFF),
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
                            borderRadius: BorderRadius.all(Radius.circular(23)),
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
                              radius: 12,
                              child: Icon(Icons.arrow_forward),
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
                                      ? Image.asset(
                                          'assets/icon/user_icon.png',
                                          width: 60,
                                        )
                                      : null,
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Profil",
                                  style: GoogleFonts.raleway(
                                    color: const Color(0xFFFFFFFF),
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
                          height: 214,
                          decoration: const BoxDecoration(
                            color: Color(0xFF333333),
                            borderRadius: BorderRadius.all(Radius.circular(23)),
                          ),
                        ),
                        Positioned(
                          bottom: 10,
                          right: 10,
                          child: InkWell(
                            onTap: () {},
                            child: const CircleAvatar(
                              radius: 12,
                              child: Icon(Icons.arrow_forward),
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
                                      color: const Color(0xFFFFFFFF),
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
    );
  }
}
