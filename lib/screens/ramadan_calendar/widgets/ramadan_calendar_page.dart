import 'package:flutter/material.dart';

class RamadanCalendarPage extends StatelessWidget {
  const RamadanCalendarPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFBEB),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                _buildHeader(),
                const SizedBox(height: 24),
                _buildCalendarTable(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        Image.asset(
          'assets/images/ramadan_logo.png', // You'll need to add this image
          height: 200,
          width: 400,
        ),
        const SizedBox(height: 24),
        const Text(
          'Ramadan 2033 Calendar',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1F2937),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Bangladesh',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w500,
            color: Color(0xFF4B5563),
          ),
        ),
        const SizedBox(height: 16),
        Text(
          'Ramadan Time Schedule 2033 Dhaka District ( GMT +6) Hijri 1444',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[600],
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
          decoration: BoxDecoration(
            color: const Color(0xFF16BC88).withOpacity(0.1),
            borderRadius: BorderRadius.circular(8),
          ),
          child: const Text(
            '1st 10 Days Of Ramadan (24th March To 2nd April 2033)',
            style: TextStyle(
              fontSize: 14,
              color: Color(0xFF16BC88),
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildCalendarTable() {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          _buildTableHeader(),
          ...List.generate(10, (index) => _buildTableRow(index + 1)),
        ],
      ),
    );
  }

  Widget _buildTableHeader() {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: const Color(0xFF16BC88).withOpacity(0.1),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
      ),
      child: const Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              'Day',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF16BC88),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Date',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF16BC88),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Weekday',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF16BC88),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Sehri',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF16BC88),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              'Iftar',
              style: TextStyle(
                fontWeight: FontWeight.w600,
                color: Color(0xFF16BC88),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTableRow(int day) {
    final List<Map<String, String>> calendarData = [
      {
        'date': '24 Mar',
        'weekday': 'Friday',
        'sehri': '04:29',
        'iftar': '06:14'
      },
      {
        'date': '25 Mar',
        'weekday': 'Saturday',
        'sehri': '04:28',
        'iftar': '06:15'
      },
      {
        'date': '26 Mar',
        'weekday': 'Sunday',
        'sehri': '04:26',
        'iftar': '06:15'
      },
      {
        'date': '27 Mar',
        'weekday': 'Monday',
        'sehri': '04:25',
        'iftar': '06:16'
      },
      {
        'date': '28 Mar',
        'weekday': 'Tuesday',
        'sehri': '04:24',
        'iftar': '06:16'
      },
      {
        'date': '29 Mar',
        'weekday': 'Wednesday',
        'sehri': '04:23',
        'iftar': '06:17'
      },
      {
        'date': '30 Mar',
        'weekday': 'Thursday',
        'sehri': '04:21',
        'iftar': '06:17'
      },
      {
        'date': '31 Mar',
        'weekday': 'Friday',
        'sehri': '04:20',
        'iftar': '06:18'
      },
      {
        'date': '1 Apr',
        'weekday': 'Saturday',
        'sehri': '04:19',
        'iftar': '06:18'
      },
      {
        'date': '2 Apr',
        'weekday': 'Sunday',
        'sehri': '04:18',
        'iftar': '06:19'
      },
    ];

    final data = calendarData[day - 1];
    final bool isEvenRow = day % 2 == 0;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: BoxDecoration(
        color: isEvenRow ? Colors.grey[50] : Colors.white,
      ),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: Text(
              day.toString(),
              style: const TextStyle(
                color: Color(0xFF4B5563),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              data['date']!,
              style: const TextStyle(
                color: Color(0xFF4B5563),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              data['weekday']!,
              style: const TextStyle(
                color: Color(0xFF4B5563),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              data['sehri']!,
              style: const TextStyle(
                color: Color(0xFF4B5563),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Text(
              data['iftar']!,
              style: const TextStyle(
                color: Color(0xFF4B5563),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
