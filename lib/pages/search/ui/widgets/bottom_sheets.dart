import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:kettik_diplom/shared/theme.dart';

class BottomSheets {
  showSearchBottomSheet(BuildContext context) =>
      Future.delayed(Duration(seconds: 0)).then(
        (_) => showBottomSheet(
          enableDrag: false,
          backgroundColor: AppColors.primaryColor.withOpacity(0),
          context: context,
          builder: (_) => Container(
            height: getProportionateScreenHeight(573),
            margin: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(40),
            ),
            padding: EdgeInsets.symmetric(
              horizontal: getProportionateScreenWidth(10),
              vertical: getProportionateScreenHeight(10),
            ),
            decoration: const BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(25),
                topRight: Radius.circular(25),
              ),
            ),
          ),
        ),
      );

  showAllBottomSheet(context) => showBottomSheet(
    enableDrag: false,
        backgroundColor: AppColors.primaryColor.withOpacity(0),
        context: context,
        builder: (_) => Container(
          height: getProportionateScreenHeight(1200),
          margin: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(40),
          ),
          padding: EdgeInsets.symmetric(
            horizontal: getProportionateScreenWidth(10),
            vertical: getProportionateScreenHeight(10),
          ),
          decoration: const BoxDecoration(
            color: AppColors.whiteColor,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
          ),
        ),
      );
}
