import 'package:cssapp/configs/configs.dart';
import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final void Function(String?) onChanged;
  final String? dropdownValue;
  final List<String> items;
  const CustomDropDown(
      {Key? key,
      required this.onChanged,
      this.dropdownValue,
      required this.items})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 90,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(color: Colors.white, width: 1)),
      child: DropdownButtonHideUnderline(
        child: DropdownButton<String>(
          iconSize: 10,
          elevation: 24,
          onChanged: onChanged,
          value: dropdownValue,
          items: items.map<DropdownMenuItem<String>>(
            (String value) {
              return DropdownMenuItem(
                value: value,
                child: Text(
                  value,
                  style: textRegular.copyWith(color: Pallet.white),
                ),
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
