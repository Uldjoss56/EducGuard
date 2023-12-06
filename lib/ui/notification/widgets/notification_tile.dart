import 'package:eduguard/ui/notification/notification_detail.dart';
import 'package:flutter/material.dart';

class NotificationTile extends StatelessWidget {
  const NotificationTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: const Text("Demande de souscription à l'assurance santé"),
      subtitle: const Text("Tapez pour en savoir plus"),
      leading: CircleAvatar(
        backgroundColor: Colors.white,
        radius: 30,
        child: ClipOval(
          child: AspectRatio(
            aspectRatio: 1,
            child: Image.asset(
              "assets/images/travel_insurance.jpg",
            ),
          ),
        ),
      ),
      onLongPress: () {},
      trailing: PopupMenuButton<String>(
        itemBuilder: (BuildContext context) {
          return [
            const PopupMenuItem(
              value: 'no_read',
              child: Row(
                children: [
                  Icon(
                    Icons.watch_later,
                  ),
                  SizedBox(width: 8),
                  Text('Marquer comme non lu'),
                ],
              ),
            ),
            const PopupMenuDivider(height: 10),
            const PopupMenuItem(
              value: 'archive',
              child: Row(
                children: [
                  Icon(
                    Icons.archive,
                  ),
                  SizedBox(width: 8),
                  Text('Archiver'),
                ],
              ),
            ),
            const PopupMenuDivider(height: 10),
            const PopupMenuItem(
              value: 'delete',
              child: Row(
                children: [
                  Icon(
                    Icons.delete,
                  ),
                  SizedBox(width: 8),
                  Text('Supprimer'),
                ],
              ),
            ),
          ];
        },
        onSelected: (value) {},
      ),
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const NotificationDetail(),
          ),
        );
      },
    );
  }
}
