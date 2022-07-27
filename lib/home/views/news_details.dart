import 'package:flutter/material.dart';

class CryptoNewsDetails extends StatelessWidget {
  const CryptoNewsDetails({this.state, this.index});
  final state;
  final index;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Wrap(
              children: [
                Text(
                  state.results[index].title,
                  style: TextStyle(fontSize: 25),
                ),
                Text(
                  state.results[index].domain,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
