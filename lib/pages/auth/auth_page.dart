import 'package:flutter/material.dart';
import 'login_form.dart';
import 'register_form.dart';

class AuthPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const AuthPage());
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF464D81),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Logo
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset('assets/image/compe.png', height: 70),
                  const SizedBox(width: 10),
                  const Text(
                    'Competify',
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFFE7C24E),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),

              // Card untuk Login / Register
              Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                shadowColor: Colors.black.withOpacity(0.5),
                elevation: 5,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Go ahead and set up your account',
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w900,
                          color: Color(0xFF464D81),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 20),

                      // Tab Bar
                      Container(
                        height: 45,
                        decoration: BoxDecoration(
                          color: Color(0XFFE6E6E6),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: TabBar(
                          controller: _tabController,
                          labelColor: const Color(0xFF464D81),
                          unselectedLabelColor: Colors.grey,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicator: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(25),
                            border: Border.all(color: const Color(0xFF464D81), width: 2),
                          ),
                          tabs: const [Tab(text: 'Log In'), Tab(text: 'Registration')],
                        ),
                      ),

                      const SizedBox(height: 30),
                      SizedBox(
                        height: 300, // Tentukan tinggi agar tidak berubah saat switch
                        child: TabBarView(
                          controller: _tabController,
                          children: const [
                            LoginForm(),
                            RegisterForm(),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
