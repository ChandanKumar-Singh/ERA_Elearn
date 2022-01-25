import 'package:era_elearn/screens/buy.dart';
import 'package:era_elearn/widgets/BottomBar.dart';
import 'package:era_elearn/widgets/commonText.dart';
import 'package:era_elearn/widgets/navigationWidgets.dart';
import 'package:flutter/material.dart';

class LatestCourseScreen extends StatefulWidget {
  const LatestCourseScreen({Key? key, required this.courseName})
      : super(key: key);
  final String courseName;

  @override
  _LatestCourseScreenState createState() => _LatestCourseScreenState();
}

class _LatestCourseScreenState extends State<LatestCourseScreen>
    with SingleTickerProviderStateMixin {
  TabController? _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
              height: h,
              width: w,
              child: Stack(
                children: [
                  Image.asset(
                    'assets/flutter_assets/assets/images/bg.png',
                    width: w,
                    fit: BoxFit.fitWidth,
                  ),
                  Positioned(
                      child: Container(
                    width: w,
                    height: h / 5.3,
                    color: Color(0x954336F0),
                  )),
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              child: Container(
                height: h * 0.72,
                width: w,
                decoration: const BoxDecoration(
                  color: Colors.white,
                ),
                child: ListView(
                  children: [
                    DefaultTabController(
                      length: 4,
                      child: Container(
                        color: Colors.black,
                        child: Column(
                          children: [
                            TabBar(
                              indicator: Decoration.lerp(
                                  BoxDecoration(color: Colors.blue[900]),
                                  BoxDecoration(color: Colors.red[500]),
                                  2),
                              labelStyle: const TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                              unselectedLabelColor: Colors.white,
                              labelColor: Colors.white,
                              controller: _tabController,
                              tabs: const [
                                Tab(
                                  text: 'Describe',
                                ),
                                Tab(
                                  text: 'Modules',
                                ),
                                Tab(
                                  text: 'Instructor',
                                ),
                                Tab(
                                  text: 'Review',
                                ),
                              ],
                              indicatorSize: TabBarIndicatorSize.tab,
                            ),
                            SizedBox(
                              height: h,
                              child: TabBarView(
                                controller: _tabController,
                                children: const [
                                  TabItem(),
                                  TabItem(),
                                  TabItem(),
                                  TabItem(),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                          size: 30,
                        ),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      CommonText(
                        text: widget.courseName,
                        color: Colors.white,
                        size: 25,
                        weight: FontWeight.bold,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 28.0),
                        child: RaisedButton(
                          color: Colors.deepPurpleAccent,
                          onPressed: () =>ChangeScreen(context, Buy()),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          child: const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: CommonText(
                              text: 'BUY',
                              color: Colors.white,
                              size: 27,
                              weight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),bottomNavigationBar: BottomBar(),
    );
  }
}

class TabItem extends StatefulWidget {
  const TabItem({Key? key}) : super(key: key);

  @override
  _TabItemState createState() => _TabItemState();
}

class _TabItemState extends State<TabItem> {
  String? tooltip;
  String dropDwon = '2';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 28.0, right: 15, top: 10),
        child: Wrap(
          children: [
            const CommonText(
              text: 'Why Choose Us',
              weight: FontWeight.bold,
              size: 20,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
                r'Have you ever tried to mix a purple color and then think to yourself: “ That doesn\'
                't look right !  Purple is one of those tricky colors in ..\n \n 1. Read the labels of your paints to find ones that contain few pigments. When trying to make purple paint, yellow or green pigments can be disastrous. For ...\n2. Test your red and blue paint for color bias by mixing them with white. When true red paint (without a yellow color bias) is mixed with white paint, it ...\n3. Choose paints that don\’t contain a yellow or green color bias. Red paint with a blue bias or blue paint with a red bias will work perfectly fine. Any time ...'),
            const SizedBox(
              height: 40,
            ),
            const CommonText(
              text: 'Our Mission and Vision',
              weight: FontWeight.bold,
              size: 20,
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
                r'Have you ever tried to mix a purple color and then think to yourself: “ That doesn\'
                't look right !  Purple is one of those tricky colors in ..\n Read the labels of your paints to find ones that contain few pigments. When trying to make purple paint, yellow or green pigments can be disastrous. For ...'),
            const SizedBox(
              height: 30,
            ),
            const CommonText(
              text: 'FAQ',
              weight: FontWeight.bold,
              size: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            Card(
              // shape: RoundedRectangleBorder(
              //     borderRadius: BorderRadius.circular(10)),
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        '1.Read the labels of your paints to find ones ',
                        style: TextStyle(fontSize: 15),
                      )),
                      PopupMenuButton(
                          initialValue: tooltip,
                          tooltip: tooltip,
                          onSelected: (value) => setState(() {
                                tooltip = value as String?;
                              }),
                          icon: Icon(Icons.keyboard_arrow_down_rounded),
                          itemBuilder: (context) {
                            return [
                              const PopupMenuItem(
                                value:
                                    '1.Read the labels of your paints to find ones ',
                                child: Text(
                                  '1.Read the labels of your paints to find ones ',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              const PopupMenuItem(
                                value:
                                    '1.Read the labels of your paints to find ones ',
                                child: Text(
                                  '1.Read the labels of your paints to find ones ',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                              const PopupMenuItem(
                                value:
                                    '1.Read the labels of your paints to find ones ',
                                child: Text(
                                  '1.Read the labels of your paints to find ones ',
                                  style: TextStyle(fontSize: 15),
                                ),
                              ),
                            ];
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        '2.Read the labels of your paints to find ones ',
                        style: TextStyle(fontSize: 15),
                      )),
                      DropdownButton(
                          value: dropDwon,
                          items: [
                            const DropdownMenuItem<String>(
                              value: '1',
                              child: Text('loca'),
                            ),
                            DropdownMenuItem<String>(
                              value: '2',
                              child: new Text('loc'),
                            ),
                            DropdownMenuItem<String>(
                              value: '3',
                              child: new Text('lo'),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              dropDwon = value!;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        '3.Read the labels of your paints to find ones ',
                        style: TextStyle(fontSize: 15),
                      )),
                      DropdownButton(
                          value: dropDwon,
                          items: [
                            const DropdownMenuItem<String>(
                              value: '1',
                              child: Text('loca'),
                            ),
                            DropdownMenuItem<String>(
                              value: '2',
                              child: new Text('loc'),
                            ),
                            DropdownMenuItem<String>(
                              value: '3',
                              child: new Text('lo'),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              dropDwon = value!;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
            Card(
              elevation: 10,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5)),
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 18.0),
                  child: Row(
                    children: [
                      const Expanded(
                          child: Text(
                        '4.Read the labels of your paints to find ones ',
                        style: TextStyle(fontSize: 15),
                      )),
                      DropdownButton(
                          value: dropDwon,
                          items: [
                            const DropdownMenuItem<String>(
                              value: '1',
                              child: Text('loca'),
                            ),
                            DropdownMenuItem<String>(
                              value: '2',
                              child: new Text('loc'),
                            ),
                            DropdownMenuItem<String>(
                              value: '3',
                              child: new Text('lo'),
                            ),
                          ],
                          onChanged: (String? value) {
                            setState(() {
                              dropDwon = value!;
                            });
                          }),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
