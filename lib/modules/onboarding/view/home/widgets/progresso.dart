import 'package:flutter/material.dart';

class ProgressCard extends StatelessWidget {
  final int total;
  final int feitas;

  const ProgressCard({
    super.key,
    required this.total,
    required this.feitas,
  });

  @override
  Widget build(BuildContext context) {
    double porcentagem = total == 0 ? 0 : feitas / total;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF5E8BFF),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Text(
              "Tarefas: $feitas / $total",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(
                  value: porcentagem,
                  strokeWidth: 6,
                  backgroundColor: Colors.white24,
                  color: Colors.greenAccent,
                ),
              ),
              Text(
                "${(porcentagem * 100).toInt()}%",
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
