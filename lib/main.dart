import 'package:flutter/material.dart';
import 'views/home_view.dart';
import 'widgets/side_menu.dart';
import 'constants/app_colors.dart';

void main() {
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});

    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Citeasy',
            theme: ThemeData.dark().copyWith(
                colorScheme: const ColorScheme.dark(
                    background: AppColors.background,
                    surface: AppColors.surface,
                ),
                scaffoldBackgroundColor: AppColors.background,
                useMaterial3: true,
            ),
            home: const MainLayout(),
        );
    }
}

class MainLayout extends StatefulWidget {
    const MainLayout({super.key});

    @override
    State<MainLayout> createState() => _MainLayoutState();
}

class _MainLayoutState extends State<MainLayout> {
    int _selectedIndex = 0;

    @override
    Widget build(BuildContext context) {
        return Row(
            children: [
                SideMenu(
                    selectedIndex: _selectedIndex,
                    onItemSelected: (index) {
                        setState(() {
                            _selectedIndex = index;
                        });
                    },
                ),
                const VerticalDivider(width: 1),
                Expanded(child: HomeView()),
            ],
        );
    }
}