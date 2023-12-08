import 'package:flutter/material.dart';

class CursusTile extends StatelessWidget {
  const CursusTile({
    super.key,
    this.isForInsurance,
  });
  final bool? isForInsurance;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (isForInsurance ?? false) {
          Navigator.pop(context);
        }
      },
      title: const Text("Cursus Title"),
      subtitle: const Text("Domaine"),
    );
  }
}
