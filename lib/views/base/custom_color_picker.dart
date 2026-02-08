import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:xandra/controllers/theme_controller.dart';
import 'package:xandra/utils/app_colors.dart';

class CustomColorPicker extends StatefulWidget {
  final List<Color> colors;
  final void Function(Color) onChanged;
  const CustomColorPicker({
    super.key,
    required this.onChanged,
    required this.colors,
  });

  @override
  State<CustomColorPicker> createState() => _CustomColorPickerState();
}

class _CustomColorPickerState extends State<CustomColorPicker> {
  double _thumbX = 0;
  int _selectedIndex = 0;

  void _updateSelection(double maxX) {
    // Ensure the thumb position never goes outside the slider bounds
    final clamped = _thumbX.clamp(0.0, maxX);

    // Convert the thumb's X position into a 0.0 → 1.0 percentage
    // This represents how far along the slider the thumb currently is
    final t = maxX <= 0 ? 0.0 : clamped / maxX;

    // Map that percentage to a color index in the list
    // Example: if there are 5 colors, t=0.0 → index 0, t=1.0 → index 4
    final idx = (t * (widget.colors.length - 1)).round().clamp(
      0,
      widget.colors.length - 1,
    );

    // Only update state and notify parent if the selected color actually changed
    if (idx != _selectedIndex) {
      _selectedIndex = idx;
      widget.onChanged(widget.colors[idx]);
    }
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final thumbSize = 20.0;
        final maxX = (constraints.maxWidth - thumbSize).clamp(
          0.0,
          double.infinity,
        );
        _thumbX = _thumbX.clamp(0.0, maxX);
        return Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Row(
              children: [
                for (var i in widget.colors)
                  Expanded(
                    child: Container(
                      height: 12,
                      decoration: BoxDecoration(
                        color: i,
                        border: Border.all(color: Color(0xff_e9ebf8)),
                      ),
                    ),
                  ),
              ],
            ),
            Positioned(
              left: _thumbX,
              child: GestureDetector(
                onHorizontalDragUpdate: (details) {
                  setState(() {
                    _thumbX = (_thumbX + details.delta.dx).clamp(0.0, maxX);
                    _updateSelection(maxX);
                  });
                },
                child: Container(
                  height: 24,
                  width: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Get.find<ThemeController>().darkTheme
                        ? Color(0xff_0d0d0d)
                        : AppColors.offWhite,
                    border: Border.all(color: Color(0xff_cecece)),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 4),
                        blurRadius: 4,
                        color: Colors.black26,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
