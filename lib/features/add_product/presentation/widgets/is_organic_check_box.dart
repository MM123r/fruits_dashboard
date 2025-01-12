import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fruits_dashboard/core/utils/text_styles.dart';
import 'custom_check_box.dart';

class IsOrganicCheckBox extends StatefulWidget {
  const IsOrganicCheckBox({super.key, required this.onChanged});

  final ValueChanged<bool> onChanged;
  @override
  State<IsOrganicCheckBox> createState() => _IsOrganicCheckBoxState();
}

class _IsOrganicCheckBoxState extends State<IsOrganicCheckBox> {
  bool IsOrganicAccepted = false;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'is Organic Item?', // 0xFF949D9E
                style: getFont16TextStyle(context,fontWeight: FontWeight.w600)
              ),
            ],
          ),
          textAlign: TextAlign.right,
        ),
        const Expanded(
          child: SizedBox(
            width: 16,
          ),
        ),
        CustomCheckBox(
          onChecked: (value) {
            IsOrganicAccepted = value;
            widget.onChanged(value);
            setState(() {});
          },
          isChecked: IsOrganicAccepted,
        ),
      ],
    );
  }
}