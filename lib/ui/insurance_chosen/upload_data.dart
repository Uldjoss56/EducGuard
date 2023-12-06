import 'dart:io';

import 'package:dropdown_search/dropdown_search.dart';
import 'package:eduguard/data/insurance_type.dart';
import 'package:eduguard/ui/insurance_chosen/receiver_can_dispose.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:path_provider/path_provider.dart';

class UploadData extends StatefulWidget {
  const UploadData({
    super.key,
    required this.index,
  });
  final int index;

  @override
  State<UploadData> createState() => _UploadDataState();
}

class _UploadDataState extends State<UploadData> {
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

  int _docUploadedLenght = 0;
  final docName = [
    [
      "Contrat",
      "Acte de naissance",
      "Carte d'identité ou passport",
      "Fiche de paie",
      "Appartenance programme de bourse",
    ],
    [
      "Contrat",
      "Acte de naissance",
      "Carte d'identité ou passport",
      "Fiche de paie",
      "Appartenance programme de bourse",
    ],
    [
      "Contrat",
      "Acte de naissance",
      "Carte d'identité ou passport",
      "Fiche de paie",
      "Appartenance programme de bourse",
    ],
    [
      "Contrat",
      "Acte de naissance",
      "Carte d'identité ou passport",
      "Fiche de paie",
      "Appartenance programme de bourse",
    ],
    [
      "Contrat",
      "Acte de naissance",
      "Carte d'identité ou passport",
      "Fiche de paie",
      "Appartenance programme de bourse",
    ]
  ];
  final List<String> _fileName = ['', '', '', '', ''];
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
                        color: Colors.black,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () async {
                      await downloadAndSaveFile(
                        'assets/doc/Flutter_Courses_Structure.docx',
                        'contrat_file.docx',
                      );
                    },
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
              insurance.imagePath,
              width: width,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                padding: EdgeInsets.fromLTRB(
                  width / 15,
                  width / 100,
                  width / 15,
                  0,
                ),
                child: Text(
                  "Veuillez uploader chacune des pièces jointes :",
                  style: GoogleFonts.raleway(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                  ),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.all(width / 30),
              padding: EdgeInsets.symmetric(
                horizontal: width / 20,
                vertical: width / 480,
              ),
              decoration: const BoxDecoration(
                color: Color(0xFFD1F0FA),
                borderRadius: BorderRadius.all(
                  Radius.circular(30),
                ),
              ),
              child: const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "1- Contrat édité et signé",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      "2- Acte de naissance",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      "3- Carte d'identité ou passport",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      "4- Fiche de paie",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    Text(
                      "5- Document prouvant votre inclusion dans un programme de bourses",
                      style: TextStyle(
                        color: Color(0xFF333333),
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              children: List.generate(
                _docUploadedLenght,
                (index) {
                  return Container(
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
                          child: DropdownSearch(
                            items: docName[index],
                            onChanged: (value) {
                              for (int num = 0; num < 5; num++) {
                                if (num != index) {
                                  docName[num].remove(value);
                                } else {
                                  docName[num].removeWhere(
                                    (element) {
                                      if (element != value) {
                                        return true;
                                      }
                                      return false;
                                    },
                                  );
                                }
                              }
                            },
                            dropdownDecoratorProps:
                                const DropDownDecoratorProps(
                              dropdownSearchDecoration: InputDecoration(
                                  hintText: "Nature du fichier",
                                  border: UnderlineInputBorder(
                                    borderSide: BorderSide.none,
                                  )),
                            ),
                            popupProps: const PopupProps.modalBottomSheet(),
                          )),
                      subtitle: Row(
                        children: [
                          Expanded(
                            child: Text(
                              _fileName[index].isEmpty
                                  ? "chosen file name (.jpg, .pdf, .png)"
                                  : _fileName[index],
                              style: GoogleFonts.raleway(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF0486b1),
                              ),
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              pickFile(index);
                            },
                            icon: const Icon(
                              Icons.upload_file,
                              color: Color(0xFF0486b1),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: width / 30),
              child: Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton(
                  onPressed: _docUploadedLenght >= 5
                      ? null
                      : () {
                          if (_docUploadedLenght < 5) {
                            setState(() {
                              ++_docUploadedLenght;
                            });
                          }
                        },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFADD8E6),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        10,
                      ),
                    ),
                  ),
                  child: const Icon(
                    Icons.add,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: width / 10,
            ),
            ElevatedButton(
              onPressed: () {
                bool canGoToNext = false;
                for (String value in _fileName) {
                  if (value.isEmpty) {
                    canGoToNext = false;
                    break;
                  }
                  canGoToNext = true;
                }
                if (canGoToNext) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) {
                        return const ReceiverCanDispose();
                      },
                    ),
                    (route) => route.isFirst,
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text(
                        "Pièces manquantes ",
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w700,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  );
                }
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

  void pickFile(int index) async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      String fileType = filePath.split('.').last.toLowerCase();

      if (fileType == 'pdf' ||
          fileType == 'jpg' ||
          fileType == 'png' ||
          fileType == 'docx') {
        if (result.files.single.size <= 2 * 1024 * 1024) {
          setState(() {
            _fileName[index] = filePath.split("/").last;
          });
        } else {
          // ignore: use_build_context_synchronously
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "File size exceeds 2 MB.",
                style: TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ),
          );
        }
      } else {
        // ignore: use_build_context_synchronously
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              "Invalid file type. Allowed types: pdf, jpg, png.",
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w700,
                fontSize: 12,
              ),
            ),
          ),
        );
      }
    } else {}
  }

  Future<void> downloadAndSaveFile(String assetPath, String fileName) async {
    try {
      ByteData data = await rootBundle.load(assetPath);
      List<int> bytes = data.buffer.asUint8List();

      final downloadsDirectory = await getDownloadsDirectory();
      print(downloadsDirectory);

      if (downloadsDirectory == null) {
        print('Error: Unable to get the downloads directory.');
        return;
      }

      final fileOnDevice = File('${downloadsDirectory.path}/$fileName');

      await fileOnDevice.writeAsBytes(bytes);
      print(bytes);
      print('File downloaded to: ${fileOnDevice.path}');
    } catch (e) {
      print('Error: $e');
    }
  }
}
