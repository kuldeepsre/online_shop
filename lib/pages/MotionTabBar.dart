import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:online_shop/bloc/them/ThemeCubit.dart';

enum TabFormat { icon, label }

class MotionTabController extends StatefulWidget {
  final String initialSelectedTab;
  final double tabBarHeight;
  final Color tabIconColor;
  final Color tabSelectedColor;
  final Function(String) onTabItemSelected;
  final List<String> labels;
  final List<IconData> icons;
  final TabFormat tabFormat;

   const MotionTabController({
    required this.initialSelectedTab,
    required this.tabBarHeight,
    required this.tabIconColor,
    required this.tabSelectedColor,
    required this.onTabItemSelected,
    required this.labels,
    required this.icons,
    required this.tabFormat,
  });

  @override
  _MotionTabControllerState createState() => _MotionTabControllerState();
}

class _MotionTabControllerState extends State<MotionTabController> {
  late int _selectedIndex;

  @override
  void initState() {
    super.initState();
    _selectedIndex = widget.labels.indexOf(widget.initialSelectedTab);
  }

  @override
  Widget build(BuildContext context) {

    final themeState=context.watch<ThemeCubit>().state;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 7.0,vertical:12 ),
      child: Container(
        height: widget.tabBarHeight,
        decoration: BoxDecoration(
          color:themeState.backgroundColor ,
          borderRadius: BorderRadius.circular(45), // Adjust the radius as needed
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 4,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: List.generate(
            widget.labels.length,
                (index) => GestureDetector(
              onTap: () {
                setState(() {
                  _selectedIndex = index;
                });
                widget.onTabItemSelected(widget.labels[index]);
              },
              child: _buildTabItem(index),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTabItem(int index) {
    switch (widget.tabFormat) {
      case TabFormat.icon:
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              widget.icons[index],
              color: _selectedIndex == index ? widget.tabSelectedColor : widget.tabIconColor,

            ),
            SizedBox(height: 4),
            Text(
              widget.labels[index],
              style: TextStyle(
                color: _selectedIndex == index ? widget.tabSelectedColor : widget.tabIconColor,
                  fontFamily: 'Gilroy',
                  fontSize: 12,
                  letterSpacing: 0 ,
                  fontWeight: FontWeight.normal,
                  height: 1
              ),
            ),
          ],
        );
      case TabFormat.label:
        return Text(
          widget.labels[index],
          style: TextStyle(
            color: _selectedIndex == index ? widget.tabSelectedColor : widget.tabIconColor,
              fontFamily: 'Gilroy',
              fontSize: 12,
              letterSpacing: 0 ,
              fontWeight: FontWeight.normal,
              height: 1
          ),
        );
    }
  }
}
