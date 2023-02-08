import 'package:flutter/material.dart';



class othergame extends StatelessWidget {
  const othergame({super.key});


  @override
  Widget build(BuildContext context) {
    return    Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('Başka oyun yok. Şimdilik...', style: TextStyle(fontSize: 25)),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Geri Dön'),
            ),
          ],
        ),
      ),
    );
  }
}

