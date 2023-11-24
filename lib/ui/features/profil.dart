import 'package:edu_guard/common/widgets/image_input.dart';
import 'package:edu_guard/ui/providers/image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Profil extends ConsumerStatefulWidget {
  const Profil({super.key});

  @override
  ConsumerState<Profil> createState() => _ProfilState();
}

class _ProfilState extends ConsumerState<Profil> {
  @override
  Widget build(BuildContext context) {
    final selectedImage = ref.watch(imageProvider);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(
            Icons.arrow_back,
            color: Theme.of(context).colorScheme.background,
          ),
        ),
        backgroundColor: Theme.of(context).colorScheme.onPrimaryContainer,
        actions: [
          IconButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    backgroundColor: Theme.of(context).colorScheme.secondary,
                    content: Text(
                      'Voulez vous vraiment vous déconnecter?',
                      style: GoogleFonts.raleway(
                          color: Theme.of(context).colorScheme.onSecondary),
                    ),
                    title: Text(
                      "SE DECONNECTER",
                      style: GoogleFonts.raleway(),
                    ),
                    actions: [
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.onSecondary),
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Annuler",
                          style: GoogleFonts.raleway(),
                        ),
                      ),
                      TextButton(
                        style: TextButton.styleFrom(
                            foregroundColor:
                                Theme.of(context).colorScheme.onSecondary),
                        onPressed: () async {
                          try {
                            /*
                            await authService.disconnectUser();
                            */
                          } catch (e) {
                            /*ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(e.toString()),
                              ),
                            );*/
                          }
                        },
                        child: Text(
                          "Valider",
                          style: GoogleFonts.raleway(),
                        ),
                      ),
                    ],
                  );
                },
              );
            },
            icon: Icon(
              Icons.exit_to_app,
              color: Theme.of(context).colorScheme.background,
            ),
          ),
        ],
        title: Center(
          child: Text(
            "Profile",
            style: GoogleFonts.raleway(
              color: Colors.white,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
              ),
              Container(
                alignment: Alignment.center,
                child: CircleAvatar(
                  radius: 50,
                  foregroundImage:
                      selectedImage != null ? FileImage(selectedImage) : null,
                  child: selectedImage == null
                      ? Image.asset(
                          'assets/icon/user_icon.png',
                          width: 60,
                        )
                      : null,
                ),
              ),
              Positioned(
                top: 70,
                left: 180,
                child: InkWell(
                  onTap: () {
                    showModalBottomSheet(
                      context: context,
                      builder: (context) {
                        return ImageInput(
                          onPickImage: (image) {
                            setState(() {
                              ref
                                  .read(imageProvider.notifier)
                                  .updateImage(image);
                            });
                          },
                        );
                      },
                    );
                  },
                  child: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: const Icon(Icons.camera_alt),
                  ),
                ),
              ),
            ],
          ),
          ListTile(
            leading: const Icon(Icons.person),
            title: const Text("Nom"),
            subtitle: const Text('DEGBOE Prince'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.create),
            ),
          ),
          const Divider(
            indent: 60,
          ),
          ListTile(
            leading: const Icon(Icons.email),
            title: const Text("Email"),
            subtitle: const Text('mischalscott@gmail.com'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.create),
            ),
          ),
          const Divider(
            indent: 60,
          ),
          ListTile(
            leading: const Icon(Icons.phone_android),
            title: const Text("Mobile"),
            subtitle: const Text('+22954183302'),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.create),
            ),
          ),
          const Divider(
            indent: 60,
          ),
        ],
      ),
    );
  }
}
