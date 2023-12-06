
import 'package:eduguard/data/insurance.dart';
import 'package:eduguard/data/insurance_type.dart';
import 'package:eduguard/ui/shapes/notification_widget_clipper.dart';
import 'package:eduguard/ui/insurance_chosen/renew_insurance.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserInsuranceTile extends StatelessWidget {
  const UserInsuranceTile({
    super.key,
    required this.userInsurance,
    required this.insuranceType,
  });
  final Insurance userInsurance;
  final InsuranceType insuranceType;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    final format = NumberFormat("##,###", "fr");
    final width = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) {
              return RenewInsurance(
                userInsurance: userInsurance,
              );
            },
          ),
        );
      },
      child: Container(
        padding: const EdgeInsets.fromLTRB(30, 10, 30, 0),
        child: ClipPath(
          clipper: NotificationClipper(),
          child: Container(
            padding: const EdgeInsets.all(15),
            decoration: const BoxDecoration(
              color: Color(0xFFE7E7E8),
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: width / 10,
                  child: ClipOval(
                    child: AspectRatio(
                      aspectRatio: 1,
                      child: Image.asset(
                        insuranceType.imagePath,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(
                            0,
                            width / 40,
                            width / 40,
                            width / 40,
                          ),
                          child: Text(
                            insuranceType.title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: const Color(0xFF212121),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: width / 25,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(width / 40),
                          child: Text(
                            userInsurance.insuranceFrequency,
                            style: TextStyle(
                              color: const Color(0xFF212121),
                              fontFamily: 'Poppins',
                              fontWeight: FontWeight.w600,
                              fontSize: width / 30,
                            ),
                          ),
                        ),
                      ],
                    ),
                    RichText(
                      textAlign: TextAlign.start,
                      text: TextSpan(
                        children: [
                          WidgetSpan(
                            child: Text(
                              userInsurance.insuranceDuration,
                              style: TextStyle(
                                color: const Color(0xFF146CC2),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: width / 20,
                              ),
                            ),
                          ),
                          const WidgetSpan(
                            child: Icon(
                              Icons.arrow_right,
                              color: Color(0xFF146CC2),
                            ),
                          ),
                          WidgetSpan(
                            child: Text(
                              userInsurance.dateDebutContrat,
                              style: TextStyle(
                                color: const Color(0xFF146CC2),
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                fontSize: width / 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
