import 'package:flutter/material.dart';
// import 'package:meals_app/widgets/main_drawer.dart';
// import 'package:meals_app/screens/tabs.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/provider/filters_provider.dart';


// enum Filter {
//   glutenFree,
//   lactoseFree,
//   vegeterian,
//   vegan
// }
class FiltersScreen extends ConsumerWidget {
  const FiltersScreen({super.key, 
  // required this.currentFilters
  });

// final Map<Filter, bool> currentFilters;



@override
// void initState(){
//   super.initState();
//   final activeFilters = ref.read(filtersProvider);
//   _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
//   _lactoFreeFilterSet = activeFilters[Filter.lactoseFree]!;
//   _vegeterianFilterSet = activeFilters[Filter.vegeterian]!;
//   _veganFilterSet = activeFilters[Filter.vegan]!;
// }
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final activeFilters = ref.watch(filtersProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
      ),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier){
      //   Navigator.of(context).pop();
      //   if(identifier == 'meals'){
      //     Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx)=> TabsScreen()));
      //   }
      // }),
      body: Column(     
          children: [
          SwitchListTile(
            value: activeFilters[Filter.glutenFree], 
            onChanged: (isChecked){
            ref.read(filtersProvider.notifier).setFilter(Filter.glutenFree, isChecked);
          },
          title: Text(
            'Gluten-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          subtitle: Text('Only include gluten-free meals',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: EdgeInsets.only(left: 24, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.lactoseFree], 
            onChanged: (isChecked){
            ref.read(filtersProvider.notifier).setFilter(Filter.lactoseFree, isChecked);
          },
          title: Text(
            'Lacto-free',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          subtitle: Text('Only include lactos-free meals',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: EdgeInsets.only(left: 24, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegeterian], 
            onChanged: (isChecked){
            ref.read(filtersProvider.notifier).setFilter(Filter.vegeterian, isChecked);
          },
          title: Text(
            'Vegeterian',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          subtitle: Text('Only include vegeterian meals',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: EdgeInsets.only(left: 24, right: 22),
          ),
          SwitchListTile(
            value: activeFilters[Filter.vegan], 
            onChanged: (isChecked){
            ref.read(filtersProvider.notifier).setFilter(Filter.vegan, isChecked);
          },
          title: Text(
            'Vegan',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          subtitle: Text('Only include vegan meals',
            style: Theme.of(context).textTheme.titleMedium!.copyWith(
              color: Theme.of(context).colorScheme.onSurface
            ),
          ),
          activeColor: Theme.of(context).colorScheme.tertiary,
          contentPadding: EdgeInsets.only(left: 24, right: 22),
          ),
        ],
          
        ),
    );
  }
}