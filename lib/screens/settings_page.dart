import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';
import 'package:flutter_application_1/services/todo_service.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  final TodoService _todoService = TodoService();
  int _done = 0;
  int _undone = 0;
  int _overall = 0;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadStats();
  }

  Future<void> _loadStats() async {
    final stats = await _todoService.getStats();
    setState(() {
      _done = stats['done']!;
      _undone = stats['undone']!;
      _overall = stats['overall']!;
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: tdBlack),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Settings',
          style: TextStyle(color: tdBlack, fontWeight: FontWeight.w600),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: _isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Statistics',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: tdGrey,
                    ),
                  ),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      _statCard('Done', _done, tdBlue),
                      SizedBox(width: 10),
                      _statCard('Undone', _undone, tdRed),
                      SizedBox(width: 10),
                      _statCard('Overall', _overall, tdBlack),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  Widget _statCard(String label, int count, Color color) {
    return Expanded(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          children: [
            Text(
              '$count',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            SizedBox(height: 5),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: tdGrey,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
