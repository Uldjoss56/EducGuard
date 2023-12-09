import 'package:eduguard/data/cursus.dart';
import 'package:eduguard/ui/insurance_chosen/transition.dart';
import 'package:flutter/material.dart';

class CursusTile extends StatelessWidget {
  const CursusTile({
    super.key,
    this.isForInsurance,
    required this.cursus,
  });
  final bool? isForInsurance;
  final Cursus cursus;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        if (isForInsurance ?? false) {
          Navigator.pop(context);
          Navigator.pop(context);
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) {
                return const Transition(index: 1);
              },
            ),
          );
        }
      },
      title: Text("${cursus.title}"),
      subtitle: Text("${cursus.description}"),
    );
  }
}
