import 'package:empregabildade/views/favorite/favorites_page.dart';
import 'package:empregabildade/views/home/home_page.dart';
import 'package:empregabildade/views/project/project_list_page.dart';
import 'package:empregabildade/views/student/student_list_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class NavegationBar21 extends StatefulWidget {
  const NavegationBar21({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _NavegationBar21State createState() => _NavegationBar21State();
}

class _NavegationBar21State extends State<NavegationBar21> {
  int _currentPages = 0;
  final _pages = [
    const HomePage(),
    const ProjectListPage(),
    const StudentListPage(),
    const FavoritesPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages.elementAt(_currentPages),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: const Color.fromRGBO(37, 155, 143, 1),
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.1),
            )
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 8),
          child: GNav(
            rippleColor: Colors.grey[300]!,
            hoverColor: Colors.grey[100]!,
            gap: 8,
            activeColor: Colors.white,
            iconSize: 24,
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
            duration: const Duration(milliseconds: 100),
            tabBackgroundColor:
                const Color.fromRGBO(59, 57, 138, 1).withOpacity(0.5),
            color: Colors.white,
            tabs: const [
              GButton(
                icon: Icons.home,
                text: 'Ínicio',
              ),
              GButton(
                icon: Icons.library_books_sharp,
                text: 'Projetos',
              ),
              GButton(
                icon: Icons.people_rounded,
                text: 'Alunos',
              ),
              GButton(
                icon: Icons.favorite_border,
                text: 'Favoritos',
              ),
            ],
            selectedIndex: _currentPages,
            onTabChange: (index) {
              setState(() {
                _currentPages = index;
              });
            },
          ),
        ),
      ),
    );
  }
}
