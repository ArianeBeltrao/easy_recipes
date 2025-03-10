import 'package:flutter/material.dart';
import '../models/category.dart';
import '../components/recipe_item.dart';

import '../data/dummy_data.dart';

class CategoriesRecipesScreen extends StatelessWidget {
  const CategoriesRecipesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final category = ModalRoute.of(context)?.settings.arguments as Category;
    final categoryRecipes =
        dummyRecipes.where((recipe) {
          return recipe.categories.contains(category.id);
        }).toList();

    return Scaffold(
      appBar: AppBar(title: Text(category.title)),
      body: ListView.builder(
        itemCount: categoryRecipes.length,
        itemBuilder: (ctx, index) {
          return RecipeItem(categoryRecipes[index]);
        },
      ),
    );
  }
}
