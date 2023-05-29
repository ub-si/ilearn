import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/category_controller.dart';
import '../../models/category_model.dart';

class CategoryPage extends StatelessWidget {
  const CategoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Categorias'),
      ),
      body: GetX<CategoryController>(
        builder: (controller) {
          if (controller.isLoading.value == true) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return ListView.separated(
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const Divider(thickness: 1, indent: 16, endIndent: 16),
              itemCount: controller.listCategories.length,
              itemBuilder: (BuildContext context, int index) {
                CategoryModel model = controller.listCategories[index];
                return ListTile(
                  title: Text("${model.name}", style: const TextStyle(fontWeight: FontWeight.w600)),
                );
              },
            );
          }
        },
      ),
    );
  }
}
