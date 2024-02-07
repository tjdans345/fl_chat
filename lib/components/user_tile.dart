
import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String userEmail;
  final void Function()? onTap;
  const UserTile({
    required this.userEmail,
    required this.onTap,
    super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 25),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            const Icon(Icons.person),
            const SizedBox(width: 20,),
            Text(userEmail),
          ],
        ),
      ),
    );
  }
}
