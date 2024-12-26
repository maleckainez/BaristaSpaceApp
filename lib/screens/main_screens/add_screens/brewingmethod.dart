import 'package:flutter/material.dart';
import 'package:choice/choice.dart';

class BrewingMethodChoice extends StatefulWidget {
  const BrewingMethodChoice({super.key});

  @override
  State<BrewingMethodChoice> createState() => _BrewingMethodChoice();
}

class _BrewingMethodChoice extends State<BrewingMethodChoice> {
  List<String> brewingMethods = [
    'Espresso',
    'French Press',
    'AeroPress',
    'Pour Over',
    'Moka Pot',
    'Cold Brew',
    'Turkish',
    'Siphon',
  ];

  String? selectedBrewingMethod;

  void setSelectedBrewingMethod(String? method) {
    setState(() => selectedBrewingMethod = method);
  }

  @override
  Widget build(BuildContext context) {
    return Choice<String>.inline(
      clearable: true, // Allows clearing the selection
      value: ChoiceSingle.value(selectedBrewingMethod), // Currently selected value
      onChanged: ChoiceSingle.onChanged(setSelectedBrewingMethod), // Callback when selection changes
      itemCount: brewingMethods.length, // Number of brewing methods
      itemBuilder: (state, i) {
        return ChoiceChip(
          selected: state.selected(brewingMethods[i]), // Check if the chip is selected
          onSelected: state.onSelected(brewingMethods[i]), // Handle selection logic
          label: Text(
            brewingMethods[i],
            style: const TextStyle(fontFamily: 'RobotoSlab'),), // Display the brewing method
          selectedColor: Colors.grey.shade600, // Color when selected
          backgroundColor: Colors.grey.shade50,
          labelPadding: EdgeInsets.symmetric(
            horizontal: 5,
            vertical: 0,
          ),
          padding: EdgeInsets.zero,

          labelStyle: TextStyle(
            color: state.selected(brewingMethods[i]) ? Colors.white : Colors.black,
          ),
        );
      },
      listBuilder: ChoiceList.createScrollable(
        spacing: 10,
        padding: const EdgeInsets.symmetric(
          horizontal: 0,
          vertical: 0,
        ),
      ),
    );
  }
}
