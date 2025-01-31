import 'package:flutter/material.dart';

class ContactItem extends StatelessWidget {
  final Map<String, String> contact;
  final VoidCallback onDelete;

  const ContactItem({
    Key? key,
    required this.contact,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Confirmation'),
              content: const Text('Are you sure for delete?'),
              actions: [
                TextButton.icon(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  label: const Text('Cancel'),
                  icon: const Icon(Icons.cancel_outlined),
                ),
                TextButton.icon(
                  onPressed: onDelete,
                  label: const Text('Delete'),
                  icon: const Icon(Icons.delete),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey[200],
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Expanded(
              child: Row(
                children: [
                  const Icon(Icons.person),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        contact['name']!,
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(contact['number']!),
                    ],
                  ),
                ],
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.phone),
            ),
          ],
        ),
      ),
    );
  }
}