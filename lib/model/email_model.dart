import 'package:flutter/widgets.dart';

import 'email.dart';

class EmailModel with ChangeNotifier {

  final List<Email> _emails = <Email>[
    Email("谷歌 表达", "15 minutes ago", "包装发货！", "Cucumber Mask Facial已发货！\ n \ n在此电子邮件中，您可以找到发票。\ n \ n您将在我们的运输合作伙伴的单独电子邮件中收到一个跟踪号。\ n \ n感谢您购买Phantom化妆品！", "avatar0.jpg", "me", true, false, false),
    Email("Ali 康纳斯", "25 minutes ago", "这个周末早午餐？", "I’ll be in your neighborhood doing errands on Saturday morning and wanted to ask if you would be up for having brunch at The Cake Facory?\n\nWould love to catch up with you!", "avatar1.jpg", "me", false, false, false),
    Email("桑德拉 亚当斯", "6 hrs ago", "Bonjour from Paris", "Here are some great shots from my trip to Paris this summer!", "avatar2.jpg", "Shawn, Melli, me", false, true, false),
    Email("特雷弗 Hansen", "12 hrs ago", "高中同学聚会？", "Hi friends, I was at the grocery store on Sunday night... when I ran into Genie Williams! I almost didn't recognize her after 20 years!\n\nAnyway, it turns out she is on the organizing committee for the high school reunion this fall. I don't know if you were planning on going or not, but she could definitely use our help in trying to track down lots of missing alums. If you can make it, we're doing a little phone-tree party at her place next Saturday, hoping that if we can find one person, a few more will emerge. What do you say? Want to see if Drew and Todd can make it too? \n\nTalk soon! Trevor", "avatar3.jpg", "me, Rachel, and Zach", false, false, true),
    Email("Britta 霍尔特", "18 hrs ago", "食谱尝试", "We should make this one day when we do a brunch again. Looks super nice!", "avatar4.jpg", "Shawn, Melli, me", true, true, false),
    Email("Julian Miller", "20 hrs ago", "在柏林与您会面！", "Hey there, how are you doing?", "avatar5.jpg", "Shawn, Melli, me", false, false, true),
    Email("Frederik Schweiger", "22 hrs ago", "回复重大案例研究", "Hey there, great news! Today I have finally published the source code for the Reply Material Design case study I have been working on over the last few weeks.\n\nYoucan find it on my GitHub account. Let me know what you think!\n\nCheers!", "avatar6.jpg", "me", false, false, false),
    Email("Dan Lightfoot", "1 day ago", "坐在伦敦的狗", "What's up? I wanted to reach out to you because I though that you may know a trusted dog sitting place in central London?\n\nI have an important meeting with Jay on Friday next week so I need someone who can take care of Jimmy...", "avatar7.jpg", "me", false, false, false),
  ];

  int _currentlySelectedEmailId = -1;

  List<Email> get emails => List<Email>.unmodifiable(_emails);

  void deleteEmail(int id) {
    _emails.removeAt(id);
    notifyListeners();
  }

  int get currentlySelectedEmailId => _currentlySelectedEmailId;

  set currentlySelectedEmailId(int value) {
    _currentlySelectedEmailId = value;
    notifyListeners();
  }

}
