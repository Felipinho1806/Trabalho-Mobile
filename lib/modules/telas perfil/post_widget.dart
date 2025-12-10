import 'package:flutter/material.dart';
import 'post_model.dart';

class PostWidget extends StatelessWidget {
  final PostModel post;
  final VoidCallback onLike;

  const PostWidget({
    super.key,
    required this.post,
    required this.onLike,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black12.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            post.texto,
            style: const TextStyle(fontSize: 15, color: Colors.black87),
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              IconButton(
                onPressed: onLike,
                icon: Icon(
                  post.curtido ? Icons.favorite : Icons.favorite_border,
                  color: post.curtido ? Colors.red : Colors.black45,
                ),
              ),
              Text("${post.curtidas} curtidas"),
            ],
          ),
        ],
      ),
    );
  }
}
