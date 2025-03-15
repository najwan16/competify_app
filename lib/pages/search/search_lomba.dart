import 'package:competify_app/pages/home/widgets/bottom_nav_bar';
import 'package:competify_app/pages/home/widgets/search_bar.dart';
import 'package:flutter/material.dart';

class SearchLomba extends StatelessWidget {
  static route() =>
      MaterialPageRoute(builder: (context) => const SearchLomba());
  const SearchLomba({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xFF464D81),
            title: Text('Info Lomba'),
            expandedHeight: 306,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            flexibleSpace: FlexibleSpaceBar(
              background: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 26.5,
                  vertical: 15.0,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SearchBarWidget(), // taruh search bar di sini
                  ],
                ),
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.only(),
              child: Container(
                child: Card(
                  surfaceTintColor: Colors.white,
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  shadowColor: Colors.black,
                  child: Card(
                    surfaceTintColor: Colors.white,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    shadowColor: Colors.black,
                    elevation: 3,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 196,
                            height: 40,
                            child: Text(
                              'Brawijaya Digital Creative Competition',
                              style: TextStyle(
                                color: Color(0xFF191B2D),
                                fontSize: 17,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w700,
                                height: 1.20,
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 196,
                            height: 14,
                            child: Text(
                              'Penyelenggara',
                              style: TextStyle(
                                color: Color(0xFF191B2D),
                                fontSize: 14,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w300,
                                height: 1.2,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          //SliverList(delegate: SliverChildListDelegate(children)),
        ],
      ),
      bottomNavigationBar: const BottomNavBar(),
    );
  }
}
