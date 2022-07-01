import 'package:flutter/material.dart';

class TabIconData {
  TabIconData({
    this.imagePath = '',
    this.index = 0,
    this.selectedImagePath = '',
    this.isSelected = false,
    this.animationController,
    this.title = '',
  });

  String imagePath;
  String selectedImagePath;
  bool isSelected;
  int index;
  String title;

  AnimationController animationController;

  static List<TabIconData> healthTabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/fitness_app/tab_1.png',
      selectedImagePath: 'assets/fitness_app/tab_1s.png',
      index: 0,
      isSelected: true,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/tab_2.png',
      selectedImagePath: 'assets/fitness_app/tab_2s.png',
      index: 1,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/tab_3.png',
      selectedImagePath: 'assets/fitness_app/tab_3s.png',
      index: 2,
      isSelected: false,
      animationController: null,
    ),
    TabIconData(
      imagePath: 'assets/fitness_app/tab_4.png',
      selectedImagePath: 'assets/fitness_app/tab_4s.png',
      index: 3,
      isSelected: false,
      animationController: null,
    ),
  ];

  static List<TabIconData> assistantflutterTabIconsList = <TabIconData>[
    TabIconData(
      imagePath: 'assets/assistantflutter/tab_1.png',
      selectedImagePath: 'assets/assistantflutter/tab_1s.png',
      index: 0,
      isSelected: true,
      animationController: null,
      title: '社区',
    ),
    TabIconData(
      imagePath: 'assets/assistantflutter/tab_2.png',
      selectedImagePath: 'assets/assistantflutter/tab_2s.png',
      index: 1,
      isSelected: false,
      animationController: null,
      title:'旅程',
    ),
    TabIconData(
      imagePath: 'assets/assistantflutter/tab_3.png',
      selectedImagePath: 'assets/assistantflutter/tab_3s.png',
      index: 2,
      isSelected: false,
      animationController: null,
      title: '计划',
    ),
    TabIconData(
      imagePath: 'assets/assistantflutter/tab_4.png',
      selectedImagePath: 'assets/assistantflutter/tab_4s.png',
      index: 3,
      isSelected: false,
      animationController: null,
      title: '我的',
    ),
  ];
}
