import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Icon(Icons.local_fire_department, color: Colors.orange),
            SizedBox(width: 8),
            Text("Home"),
          ],
        ),
      ),
      body: const Center(child: Text("Search Content")),
    );
  }
}