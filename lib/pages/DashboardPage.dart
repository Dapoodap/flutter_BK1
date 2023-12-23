import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Ini Dashboard",style: TextStyle(
        fontSize: 25,
        color: Colors.red[600],
        fontWeight: FontWeight.bold
      ),)),
    );
  }
} 