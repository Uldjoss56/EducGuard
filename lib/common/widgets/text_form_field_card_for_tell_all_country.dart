
import 'package:edu_guard/ui/constants/colors.dart';
import 'package:edu_guard/ui/constants/data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TextFormFieldCardForTellAllCountry extends StatefulWidget {
  const TextFormFieldCardForTellAllCountry({
    super.key,
    this.controller,
    this.maxLines,
    this.obscureText = false,
    this.initialValue,
    this.onChanged,
    this.onSaved,
    this.onTap,
    this.validator,
    this.hintText,
    this.prefixIcon,
    this.suffixIcon,
  });
  final TextEditingController? controller;
  final int? maxLines;
  final bool obscureText;
  final String? initialValue;
  final void Function(String?)? onChanged;
  final void Function(String?)? onSaved;
  final void Function()? onTap;
  final String? Function(String?)? validator;
  final String? hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  State<TextFormFieldCardForTellAllCountry> createState() =>
      _TextFormFieldCardForTellAllCountryState();
}

class _TextFormFieldCardForTellAllCountryState
    extends State<TextFormFieldCardForTellAllCountry> {
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    String currentCountryCode = '+229';
    // ignore: unused_local_variable
    String pathToCurrentCountryFlag = 'assets/image/flag/benin_flag.jpg';
    return TextFormField(
        controller: widget.controller,
        maxLines: widget.maxLines,
        obscureText: widget.obscureText,
        initialValue: widget.initialValue,
        onChanged: widget.onChanged,
        onSaved: widget.onSaved,
        onTap: widget.onTap,
        validator: widget.validator,
        decoration: InputDecoration(
          hintText: widget.hintText,
          hintStyle: GoogleFonts.raleway(),
          prefixIcon: GestureDetector(
            onTap: () {
              showModalBottomSheet(
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                context: context,
                builder: (context) {
                  return SingleChildScrollView(
                    child: Column(
                      children: List.generate(
                        country.length,
                        (index) {
                          return Container(
                            margin: const EdgeInsets.all(15),
                            child: InkWell(
                              onTap: () {
                                setState(() {
                                  currentCountryCode =
                                      country[index]['indicatif'].toString();
                                  pathToCurrentCountryFlag =
                                      country[index]['drapeau'].toString();
                                  Navigator.pop(context);
                                });
                              },
                              child: Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: AssetImage(
                                        "${country[index]['drapeau']}"),
                                    radius: 20,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${country[index]['nom']}",
                                      ),
                                      Text(
                                        "${country[index]['indicatif']}",
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                  );
                },
              );
            },
          ),
          suffixIcon: widget.suffixIcon,
          border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
          ),
          focusedBorder: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15)),
            borderSide: BorderSide(color: myBlueRoyal),
          ),
        ));
  }
}
