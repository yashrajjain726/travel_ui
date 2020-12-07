import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class TravelPage extends StatefulWidget {
  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> with TickerProviderStateMixin {
  final imageUrl =
      "https://avatars3.githubusercontent.com/u/53373012?s=460&u=cedd9c70fb472917a167f8e4b4589d40f7765c75&v=4";
  final travelImageUrl =
      "https://images.unsplash.com/photo-1606994829363-fb1ca4740eb6?ixid=MXwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=1052&q=80";
  TabController _tabController;
  double anim = 1.0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    withAnimation(
        vsync: this,
        tween: Tween(begin: 1.0, end: 0.0),
        callBack: (animationVal, controllerVal) {
          anim = animationVal;
          setState(() {});
        });
    _tabController = new TabController(
      vsync: this,
      length: 4,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightGreen[300],
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: VStack(
          [
            VxBox().size(20, 2).white.make(),
            5.heightBox,
            VxBox().size(30, 2).white.make(),
            5.heightBox,
            VxBox().size(15, 2).white.make(),
          ],
        ).pOnly(left: 16, top: 16),
      ),
      body: VStack(
        [
          VxBox(
            child: Column(
              children: [
                VxBox()
                    .square(100)
                    .roundedFull
                    .neumorphic(
                      color: Colors.lightGreen[300],
                      elevation: 30.0,
                    )
                    .bgImage(DecorationImage(image: NetworkImage(imageUrl)))
                    .make(),
                "Hi, "
                    .richText
                    .withTextSpanChildren(["Yashraj".textSpan.bold.make()])
                    .white
                    .xl2
                    .make()
                    .p8()
                    .offset(offset: Offset(-300 * anim, 0)),
                "Software Engineer".text.white.make(),
                VxTextField(
                  borderType: VxTextFieldBorderType.none,
                  borderRadius: 18,
                  hint: "Search About Me",
                  autofocus: false,
                  fillColor: Colors.grey[200].withOpacity(0.3),
                  prefixIcon: Icon(
                    Icons.search_outlined,
                    color: Colors.white,
                  ),
                )
                    .customTheme(
                        themeData: ThemeData(brightness: Brightness.dark))
                    .cornerRadius(12)
                    .p16(), //
              ],
            ),
          ).makeCentered().h32(context),
          ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                  child: VxBox(
                    child: VStack(
                      [
                        TabBar(
                          controller: _tabController,
                          indicatorColor: Colors.lightGreen,
                          indicatorSize: TabBarIndicatorSize.label,
                          labelColor: Colors.lightGreen[300],
                          unselectedLabelColor: Colors.grey[400],
                          labelPadding: Vx.m16,
                          tabs: [
                            Icon(
                              Icons.map,
                              size: 30,
                            ),
                            Icon(
                              Icons.pin_drop,
                              size: 30,
                            ),
                            Icon(
                              Icons.restaurant,
                              size: 30,
                            ),
                            Icon(
                              Icons.person,
                              size: 30,
                            ),
                          ],
                        ),
                        TabBarView(
                          controller: _tabController,
                          children: ["1", "2", "3", "4"]
                              .map((e) => VStack([
                                    "Discover Places in London"
                                        .text
                                        .gray600
                                        .bold
                                        .xl2
                                        .make(),
                                    20.heightBox,
                                    Row(
                                      children: [
                                        Image.network(travelImageUrl)
                                            .wh(context.percentWidth * 35, 100)
                                            .cornerRadius(20.0),
                                        20.widthBox,
                                        VStack([
                                          "Tower Bridge".text.semiBold.make(),
                                          3.heightBox,
                                          "SouthWork".text.make().shimmer(),
                                          5.heightBox,
                                          [
                                            VxRating(
                                              size: 13,
                                              onRatingUpdate: null,
                                            ),
                                            5.widthBox,
                                            "(100)".text.xs.gray600.make()
                                          ].row()
                                        ]).expand()
                                      ],
                                    ).backgroundColor(Colors.grey[200]),
                                    20.heightBox,
                                    Row(
                                      children: [
                                        Image.network(travelImageUrl)
                                            .wh(context.percentWidth * 35, 100)
                                            .cornerRadius(20.0),
                                        20.widthBox,
                                        VStack([
                                          "Tower Bridge".text.semiBold.make(),
                                          3.heightBox,
                                          "SouthWork".text.make().shimmer(),
                                          5.heightBox,
                                          [
                                            VxRating(
                                              size: 13,
                                              onRatingUpdate: null,
                                            ),
                                            5.widthBox,
                                            "(100)".text.xs.gray600.make()
                                          ].row()
                                        ])
                                      ],
                                    ).backgroundColor(Colors.grey[200])
                                  ]).p16())
                              .toList(),
                        ).expand()
                      ],
                    ),
                  ).white.make())
              .expand(),
        ],
      ),
    );
  }
}
