import 'package:flutter/material.dart';

class SearchInputTextField extends StatelessWidget {
  const SearchInputTextField({
    super.key, required this.textEditingController,
  });
  final TextEditingController textEditingController;
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: textEditingController,
      decoration: InputDecoration(
        fillColor: Colors.grey.shade200,
        filled: true,
        hintText: 'Search',
        prefixIcon: const Icon(Icons.search_rounded),
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        focusedBorder:const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
