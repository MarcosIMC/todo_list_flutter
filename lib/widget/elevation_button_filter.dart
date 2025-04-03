import 'package:flutter/material.dart';

class FilterButton extends StatelessWidget {
  final String label;
  final bool isSelected;
  final VoidCallback onPressed;


  const FilterButton({
    super.key,
    required this.label,
    required this.isSelected,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            backgroundColor: isSelected ? Colors.blueAccent : Colors.grey
        ),
        onPressed: onPressed,
        child: Text(label, style: TextStyle(color: Colors.white),)
    );
  }

}