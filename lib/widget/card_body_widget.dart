import 'package:flutter/material.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class CardBody extends StatelessWidget {
  CardBody({
    super.key,
    required this.index,
    required this.item,
    required this.handleDelete,
  });

  var index;
  var item;
  final Function handleDelete;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      width: double.infinity,
      height: 74,
      decoration: BoxDecoration(
          color: (index % 2 == 0)
              ? const Color.fromARGB(255, 138, 231, 241)
              : const Color.fromARGB(255, 230, 151, 236),
          borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              item.name,
              style: const TextStyle(
                  color: Color(0xff4b4b4b),
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            ),
            InkWell(
              onTap: () async {
                if (await confirm(context)) {
                  handleDelete(item.id);
                }
                return;
              },
              child: const Icon(
                Icons.delete_outline,
                color: Color(0xff4b4b4b),
                size: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
