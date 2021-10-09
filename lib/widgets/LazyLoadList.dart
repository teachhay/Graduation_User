import 'package:flutter/material.dart';

class LazyLoadList extends StatefulWidget {
  const LazyLoadList({Key? key}) : super(key: key);

  @override
  _LazyLoadListState createState() => _LazyLoadListState();
}

class _LazyLoadListState extends State<LazyLoadList> {
  ScrollController controller = ScrollController();
  List<String> items = List.generate(10, (index) => 'Hello ${index + 1}');

  void _scrollListener() {
    if (controller.position.extentAfter < 500) {
      setState(() {
        items.addAll(List.generate(10, (index) => 'Inserted ${items.length + index - 1}'));
      });
    }
  }

  @override
  void initState() {
    super.initState();
    controller = ScrollController()..addListener(_scrollListener);
  }

  @override
  void dispose() {
    controller.removeListener(_scrollListener);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home Page")),
      body: ListView.builder(
        controller: controller,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.fromLTRB(8, 12, 8, 12),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: Colors.red[200],
              ),
              width: double.infinity,
              height: 180,
              child: Text(items[index]),
            ),
          );
        },
        itemCount: items.length,
      ),
    );
  }
}
