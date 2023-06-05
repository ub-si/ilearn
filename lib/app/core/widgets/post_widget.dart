import 'package:flutter/material.dart';

import '../../models/post_model.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({
    super.key,
    required this.model,
  });

  final PostModel model;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Image.network("${model.photoPath}"),
          ),
          Padding(
            padding: const EdgeInsets.all(6.0),
            child: Text("${model.title}", style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
          ),
        ],
      ),
    );
  }
}
