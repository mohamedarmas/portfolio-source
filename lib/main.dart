import 'package:final_site/helper_widgets/animated_section.dart';
import 'package:final_site/helper_widgets/nav_item.dart';
import 'package:final_site/helper_widgets/scroll_animated_section.dart';
import 'package:final_site/pages/contact_section.dart';
import 'package:final_site/pages/experience_section.dart';
import 'package:final_site/pages/footer_section.dart';
import 'package:final_site/pages/home_section.dart';
import 'package:final_site/pages/projects_section.dart';
import 'package:final_site/pages/social_section.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Armas Portfolio',
      theme: ThemeData(
        brightness: Brightness.light,
        primarySwatch: Colors.blueGrey,
        fontFamily: 'Roboto',
      ),
      home: const PortfolioPage(),
    );
  }
}

class PortfolioPage extends StatefulWidget {
  const PortfolioPage({super.key});

  @override
  State<PortfolioPage> createState() => _PortfolioPageState();
}

class _PortfolioPageState extends State<PortfolioPage> {
  final ScrollController _scrollController = ScrollController();

  final GlobalKey homeKey = GlobalKey();
  final GlobalKey projectsKey = GlobalKey();
  final GlobalKey experienceKey = GlobalKey();
  final GlobalKey socialKey = GlobalKey();
  final GlobalKey contactKey = GlobalKey();

  void scrollTo(GlobalKey key) {
    final context = key.currentContext;
    if (context != null) {
      Scrollable.ensureVisible(
        context,
        duration: const Duration(milliseconds: 700),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: MyAppBar(onNavigate: scrollTo),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          children: [
            /// 🟢 Animate immediately (on load)
            ScrollAnimatedSection(
              controller: _scrollController,
              triggerOffset: 0,
              animateOnLoad: true,
              slideOffset: Offset.zero,
              child: HomeSection(
                key: homeKey,
                onNavigate: scrollTo,
                projectsKey: projectsKey,
                contactKey: contactKey,
              ),
            ),

            ScrollAnimatedSection(
              controller: _scrollController,
              triggerOffset: 0,
              animateOnLoad: true,
              slideOffset: Offset.zero,
              child: ProjectsSection(key: projectsKey),
            ),

            /// 🔵 Animate on scroll
            ScrollAnimatedSection(
              controller: _scrollController,
              triggerOffset: 600,
              slideOffset: Offset.zero,
              child: ExperienceSection(key: experienceKey),
            ),

            ScrollAnimatedSection(
              controller: _scrollController,
              triggerOffset: 1000,
              child: SocialSection(key: socialKey),
            ),

            ScrollAnimatedSection(
              controller: _scrollController,
              triggerOffset: 1400,
              slideOffset: const Offset(0, 60),
              child: ContactSection(key: contactKey),
            ),

            const FooterSection(),
          ],
        ),
      ),
    );
  }
}

class MyAppBar extends StatelessWidget {
  final Function(GlobalKey) onNavigate;

  const MyAppBar({super.key, required this.onNavigate});

  @override
  Widget build(BuildContext context) {
    final state = context.findAncestorStateOfType<_PortfolioPageState>()!;

    return AppBar(
      elevation: 0,
      backgroundColor: Colors.black,
      centerTitle: true,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          NavItem('Home', () => onNavigate(state.homeKey)),
          const SizedBox(width: 10),
          Text('|', style: TextStyle(color: Colors.grey[600])),
          const SizedBox(width: 10),

          NavItem('Projects', () => onNavigate(state.projectsKey)),
          const SizedBox(width: 10),
          Text('|', style: TextStyle(color: Colors.grey[600])),
          const SizedBox(width: 10),

          NavItem('Experience', () => onNavigate(state.experienceKey)),
          const SizedBox(width: 10),
          Text('|', style: TextStyle(color: Colors.grey[600])),
          const SizedBox(width: 10),

          NavItem('Social', () => onNavigate(state.socialKey)),
          const SizedBox(width: 10),
          Text('|', style: TextStyle(color: Colors.grey[600])),
          const SizedBox(width: 10),

          NavItem('Contact', () => onNavigate(state.contactKey)),
        ],
      ),
      actions: const [],
    );
  }
}
