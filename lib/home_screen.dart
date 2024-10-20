import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
        centerTitle: true,
        foregroundColor: const Color.fromARGB(255, 248, 252, 3),
        backgroundColor: Colors.cyan,
        actions: [
          IconButton(
              icon: const Icon(Icons.help),
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) => Dialog(
                    child: Container(
                      margin: const EdgeInsets.all(16),
                      padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                      color: Colors.blue,
                      width: 100,
                      height: 50,
                      alignment: Alignment.bottomCenter,
                      child: const Text('Hello world'),
                    ),
                  ),
                );
              }),
        ],
      ),
      body: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Container(
            color: Colors.black,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.yellow,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.black,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.yellow,
            width: 100,
            height: 100,
          ),
          Container(
            color: Colors.red,
            width: 100,
            height: 100,
          ),
        ],
      ),
    );
  }
}

      //   Flexible(
      //     flex: 10,
      //     child: Container(
      //       color: Colors.green,
      //     ),
      //   ),
      //   Flexible(
      //     flex: 5,
      //     child: Container(
      //       color: Colors.blue,
      //     ),
      //   ),
      // ])

      // body: Column(
      //     children: [
      //       Flexible(
      //         child: Container(
      //             color: Colors.black,
      //             child: Row(
      //               children: [
      //                 Expanded(
      //                   child: Container(
      //                     alignment: Alignment.center,
      //                     child: const Text(
      //                       'Selamat datang',
      //                       style: TextStyle(
      //                         fontSize: 24,
      //                         fontWeight: FontWeight.bold,
      //                         color: Colors.white,
      //                       ),
      //                     ),
      //                   ),
      //                 ),
      //                 Expanded(
      //                   child: Container(
      //                     color: Colors.green,
      //                   ),
      //                 ),
      //               ],
      //             )),
      //       ),
      //       Expanded(
      //         child: Container(
      //           color: Colors.deepPurple,
      //         ),
      //       ),
      //       Flexible(
      //         child: Container(
      //           color: Colors.teal,
      //         ),
      //       ),
      //     ]),
