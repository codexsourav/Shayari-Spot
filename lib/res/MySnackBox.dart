import 'package:flutter/material.dart';

SnackBar mysnackbar({
  required String msg,
  onpress,
  Icon icon = const Icon(Icons.copy_outlined, size: 15, color: Colors.white),
  Color color = Colors.transparent,
}) {
  return SnackBar(
    backgroundColor: Colors.transparent,
    elevation: 0,
    content: Container(
      height: 60,
      decoration: BoxDecoration(color: color, borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Row(
          children: [
            icon,
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text('$msg', style: const TextStyle(color: Colors.white, fontSize: 12)),
            ),
            const Spacer(),
            TextButton(onPressed: onpress, child: const Text("OK"))
          ],
        ),
      ),
    ),
  );
}
