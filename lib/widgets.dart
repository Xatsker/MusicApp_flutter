import 'package:flutter/material.dart';

class PostTile extends StatelessWidget {
  final Color tileColor;
  final String postTitle;
  final void Function() onTileTap;

  const PostTile({
    Key? key,
    required this.tileColor,
    required this.postTitle,
    required this.onTileTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTileTap,
      child: Container(
      width: 300,
      height: 130,
      child: Card(
        margin: const EdgeInsets.only(top: 20),
        color: tileColor,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            //horizontal: 50,
            vertical: 40,
          ),
          child: Column(
            children: [
              Text(
                postTitle,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    ),
    );
  }
}
