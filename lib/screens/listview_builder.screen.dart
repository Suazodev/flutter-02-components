import 'package:components/themes/app_theme.dart';
import 'package:flutter/material.dart';

class ListViewBuilderScreen extends StatefulWidget {
  const ListViewBuilderScreen({Key? key}) : super(key: key);

  @override
  State<ListViewBuilderScreen> createState() => _ListViewBuilderScreenState();
}

class _ListViewBuilderScreenState extends State<ListViewBuilderScreen> {
  final List<int> imageIds = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  final ScrollController scrollController = ScrollController();
  bool _isLoading = false;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(() {
      if (scrollController.position.pixels + 500 >=
          scrollController.position.maxScrollExtent) {
        if (!_isLoading) {
          setState(() {
            _isLoading = true;
          });
          Future.delayed(const Duration(seconds: 2), () {
            setState(() {
              imageIds
                  .addAll(List.generate(10, (i) => i + imageIds.length + 1));
              _isLoading = false;
              scrollController.animateTo(scrollController.position.pixels + 100,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn);
            });
          });
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MediaQuery.removePadding(
        context: context,
        removeTop: true,
        removeBottom: true,
        child: Stack(
          children: [
            RefreshIndicator(
              color: AppTheme.primary,
              onRefresh: () {
                return Future.delayed(const Duration(seconds: 2), () {
                  setState(() {
                    imageIds.clear();
                    imageIds.addAll(List.generate(10, (i) => i + 1));
                  });
                });
              },
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                controller: scrollController,
                itemCount: imageIds.length,
                itemBuilder: (context, index) {
                  return FadeInImage(
                    width: double.infinity,
                    height: 300,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage('assets/jar-loading.gif'),
                    image: NetworkImage(
                      'https://picsum.photos/500/300?image=${imageIds[index]}',
                    ),
                  );
                },
              ),
            ),
            Container(
              alignment: Alignment.bottomCenter,
              margin: const EdgeInsets.only(bottom: 20),
              child: _isLoading
                  ? const CircularProgressIndicator(
                      color: AppTheme.primary,
                      strokeWidth: 5,
                    )
                  : null,
            )
          ],
        ),
      ),
    );
  }
}
