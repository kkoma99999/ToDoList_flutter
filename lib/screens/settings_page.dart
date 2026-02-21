import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants/colors.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;
  bool _darkMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: tdBGColor,
      appBar: AppBar(
        backgroundColor: tdBGColor,
        elevation: 0,
        title: Text(
          'Settings',
          style: TextStyle(color: tdBlack, fontWeight: FontWeight.w600),
        ),
        iconTheme: IconThemeData(color: tdBlack),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Preferences',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: tdGrey,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  SwitchListTile(
                    title: Text(
                      'Notifications',
                      style: TextStyle(color: tdBlack, fontSize: 16),
                    ),
                    secondary: Icon(Icons.notifications, color: tdBlue),
                    value: _notificationsEnabled,
                    activeColor: tdBlue,
                    onChanged: (value) {
                      setState(() {
                        _notificationsEnabled = value;
                      });
                    },
                  ),
                  Divider(height: 1, indent: 16, endIndent: 16),
                  SwitchListTile(
                    title: Text(
                      'Dark Mode',
                      style: TextStyle(color: tdBlack, fontSize: 16),
                    ),
                    secondary: Icon(Icons.dark_mode, color: tdBlue),
                    value: _darkMode,
                    activeColor: tdBlue,
                    onChanged: (value) {
                      setState(() {
                        _darkMode = value;
                      });
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 25),
            Text(
              'About',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: tdGrey,
              ),
            ),
            SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.info_outline, color: tdBlue),
                    title: Text('Version', style: TextStyle(color: tdBlack)),
                    trailing: Text('1.0.0', style: TextStyle(color: tdGrey)),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
