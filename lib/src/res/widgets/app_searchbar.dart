import 'package:flutter/material.dart';
import 'package:sipalma/src/res/styles/index.dart';

class AppSearchbar extends StatelessWidget {
  final Function(String) onSubmit;
  final String title;
  const AppSearchbar({super.key, required this.onSubmit, required this.title});

  @override
  Widget build(BuildContext context) {
    final TextEditingController txtController = TextEditingController();
    return Container(
        height: 48,
        width: double.infinity,
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
        child: TextField(
          autofocus: false,
          controller: txtController,
          cursorColor: AppColors.primary,
          style: AppTxtStyle.gLight(16),
          decoration: InputDecoration(
              prefixIcon: const Icon(
                Icons.search,
                size: 26,
                color: AppColors.primary,
              ),
              isDense: true,
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 12, horizontal: 10),
              border: null,
              fillColor: Colors.white,
              filled: true,
              hintText: 'Cari $title di sini...',
              hintStyle: AppTxtStyle.gLight(16),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.primary)),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide:
                      const BorderSide(width: 1, color: AppColors.green))),
          onSubmitted: (value) async {
            onSubmit(value);
          },
        ));
  }
}
