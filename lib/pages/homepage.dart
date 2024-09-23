import 'package:flutter/material.dart';
import 'custom_drawer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  HomepageState createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  bool _isCollapsed = false;

  void _toggleDrawer() {
    setState(() {
      _isCollapsed = !_isCollapsed;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        bool isLargeScreen = constraints.maxWidth > 600;
        double drawerWidth = isLargeScreen ? (_isCollapsed ? 100 : 250) : 0.0;

        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 243, 242, 242),
          drawer: isLargeScreen ? null : CustomDrawer(
            isCollapsed: _isCollapsed,
            onToggleDrawer: _toggleDrawer,
          ),
          body: Stack(
            children: [
              if (isLargeScreen)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 300),
                  top: 0,
                  bottom: 0,
                  left: 0,
                  width: drawerWidth,
                  child: CustomDrawer(
                    isCollapsed: _isCollapsed,
                    onToggleDrawer: _toggleDrawer,
                  ),
                ),
              AnimatedPositioned(
                duration: const Duration(milliseconds: 300),
                top: 0,
                bottom: 0,
                left: isLargeScreen ? drawerWidth - 30 : 0, 
                right: 0,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      bottomLeft: Radius.circular(20),
                    ),
                  ),
                  child: const SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(height: 80),
                        Text('Contenu de la page'),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 20,
                left: isLargeScreen ? drawerWidth - 30 : 0,
                right: 0,
                child: const Row(
                  children: [
                    Expanded(
                      child: Center(
                        child: Text(
                          'Genius BackOffice',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (!isLargeScreen)
                Positioned(
                  top: 20,
                  left: 10,
                  child: Builder(
                    builder: (BuildContext context) {
                      return FloatingActionButton(
                        backgroundColor: Colors.transparent,
                        elevation: 0,
                        child: const Icon(Icons.menu, color: Colors.black),
                        onPressed: () {
                          Scaffold.of(context).openDrawer();
                        },
                      );
                    },
                  ),
                ),
            ],
          ),
        );
      },
    );
  }
}
