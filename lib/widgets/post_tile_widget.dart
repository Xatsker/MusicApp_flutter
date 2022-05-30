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
      height: 100,
      child: Card(
        margin: const EdgeInsets.only(top: 20),
        color: tileColor,
        child: Padding(
          padding:  EdgeInsets.only(
            //horizontal: 50,
            top: 30,
          ),
          child: Column(
            children: [
              Text(
                postTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontFamily: "Roboto",
                  letterSpacing: 1.5,
                  fontWeight: FontWeight.bold,
                  color: Colors.white

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
