import 'package:flutter/material.dart';
import 'package:meals_app/model/meal.dart';
import 'package:meals_app/screens/meals_details_screen.dart';
import 'package:meals_app/widgets/meal_item.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key, required this.title, required this.meals, 
  // required this.onToggleFavourite
  });

  final String title;
  final List<Meal> meals;
  // final void Function(Meal meal) onToggleFavourite;

  void selectMeal(BuildContext context, Meal meal) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealdDetailsSCreen(meal: meal, 
        // onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    Widget content = Center(child: 
    Column(
      mainAxisSize: MainAxisSize.min,
      children: [
            Text(
              'Uh oh... nothing here!',
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            SizedBox(height: 16),
            Text(
              'Try selecting a different category!',
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
          ],
        ),
      );

      if(meals.isNotEmpty){
        content = ListView.builder(
          itemCount: meals.length,
          itemBuilder: (ctx, index) => MealItem(
              meal: meals[index],
              onSelectMeal: (ctx, meal) { 
                selectMeal(ctx, meal);
              },
            ),
        );
  }

  if(title == null){
    return content;
  }
    return Scaffold(
      appBar: AppBar(title: Text(title, 
        style: Theme.of(context).textTheme.headlineLarge!.copyWith(
          color: Theme.of(context).colorScheme.onSurface,
        ),
      ),
      ),
      body: content,
    );
  }
}
  
