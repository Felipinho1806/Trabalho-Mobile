import 'package:flutter/material.dart';
import 'post_model.dart';

class CriarPostPage extends StatefulWidget {
  const CriarPostPage({super.key});

  @override
  State<CriarPostPage> createState() => _CriarPostPageState();
}

class _CriarPostPageState extends State<CriarPostPage> {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Criar Post"),
        backgroundColor: const Color(0xFF5E8BFF),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 5,
              decoration: InputDecoration(
                hintText: "O que você quer compartilhar?",
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(14),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const Spacer(),

            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF5E8BFF),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () {
                if (controller.text.isNotEmpty) {
                  Navigator.pop(
                    context,
                    PostModel(texto: controller.text),
                  );
                }
              },
              child: const Text(
                "Publicar",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
