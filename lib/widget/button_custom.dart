import 'package:course_hotelio/config/app_color.dart';
import 'package:flutter/material.dart';

class ButtonCustom extends StatelessWidget {
  const ButtonCustom({
    super.key,
    required this.label,
    required this.onTap,
    this.isExpand});

  final String label;
  final Function onTap;
  final bool? isExpand;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Stack(
        children: [
          Align(
            alignment: Alignment(0, 0.7),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: AppColor.primary,
                    offset: Offset(0, 5),
                    blurRadius: 20,
                  ),
                ],
              ),
              width: isExpand==null
                  ? null:isExpand!
                  ? double.infinity
                  : null,
              padding: EdgeInsets.symmetric(
                horizontal: 36,
                vertical: 12,
              ),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(label),
            ),
          ),
          Align(
            child: Material(
              color: AppColor.primary,
              borderRadius: BorderRadius.circular(20),
              child: InkWell(
                borderRadius: BorderRadius.circular(20),
                onTap: () => onTap(),
                child: Container(
                  width: isExpand==null
                      ? null:isExpand!
                      ? double.infinity
                      : null,
                  padding: EdgeInsets.symmetric(
                    horizontal: 36,
                    vertical: 12,
                  ),
                  child: Text(
                    label,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16, fontWeight: FontWeight.w900),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
