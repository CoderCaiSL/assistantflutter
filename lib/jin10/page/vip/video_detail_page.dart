// import 'package:flutter/material.dart';
// import 'package:video_player/video_player.dart';
//
// class VideoDetailPage extends StatefulWidget {
//   final String id;
//
//   const VideoDetailPage({Key key, this.id}) : super(key: key);
//
//   @override
//   VideoDetialPageState createState() => new VideoDetialPageState();
// }
//
// class VideoDetialPageState extends State<VideoDetailPage> {
//   VideoPlayerController _controller;
//   bool _isPlaying = false;
//   String url = 'https://jin10videoserver1.jin10.com/Act-ss-mp4-hd/9588d5f652ce472fb5fa5a4df6b76730/normal%20video-0622.mp4?auth_key=1624823199-f5faa5cc91aa4c599d9f76deeb3d1dd8-0-13eb9fd2886e4a905364b923181bf5a2';
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Video Demo',
//       home: new Scaffold(
//         body: new Center(
//           child: _controller.value.isInitialized
//           // 加载成功
//               ? new AspectRatio(
//             aspectRatio: _controller.value.aspectRatio,
//             child: VideoPlayer(_controller),
//           ) : new Container(),
//         ),
//         floatingActionButton: new FloatingActionButton(
//           onPressed: _controller.value.isPlaying
//               ? _controller.pause
//               : _controller.play,
//           child: new Icon(
//             _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
//           ),
//         ),
//       ),
//     );
//   }
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _controller = VideoPlayerController.network(this.url)
//     // 播放状态
//       ..addListener(() {
//         final bool isPlaying = _controller.value.isPlaying;
//         if (isPlaying != _isPlaying) {
//           setState(() { _isPlaying = isPlaying; });
//         }
//       })
//     // 在初始化完成后必须更新界面
//       ..initialize().then((_) {
//         setState(() {});
//       });
//   }
//
//   @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//   }
//
//   @override
//   void didUpdateWidget(VideoDetailPage oldWidget) {
//     // TODO: implement didUpdateWidget
//     super.didUpdateWidget(oldWidget);
//   }
//
//   @override
//   void didChangeDependencies() {
//     // TODO: implement didChangeDependencies
//     super.didChangeDependencies();
//   }
// }