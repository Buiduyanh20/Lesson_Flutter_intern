import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _visible = true;
  bool _showContent = false;

  @override
  void initState() {
    super.initState();
    _startFadeOut();
  }

  void _startFadeOut() {
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        _visible = false;
      });
      Future.delayed(Duration(seconds: 1), () {
        setState(() {
          _showContent = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color(0xFFb6da4b),

      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/backgroud.jpg'),
            fit: BoxFit.cover,
            // Điều chỉnh vị trí ảnh nền
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(),
            AnimatedOpacity(
              opacity: _visible ? 1.0 : 0.0,
              duration: const Duration(seconds: 1),
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30, bottom: 50),
                child: Image.asset(
                  'assets/gits/uma.gif',
                  fit: BoxFit.contain,
                  width: 280,
                  height: 280,
                ),
              ),
            ),
            if (_showContent) ...[
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEEEEEE),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    width: 420,
                    height: 45,
                    child: Center(
                      child: const Text(
                        'ウォレットを新規作成',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20, left: 30, right: 30),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFFEEEEEE),
                  ),
                  onPressed: () {},
                  child: SizedBox(
                    width: 420,
                    height: 45,
                    child: Center(
                      child: const Text(
                        'ログイン',
                        style: TextStyle(color: Colors.black, fontSize: 15),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              const Text('Ver.1.0.4'),
              const SizedBox(height: 50),
              const Text('SUNLOFT CORP'),
              const SizedBox(height: 30),
            ],
          ],
        ),
      ),
    );
  }
}
