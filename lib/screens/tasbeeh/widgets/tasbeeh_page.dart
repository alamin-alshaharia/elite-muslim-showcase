import 'package:flutter/material.dart';
import 'dart:math' as math;

class TasbeehPage extends StatefulWidget {
  const TasbeehPage({super.key});

  @override
  State<TasbeehPage> createState() => _TasbeehPageState();
}

class _TasbeehPageState extends State<TasbeehPage> {
  int _count = 0;
  bool _isPlaying = false;

  void _incrementCount() {
    setState(() {
      _count++;
    });
  }

  void _resetCount() {
    setState(() {
      _count = 0;
      _isPlaying = false;
    });
  }

  void _togglePlaying() {
    setState(() {
      _isPlaying = !_isPlaying;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const BackButton(color: Colors.black54),
        title: const Text(
          'Tasbeeh',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          _buildTasbeehCard(),
          const SizedBox(height: 24),
          GestureDetector(
            onTap: _isPlaying ? _incrementCount : null,
            child: _buildCounterButton(),
          ),
        ],
      ),
    );
  }

  Widget _buildTasbeehCard() {
    return Container(
      margin: const EdgeInsets.all(16),
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(
        color: const Color(0xFFE7F6F0),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        children: [
          const Text(
            'لا إله إلا الله',
            style: TextStyle(
              fontSize: 32,
              height: 1.5,
              fontWeight: FontWeight.bold,
              color: Color(0xFF16BC88),
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Allah ke siwa koi mabood nahi',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 4),
          const Text(
            'There is no deity but Allah',
            style: TextStyle(
              fontSize: 16,
              color: Colors.black54,
            ),
          ),
          const SizedBox(height: 16),
          Image.asset(
            'assets/images/mosque_icon.png',
            width: 400,
            height: 200,
            color: Colors.black12,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                onPressed: _togglePlaying,
                icon: Icon(
                  _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                  color: const Color(0xFF16BC88),
                  size: 32,
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: _resetCount,
                icon: const Icon(
                  Icons.refresh_rounded,
                  color: Color(0xFF16BC88),
                  size: 24,
                ),
              ),
              const SizedBox(width: 16),
              IconButton(
                onPressed: () {
                  // Implement share functionality
                },
                icon: const Icon(
                  Icons.share_rounded,
                  color: Color(0xFF16BC88),
                  size: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildCounterButton() {
    return SizedBox(
      width: 220,
      height: 280,
      child: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(220, 280),
            painter: CounterButtonPainter(),
          ),
          Positioned(
            top: 55,
            right: 25,
            child: Container(
              width: 160,
              decoration: const BoxDecoration(
                shape: BoxShape.rectangle,
                color: Color(0xFF024A34),
              ),
              child: Text(
                _count.toString(),
                style: const TextStyle(
                  color: Color(0xFFDFF0E1),
                  fontSize: 37,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Positioned(
              // bottom: 20,
              top: 122,
              right: 21,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color(0xAAFFFFFF),
                ),
                child: Icon(Icons.restart_alt_outlined),
              )),
          Positioned(
            bottom: 58,
            child: Container(
              width: 94,
              height: 94,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFF00C681),
              ),
              child: const Center(
                child: Text(
                  'Tab',
                  style: TextStyle(
                    color: Color(0xFFC0E7C6),
                    fontSize: 24.4,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CounterButtonPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = const Color(0xFF16BC88)
      ..style = PaintingStyle.fill;

    // Create a path for the curved shape
    final Path path = Path();

    // Starting point at top-left
    path.moveTo(0, size.height * 0.3);

    // Top-left curve
    path.quadraticBezierTo(
      0,
      size.height * 0.1,
      size.width * 0.2,
      size.height * 0.1,
    );

    // Top line
    path.lineTo(size.width * 0.8, size.height * 0.1);

    // Top-right curve
    path.quadraticBezierTo(
      size.width,
      size.height * 0.1,
      size.width,
      size.height * 0.3,
    );

    // Right side curve
    path.quadraticBezierTo(
      size.width,
      size.height * 0.6,
      size.width * 0.8,
      size.height * 0.8,
    );

    // Bottom curve
    path.quadraticBezierTo(
      size.width * 0.5,
      size.height,
      size.width * 0.2,
      size.height * 0.8,
    );

    // Left side curve
    path.quadraticBezierTo(
      0,
      size.height * 0.6,
      0,
      size.height * 0.3,
    );

    // Draw the main shape
    canvas.drawPath(path, paint);

    // Add gradient overlay
    final Paint gradientPaint = Paint()
      ..shader = LinearGradient(
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        colors: [
          Colors.white.withOpacity(0.2),
          Colors.transparent,
        ],
      ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

    canvas.drawPath(path, gradientPaint);

    // Add subtle inner shadow
    final Paint shadowPaint = Paint()
      ..color = Colors.black.withOpacity(0.1)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2
      ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 3);

    canvas.drawPath(path, shadowPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
