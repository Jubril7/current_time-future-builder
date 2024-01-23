import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  Future<String> getCurrentTime() async {
    await Future.delayed(const Duration(seconds: 2));
    DateTime now = DateTime.now();
    return "Current Time: ${now.hour}:${now.minute}:${now.second}";
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('Current time')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FutureBuilder(
                future: getCurrentTime(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const CircularProgressIndicator();
                  } else if (snapshot.hasError) {
                    return Text('Error: ${snapshot.error}');
                  } else {
                    String currentTime = snapshot.data ?? "N/A";
                    return Text(currentTime);
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
