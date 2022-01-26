import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  final options = const [
    'Megaman X',
    'Metal Gear Solid',
    'Metroid Prime',
    'Final Fantasy VII'
  ];
  const ListView2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ListView1'),
      ),
      body: ListView.separated(
          itemBuilder: (_, index) => ListTile(
                title: Text(options[index]),
                trailing: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: Colors.indigo,
                ),
                onTap: () {},
              ),
          separatorBuilder: (_, __) => const Divider(),
          itemCount: options.length),
    );
  }
}
