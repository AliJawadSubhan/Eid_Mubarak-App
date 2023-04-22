import 'package:flutter/material.dart';

class EidMubarakUI extends StatefulWidget {
  @override
  _EidMubarakUIState createState() => _EidMubarakUIState();
}

class _EidMubarakUIState extends State<EidMubarakUI>
    with TickerProviderStateMixin {
  late AnimationController _controller1;
  late AnimationController _controller2;
  late Animation<double> _animation1;
  late Animation<double> _animation2;

  @override
  void initState() {
    super.initState();
    _controller1 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 17),
    );
    _animation1 = Tween<double>(begin: 0, end: 2 * 3.14).animate(
      CurvedAnimation(
        parent: _controller1,
        curve: Curves.easeOut,
      ),
    );
    _controller2 = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 17),
    );
    _animation2 = Tween<double>(begin: 0, end: 2 * 3.14).animate(
      CurvedAnimation(
        parent: _controller2,
        curve: Curves.easeOut,
      ),
    );
    _controller1.repeat();
    _controller2.repeat();
    Future.delayed(Duration(seconds: 5), () {
      stopAnimations();
    });
  }

  void stopAnimations() {
    _controller1.stop();
    _controller2.stop();
  }

  @override
  void dispose() {
    _controller1.dispose();
    _controller2.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFEDF2F4),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RotationTransition(
              turns: _animation1,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    _controller1.repeat();
                    _controller2.repeat();
                  });
                  Future.delayed(Duration(seconds: 5), () {
                    stopAnimations();
                  });
                },
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Center(
                    child: RotationTransition(
                      turns: _animation2,
                      child: Image.asset(
                        'images/eid.png',
                        width: 150,
                        height: 150,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 32),
            Text(
              'Eid Mubarak!',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: Color(0xFF2B2D42),
              ),
            ),
            SizedBox(height: 16),
            Text(
              'May this blessed day of Eid bring you and your loved ones joy, peace, and prosperity. May Allah shower you with his countless blessings and guide you towards the path of righteousness. Wishing you a happy and unforgettable Eid celebration!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 18,
                color: Color(0xFF4D4E4F),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
