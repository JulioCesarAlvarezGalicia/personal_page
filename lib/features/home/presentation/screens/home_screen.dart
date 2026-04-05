import 'package:flutter/material.dart';
import '../widgets/navbar.dart';
import '../widgets/sections/hero_section.dart';
import '../widgets/sections/about_section.dart';
import '../../../portfolio/presentation/widgets/portfolio_section.dart';
import '../../../../core/widgets/animated_section.dart';
import '../../../resume/presentation/sections/resume_section.dart';
import '../../presentation/widgets/sections/experience_section.dart';
import '../../presentation/widgets/sections/tech_section.dart';
import '../../../../core/widgets/footer.dart';

class Sections {
  static const home = "home";
  static const about = "about me";
  static const portfolio = "portfolio";
  static const resume = "resume";
  static const experience = "work experience";
  static const tech = "tech stack";
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey _homeKey = GlobalKey();
  final GlobalKey _aboutKey = GlobalKey();
  final GlobalKey _portfolioKey = GlobalKey();
  final GlobalKey _resumeKey = GlobalKey();
  final GlobalKey _experienceKey = GlobalKey();
  final GlobalKey _techKey = GlobalKey();
  final GlobalKey _footerKey = GlobalKey();

  void scrollToSection(GlobalKey key) {
    final context = key.currentContext;

    if (context != null) {
      final box = context.findRenderObject() as RenderBox;
      final position = box.localToGlobal(Offset.zero);

      _scrollController.animateTo(
        _scrollController.offset + position.dy - 80,
        duration: const Duration(milliseconds: 600),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0D0D0D),

      drawer: Drawer(
        backgroundColor: const Color(0xFF0D0D0D),
        child: ListView(
          children: [
            const DrawerHeader(
              child: Text(
                "Menú",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
            ),

            ListTile(
              title: const Text("Home", style: TextStyle(color: Colors.white)),
              onTap: () {
                scrollToSection(_homeKey);
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text("About Me", style: TextStyle(color: Colors.white)),
              onTap: () {
                scrollToSection(_aboutKey);
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text("Portfolio", style: TextStyle(color: Colors.white)),
              onTap: () {
                scrollToSection(_portfolioKey);
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text("Resume", style: TextStyle(color: Colors.white)),
              onTap: () {
                scrollToSection(_resumeKey);
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text("Work Experience", style: TextStyle(color: Colors.white)),
              onTap: () {
                scrollToSection(_experienceKey);
                Navigator.pop(context);
              },
            ),

            ListTile(
              title: const Text("Tech Stack", style: TextStyle(color: Colors.white)),
              onTap: () {
                scrollToSection(_techKey);
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            Builder(
              builder: (context) => Navbar(
                onItemSelected: (section) {
                  switch (section) {
                    case Sections.home:
                      scrollToSection(_homeKey);
                      break;
                    case Sections.about:
                      scrollToSection(_aboutKey);
                      break;
                    case Sections.portfolio:
                      scrollToSection(_portfolioKey);
                      break;
                    case Sections.resume:
                      scrollToSection(_resumeKey);
                      break;
                    case Sections.experience:
                      scrollToSection(_experienceKey);
                      break;
                    case Sections.tech:
                      scrollToSection(_techKey);
                      break;
                  }
                },
                onMenuTap: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                controller: _scrollController,
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: [
                    Container(
                      key: _homeKey,
                      child: const AnimatedSection(
                        child: HeroSection(),
                      ),
                    ),

                    Container(
                      key: _aboutKey,
                      child: const AnimatedSection(
                        child: AboutSection(),
                      ),
                    ),

                    Container(
                      key: _portfolioKey,
                      child: const AnimatedSection(
                        child: PortfolioSection(),
                      ),
                    ),

                    Container(
                      key: _resumeKey,
                      child: const AnimatedSection(
                        child: ResumeSection(),
                      ),
                    ),

                    Container(
                      key: _experienceKey,
                      child: const AnimatedSection(
                        child: ExperienceSection(),
                      ),
                    ),

                    Container(
                      key: _techKey,
                      child: const AnimatedSection(
                        child: TechSection(),
                      ),
                    ),

                    // 🔥 FOOTER REAL
                    Container(
                      key: _footerKey,
                      child: const Footer(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}