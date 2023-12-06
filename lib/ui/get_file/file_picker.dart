/*import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';

void pickFile() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles(
    type: FileType.custom,
    allowedExtensions: ['pdf', 'jpg', 'png'],
  );

  if (result != null) {
    // Le fichier a été sélectionné avec succès
    //String filePath = result.files.single.path!;
    // Gérez le fichier selon vos besoins
  } else {
    // L'utilisateur a annulé la sélection du fichier
  }
}

  void pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.any,
    );

    if (result != null) {
      String filePath = result.files.single.path!;
      String fileType = filePath.split('.').last.toLowerCase();

      if (fileType == 'pdf' || fileType == 'jpg' || fileType == 'png') {
        if (result.files.single.size <= 2 * 1024 * 1024) {
          print('File type and size are valid.');
        } else {
          print('File size exceeds 2 MB.');
        }
      } else {
        print('Invalid file type. Allowed types: pdf, jpg, png.');
      }
    } else {}
  }

Future<void> downloadAndSaveFile(String url, String fileName) async {
  var file = await DefaultCacheManager().getSingleFile(url);

  final bytes = await file.readAsBytes();

  final downloadsDirectory = await getDownloadsDirectory();
  final fileOnDevice = File('${downloadsDirectory.path}/$fileName');

  await fileOnDevice.writeAsBytes(bytes);
  print('File downloaded to: ${fileOnDevice.path}');
}

void uploadFile(String filePath) async {
  var request = http.MultipartRequest(
    'POST',
    Uri.parse('https://votre-api-upload'),
  );

  request.files.add(await http.MultipartFile.fromPath('file', filePath));

  var response = await request.send();

  if (response.statusCode == 200) {
    // Le fichier a été téléversé avec succès
    print('File uploaded!');
  } else {
    // Gérez les erreurs ici
    print('Error uploading file: ${response.reasonPhrase}');
  }
}

void downloadFile(String fileUrl, String fileName) async {
  var response = await http.get(Uri.parse(fileUrl));

  if (response.statusCode == 200) {
    // Récupérer le répertoire temporaire de l'application
    var tempDir = await getTemporaryDirectory();

    // Construire le chemin du fichier dans le répertoire temporaire
    String filePath = '${tempDir.path}/$fileName';

    // Écrire le contenu téléchargé dans le fichier
    File file = File(filePath);
    await file.writeAsBytes(response.bodyBytes);

    // Gérez le fichier téléchargé selon vos besoins
    print('File downloaded to: $filePath');
  } else {
    // Gérez les erreurs ici
    print('Error downloading file: ${response.reasonPhrase}');
  }
}
*/