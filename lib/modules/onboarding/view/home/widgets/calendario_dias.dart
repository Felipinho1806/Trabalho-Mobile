import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 

class WeekSelector extends StatelessWidget {
  const WeekSelector({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();

    final int dartWeekday = now.weekday; 

    final todayIndex = dartWeekday % 7; 

    final days = ["D", "S", "T", "Q", "Q", "S", "S"];

    final dateFormatter = DateFormat("EEEE, dd MMM yyyy", "pt_BR");
    final formattedDate = dateFormatter.format(now);
    
    final capitalizedFormattedDate = 
        formattedDate[0].toUpperCase() + formattedDate.substring(1);

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
          capitalizedFormattedDate, 
          style: TextStyle(color: Colors.grey[700]),
        ),
      ],
    );
  }
}