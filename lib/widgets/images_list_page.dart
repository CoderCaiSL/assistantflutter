import 'package:flutter/material.dart';
import 'package:photo_view/photo_view_gallery.dart';

import '../jin10/widget/common_appbar.dart';

class ImageListPage extends StatefulWidget {
  ///图片Lst
  final List<String> imageList;

  ///初始展示页数。默认0
  int initialPage;

  ///选中的页的点的颜色
  Color checkedColor;

  ///未选中的页的点的颜色
  Color uncheckedColor;

  ImageListPage(this.imageList,
      {this.initialPage = 0,
        this.checkedColor = Colors.white,
        this.uncheckedColor = Colors.grey});

  @override
  ImageListPageState createState() => new ImageListPageState();
}

class ImageListPageState extends State<ImageListPage> {

  PageController pageController;
  int nowPosition;
  int initialPage = 0;
  List<Widget> dotWidgets;

  @override
  Widget build(BuildContext context) {
    initialPage = widget.initialPage;
    return new Scaffold(
      appBar: CommonAppBar(title: '图片查看',),
      body: GestureDetector(
        onTap: () => Navigator.of(context).pop(),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: <Widget>[
            PhotoViewGallery.builder(
              onPageChanged: (index) {
                setState(() {
                  nowPosition = index;
                  _initData();
                });
              },
              scrollPhysics: const BouncingScrollPhysics(),
              builder: (BuildContext context, int index) {
                return PhotoViewGalleryPageOptions(
                  imageProvider: NetworkImage(widget.imageList[index]),
                );
              },
              itemCount: widget.imageList.length,
              pageController: pageController,
            ),
            Container(
              margin: EdgeInsets.only(bottom: 10),
              child: Wrap(
                children: dotWidgets,
              ),
            ),
          ],
        ),
      ),
    );
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    nowPosition = initialPage;
    pageController = PageController(initialPage: initialPage);
    _initData();
  }

  void _initData() {
    dotWidgets = [];
    if (widget.imageList.length > 1) {
      for (int i = 0; i < widget.imageList.length; i++) {
        dotWidgets.add(_buildDots(i));
      }
    }
  }
  Widget _buildDots(int index) => Container(
    margin: EdgeInsets.all(5),
    child: ClipOval(
      child: Container(
        color: index == nowPosition
            ? widget.checkedColor
            : widget.uncheckedColor,
        width: 5.0,
        height: 5.0,
      ),
    ),
  );

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    pageController.dispose();
  }

  @override
  void didUpdateWidget(ImageListPage oldWidget) {
    // TODO: implement didUpdateWidget
    super.didUpdateWidget(oldWidget);
  }

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }
}