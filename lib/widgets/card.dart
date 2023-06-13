// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class ReUseableListTile extends StatelessWidget {
  const ReUseableListTile({
    Key? key,
    this.imagePath,
    required this.coinName,
    required this.marketCap,
    this.initialText,
    this.abr,
  }) : super(key: key);

  final String? imagePath;
  final String coinName;
  final String marketCap;
  final String? initialText;
  final String? abr;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(
                imagePath!),
            child: Text(abr![0]),
          ),
          title: Text(coinName, style: const TextStyle(letterSpacing: 2),),
          subtitle: Text("$initialText: $marketCap"),
        ),
        const Divider(
          height: 1,
          color: Colors.grey,
        ),
        const SizedBox(height: 8,)
      ],
    );
  }
}
