import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/pages/index/provider/index_provider.dart';
import 'package:kettik_diplom/pages/search/provider/search_provider.dart';
import 'package:kettik_diplom/pages/search/ui/recomendation_dialog.dart';
import 'package:kettik_diplom/pages/search/ui/search_dialog.dart';
import 'package:kettik_diplom/pages/search/ui/widgets/bottom_sheets.dart';
import 'package:kettik_diplom/shared/size_config.dart';
import 'package:kettik_diplom/shared/theme.dart';
import 'package:kettik_diplom/shared/ui_helper.dart';

class SearchScreen extends StatelessWidget {
  final List<String> headerTexts = [
    'Поиск туров',
    '🔥 Рекомендации',
  ];

  @override
  Widget build(BuildContext context) {
    return BaseProvider<SearchProvider>(
        onReady: (p0) => p0.init(context),
        builder: (context, model, child) {
          // Future.delayed(Duration(seconds: 0)).then(
          //   (_) => showSearchBottomSheet(context, model),
          // );
          return Scaffold(
            backgroundColor: Colors.indigo,
            body: SafeArea(
              child: Stack(
                children: [
                  SvgPicture.asset(
                    'assets/images/svg/charyn2.svg',
                    fit: BoxFit.cover,
                  ),
                  Container(
                    width: model.size!.width,
                    padding: EdgeInsets.symmetric(
                      horizontal: getProportionateScreenWidth(50),
                      vertical: getProportionateScreenHeight(20),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: getProportionateScreenHeight(10),
                        horizontal: getProportionateScreenWidth(10),
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(25),
                        color: Colors.black.withOpacity(0.5),
                      ),
                      child: ToggleButtons(
                        selectedColor: Colors.black,
                        color: AppColors.whiteColor,
                        fillColor: AppColors.bgBlueColor.withOpacity(0),
                        borderRadius: BorderRadius.circular(25),
                        renderBorder: false,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            width: getProportionateScreenWidth(297),
                            decoration: BoxDecoration(
                              color: model.isSelected[0]
                                  ? AppColors.whiteColor
                                  : null,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              'Поиск туров',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(24),
                              ),
                            ),
                          ),
                          Container(
                            alignment: Alignment.center,
                            width: getProportionateScreenWidth(297),
                            decoration: BoxDecoration(
                              color: model.isSelected[1]
                                  ? AppColors.whiteColor
                                  : null,
                              borderRadius: BorderRadius.circular(25),
                            ),
                            child: Text(
                              '🔥 Рекомендации',
                              style: TextStyle(
                                fontSize: getProportionateScreenWidth(24),
                              ),
                            ),
                          ),
                        ],
                        isSelected: model.isSelected,
                        onPressed: (int index) {
                          model.toggled(index);
                          model.isSelected[0]
                              ? BottomSheets().showSearchBottomSheet(context)
                              : BottomSheets().showAllBottomSheet(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        model: SearchProvider());
  }

  // showSearchBottomSheet(context, SearchProvider model) => showBottomSheet(
  //       // enableDrag: false,
  //       context: context,
  //       backgroundColor: AppColors.primaryColor.withOpacity(0),
  //       builder: (context) => Container(
  //         height: getProportionateScreenHeight(573),
  //         margin: EdgeInsets.symmetric(
  //           horizontal: getProportionateScreenWidth(40),
  //         ),
  //         padding: EdgeInsets.symmetric(
  //           horizontal: getProportionateScreenWidth(10),
  //           vertical: getProportionateScreenHeight(10),
  //         ),
  //         decoration: const BoxDecoration(
  //           color: AppColors.whiteColor,
  //           borderRadius: BorderRadius.only(
  //             topLeft: Radius.circular(25),
  //             topRight: Radius.circular(25),
  //           ),
  //         ),
  //         child: Text(
  //           'Low',
  //         ),
  //       ),
  //     );

}
