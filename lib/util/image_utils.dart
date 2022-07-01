
import 'package:common_utils/common_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ImageUtils {

  /// 占位头像
  // static const user_header = 'assets/images/user_header.png';
  /// 空数据占位图
  // static const empty_data = 'assets/images/empty_data.png';
  /// 显示图片展位图
  static const top_head_empty = 'assets/images/mine/ic_bg.png';
  static const image_empty = 'assets/images/empty_img.png';
  static const video_empty = 'assets/images/empty_video.png';


  static ImageProvider getAssetImage(String name, {ImageFormat format = ImageFormat.png}) {
    return AssetImage(getImgPath(name, format: format));
  }

  static String getImgPath(String name, {ImageFormat format = ImageFormat.png}) {
    return 'assets/$name.${format.value}';
  }

  static ImageProvider getImageProvider(String imageUrl, {String holderImg = 'none'}) {
    if (TextUtil.isEmpty(imageUrl)) {
      return AssetImage(getImgPath(holderImg));
    }
    return CachedNetworkImageProvider(imageUrl);
  }
}

enum ImageFormat {
  png,
  jpg,
  gif,
  webp
}

extension ImageFormatExtension on ImageFormat {
  String get value => ['png', 'jpg', 'gif', 'webp'][index];
}
