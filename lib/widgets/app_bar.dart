import 'package:flutter/material.dart';

PreferredSizeWidget appBar({required String newsName}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: RichText(
      text: TextSpan(
        text: "",
        children: [
          TextSpan(
            text: newsName,
            style: const TextStyle(
                fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black),
          ),
          const TextSpan(
            text: "News",
            style: TextStyle(
                color: Colors.orange,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
        ],
      ),
    ),
  );
}
