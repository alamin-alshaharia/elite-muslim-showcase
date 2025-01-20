import 'dart:math' as math;
import 'package:flutter/material.dart';

class PrayerTimePage extends StatelessWidget {
  const PrayerTimePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color(0xFF16BC88),
        child: Column(
          children: [
            _buildTopSection(),
            Expanded(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(32),
                    topRight: Radius.circular(32),
                  ),
                ),
                child: _buildPrayerTimesList(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTopSection() {
    return SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 8),
            child: Row(
              children: [
                const Icon(Icons.arrow_back, color: Colors.white, size: 24),
                Expanded(
                  child: Text(
                    'Prayer Time',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.95),
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      letterSpacing: 0.15,
                    ),
                  ),
                ),
                const SizedBox(width: 24), // To balance the back button
              ],
            ),
          ),
          const SizedBox(height: 32),
          _buildTimeDisplay(),
          const SizedBox(height: 25),
          _buildFajrIftarTimes(),
          const SizedBox(height: 25),
        ],
      ),
    );
  }

  Widget _buildTimeDisplay() {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: 35,
            child: CustomPaint(
              size: const Size(280, 280),
              painter: HalfCircleProgressPainter(
                backgroundColor: Colors.white.withOpacity(0.2),
                valueColor: const Color(0xFFFFD700),
                value: 0.4,
              ),
            ),
          ),
          Positioned(
            top: 80,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  '03:45',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.w700,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  'PM',
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.8),
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(
                      Icons.location_on,
                      color: Colors.white.withOpacity(0.8),
                      size: 16,
                    ),
                    const SizedBox(width: 4),
                    Text(
                      'Banani, Dhaka, BD',
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.8),
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFajrIftarTimes() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 41),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _buildTimeBlock(
            icon: Icons.wb_sunny_outlined,
            title: 'Fajr',
            time: '04:38 AM',
          ),
          _buildTimeBlock(
            icon: Icons.wb_twilight,
            title: 'Iftar',
            time: '06:20 PM',
          ),
        ],
      ),
    );
  }

  Widget _buildTimeBlock({
    required IconData icon,
    required String title,
    required String time,
  }) {
    return Column(
      children: [
        Icon(icon, color: const Color(0xFFFFD700), size: 20),
        const SizedBox(height: 8),
        Text(
          title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          time,
          style: TextStyle(
            color: Colors.white.withOpacity(0.8),
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  Widget _buildPrayerTimesList() {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        _buildPrayerTimeItem(
            Icons.wb_sunny_outlined, 'Fajr', '04:35 AM - 05:15 AM'),
        _buildPrayerTimeItem(Icons.wb_sunny, 'Dhuhr', '12:25 PM - 02:45 PM'),
        _buildPrayerTimeItem(Icons.wb_sunny, 'Asr', '03:35 PM - 05:45 PM'),
        _buildPrayerTimeItem(Icons.wb_twilight, 'Iftar', '06:18 PM - 06:45 PM'),
        _buildPrayerTimeItem(
            Icons.nightlight_round, 'Esha', '07:32 PM - 04:15 AM'),
      ],
    );
  }

  Widget _buildPrayerTimeItem(IconData icon, String name, String time) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(icon, size: 20, color: const Color(0xFF16BC88)),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    time,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Color(0xFF6B7280),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Icon(Icons.volume_up_outlined,
              size: 20, color: Color(0xFF16BC88)),
        ],
      ),
    );
  }
}

class HalfCircleProgressPainter extends CustomPainter {
  final Color backgroundColor;
  final Color valueColor;
  final double value;

  HalfCircleProgressPainter({
    required this.backgroundColor,
    required this.valueColor,
    required this.value,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.55; // Adjusted radius
    const startAngle = -math.pi; // Start from slightly left of top
    const sweepAngle = math.pi; // Sweep slightly more than 180 degrees

    // Draw background arc
    final backgroundPaint = Paint()
      ..color = backgroundColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 17.0
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle,
      false,
      backgroundPaint,
    );

    // Draw progress arc
    final progressPaint = Paint()
      ..color = valueColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 15.0
      ..strokeCap = StrokeCap.round;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      sweepAngle * value,
      false,
      progressPaint,
    );
  }

  @override
  bool shouldRepaint(covariant HalfCircleProgressPainter oldDelegate) {
    return oldDelegate.value != value ||
        oldDelegate.backgroundColor != backgroundColor ||
        oldDelegate.valueColor != valueColor;
  }
}
