import 'package:flutter/material.dart';
import 'package:kettik_diplom/base/base_provider.dart';
import 'package:kettik_diplom/pages/index/provider/index_provider.dart';
import 'package:kettik_diplom/pages/search/provider/search_provider.dart';
import 'package:kettik_diplom/pages/search/ui/recomendation_dialog.dart';
import 'package:kettik_diplom/pages/search/ui/search_dialog.dart';
import 'package:kettik_diplom/shared/size_config.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseProvider<SearchProvider>(
        onReady: (p0) => p0.init(context),
        builder: (context, model, child) {
          return Scaffold(
            backgroundColor: Colors.indigo,
            body: SafeArea(
              child: SingleChildScrollView(
                // physics: const NeverScrollableScrollPhysics(),
                child: Container(
                  width: model.size!.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //* toggle buttons
                      Container(
                        alignment: Alignment.topCenter,
                        width: model.size!.width * 0.9,
                        padding: const EdgeInsets.all(5),
                        margin: EdgeInsets.only(
                          top: getProportionateScreenHeight(20),
                          // left: model.size!.width * 0.05
                        ),
                        decoration: BoxDecoration(
                          color: Colors.black87.withOpacity(0.5),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            InkWell(
                              onTap: () {
                                model.setIsSearchTours(context, true);
                              },
                              child: Container(
                                width: model.size!.width * 0.43,
                                padding: EdgeInsets.symmetric(
                                    // horizontal: getProportionateScreenWidth(10),
                                    vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                    color: model.isSearchTours
                                        ? Colors.white
                                        : Colors.black.withOpacity(0.05),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  "Поиск туров",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: model.isSearchTours
                                          ? Colors.black
                                          : Colors.white),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: getProportionateScreenWidth(5),
                            ),
                            InkWell(
                              onTap: () {
                                model.setIsSearchTours(context, false);
                              },
                              child: Container(
                                width: model.size!.width * 0.43,
                                padding: EdgeInsets.symmetric(
                                    // horizontal: getProportionateScreenWidth(10),
                                    vertical: getProportionateScreenHeight(10)),
                                decoration: BoxDecoration(
                                    color: model.isSearchTours
                                        ? Colors.black.withOpacity(0.05)
                                        : Colors.white,
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  "Рекомендации",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      color: model.isSearchTours
                                          ? Colors.white
                                          : Colors.black),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      // showModalBottomSheet(context: context, builder: builder),
                      // model.isSearchTours? SearchDialog() : RecomendationDialog()
                      // ListView.builder(
                      //     physics: const NeverScrollableScrollPhysics(),
                      //     shrinkWrap: true,
                      //     itemCount: 100,
                      //     itemBuilder: (context, index) {
                      //       return Text("Text is $index");
                      //     })
                    ],
                  ),
                ),
              ),
            ),
          );
        },
        model: SearchProvider());
  }
}
