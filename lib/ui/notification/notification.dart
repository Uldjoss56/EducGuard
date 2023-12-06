import 'package:eduguard/ui/notification/widgets/notification_tile.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificationPage extends StatefulWidget {
  const NotificationPage({super.key});

  @override
  State<NotificationPage> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  List<String>? userNotification;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Notifications"),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: !(userNotification == null || userNotification == [])
            ? Center(
                child: Text(
                  "Vide..",
                  style: GoogleFonts.raleway(
                    color: const Color(0xFF333333),
                  ),
                ),
              )
            : ListView.builder(
                itemCount: 4,
                itemBuilder: (context, index) {
                  return const NotificationTile();
                },
              ),
      ),
    );
  }
}
