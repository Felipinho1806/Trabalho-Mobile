import 'package:flutter/material.dart';

class WeekSelector extends StatelessWidget {
  const WeekSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final days = ["D", "S", "T", "Q", "Q", "S", "S"];
    final todayIndex = 3; // "Q"

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(days.length, (index) {
            final isToday = index == todayIndex;
            return CircleAvatar(
              backgroundColor:
                  isToday ? const Color(0xFF5E8BFF) : Colors.grey[300],
              radius: 18,
              child: Text(
                days[index],
                style: TextStyle(
                  color: isToday ? Colors.white : Colors.black54,
                  fontWeight: FontWeight.bold,
                ),
              ),
            );
          }),
        ),
        const SizedBox(height: 8),
        Text(
          "Quarta, 16 out 2025",
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }
}
