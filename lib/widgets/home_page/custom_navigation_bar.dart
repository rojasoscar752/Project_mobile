import 'package:calc_app/providers/ui_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomNavigationBar extends StatelessWidget {
  const CustomNavigationBar({super.key});

  @override
  Widget build(BuildContext context) {
    final uiProvider = Provider.of<UIProvider>(context);
    return BottomNavigationBar(
      currentIndex: uiProvider.bnbIndex,
      onTap: (int i) => uiProvider.bnbIndex = i,
      elevation: 0.0, 
    items: const[
      BottomNavigationBarItem(
        label: 'Balane', icon: Icon(Icons.account_balance_outlined)),
      BottomNavigationBarItem(
        label: 'Graficos', icon: Icon(Icons.bar_chart_outlined)),      
      BottomNavigationBarItem(
        label: 'Configuration', icon: Icon(Icons.settings)),      
    ]);
  }

}