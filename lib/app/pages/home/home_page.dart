import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/post_controller.dart';
import '../../core/widgets/post_widget.dart';
import '../../models/post_model.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey = GlobalKey<RefreshIndicatorState>();
  final PostController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        onRefresh: () async {
          controller.getPosts();
        },
        child: GetX<PostController>(
          init: controller,
          builder: (controller) {
            if (controller.isLoading.value == true) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: controller.listPost.length,
                itemBuilder: (BuildContext context, int index) {
                  PostModel model = controller.listPost[index];

                  return PostWidget(model: model);
                },
              );
            }
          },
        ),
      ),
    );
  }
}
