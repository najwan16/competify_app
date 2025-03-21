import 'package:flutter/material.dart';
import 'login_form.dart';
import 'register_form.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthPage extends StatefulWidget {
  static route() => MaterialPageRoute(builder: (context) => const AuthPage());
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage>
    with SingleTickerProviderStateMixin {
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
        child: SingleChildScrollView(
          keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 21, vertical: 75),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 95),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/image/compe.png", height: 95),
                    const SizedBox(width: 13),
                    Text(
                      'Competify',
                      style: GoogleFonts.poppins(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: const Color(0XFFF9F1BE),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  shadowColor: Colors.black.withOpacity(0.5),
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          'Go ahead and set up your account',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(
                            fontSize: 26,
                            fontWeight: FontWeight.bold,
                            color: const Color(0xFF464D81),
                          ),
                        ),
                        const SizedBox(height: 20),
                        Container(
                          height: 45,
                          decoration: BoxDecoration(
                            color: const Color(0XFFE6E6E6),
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
                              border: Border.all(
                                color: const Color(0xFF464D81),
                                width: 2,
                              ),
                            ),
                            tabs: const [
                              Tab(text: 'Masuk'),
                              Tab(text: 'Daftar'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 30),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.5,
                          child: TabBarView(
                            controller: _tabController,
                            children: const [LoginForm(), RegisterForm()],
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
      ),
    );
  }
}