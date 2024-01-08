import 'package:flutter/material.dart';
import 'package:meals/providers/filter_provider.dart';
import 'package:meals/screens/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingScreen extends ConsumerStatefulWidget {
  const SettingScreen({super.key});

  @override
  ConsumerState<SettingScreen> createState() {
    return _SettingScreenState();
  }
}

class _SettingScreenState extends ConsumerState<SettingScreen> {
  void changePageThroughDrawer(String identifier) {
    Navigator.pop(context);
    if (identifier == "meals") {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (ctx) => const MainScreen()));
    }
  }

  @override
  Widget build(BuildContext context) {
    final activeFilters = ref.watch(filterProvider);
    final changeFilter = ref.read(filterProvider.notifier).setFilter;

    return Scaffold(
        appBar: AppBar(title: const Text("Settings")),
        body: PopScope(
          canPop: false,
          onPopInvoked: (didPop) {
            if (!didPop) {
              Navigator.of(context).pop({"String": 12});
            }
          },
          child: Column(
            children: [
              SwitchListTile(
                  title: const Text("Set gluten-free Filter."),
                  subtitle: const Text("This will give gluten free meals"),
                  value: activeFilters[FilterSet.gluten]!,
                  onChanged: (isChecked) {
                    changeFilter(isChecked, FilterSet.gluten);
                  }),
              SwitchListTile(
                  title: const Text("Set Vegan Filter."),
                  subtitle: const Text("This will give gluten free meals"),
                  value: activeFilters[FilterSet.vegan]!,
                  onChanged: (isChecked) {
                    changeFilter(isChecked, FilterSet.vegan);
                  }),
              SwitchListTile(
                  title: const Text("Set vegetarian Filter."),
                  subtitle: const Text("This will give gluten free meals"),
                  value: activeFilters[FilterSet.vegetarian]!,
                  onChanged: (isChecked) {
                    changeFilter(isChecked, FilterSet.vegetarian);
                  }),
              SwitchListTile(
                  title: const Text("Set lactose-free Filter."),
                  subtitle: const Text("This will give gluten free meals"),
                  value: activeFilters[FilterSet.lactose]!,
                  onChanged: (isChecked) {
                    changeFilter(isChecked, FilterSet.lactose);
                  }),
            ],
          ),
        ));
  }
}
