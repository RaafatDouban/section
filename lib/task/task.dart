import 'package:flutter/material.dart';

class TaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Screen')),
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'My Task',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Text(
                        'Helljasjkansk sanskahks kh sk kash aks a h ksahhs a kh shakh skhhaks hkh sak as asjalskas l .',
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 32.0),
            child: Image.asset(
              'assets/porsche.jpeg',
              height: 300,
              width: 150,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16.0,
              vertical: 8.0,
            ),
            child: SizedBox(
              height: 60,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/rari.jpeg'),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/porsche.jpeg'),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/lambo.jpeg'),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/bug.jpeg'),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/bentley.jpeg'),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/clubhouse.jpeg'),
                  ),
                  SizedBox(width: 10),
                  CircleAvatar(
                    radius: 25,
                    backgroundImage: AssetImage('assets/bentley.jpeg'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
