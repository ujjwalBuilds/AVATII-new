import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class CustomSvgIcon extends StatelessWidget {
  final String selectedAssetName;
  final String unselectedAssetName;
  final bool isSelected;
  final double height;

  const CustomSvgIcon({
    super.key,
    required this.selectedAssetName,
    required this.unselectedAssetName,
    required this.isSelected,
    this.height = 20.0,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      isSelected ? selectedAssetName : unselectedAssetName,
      height: height,
    );
  }
}
