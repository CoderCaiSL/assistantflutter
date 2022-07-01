import 'dart:core';

import 'package:common_utils/common_utils.dart';
import 'package:json_annotation/json_annotation.dart';

part 'jin10_news_data.g.dart';


@JsonSerializable()
class Jin10NewsData extends Object {


  @JsonKey(name: 'status')
  int status;

  @JsonKey(name: 'data')
  Data data;

  Jin10NewsData(this.status,this.data,);

  factory Jin10NewsData.fromJson(Map<String, dynamic> srcJson) => _$Jin10NewsDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Jin10NewsDataToJson(this);

}


@JsonSerializable()
class Data extends Object {

  @JsonKey(name: 'total')
  int total;

  @JsonKey(name: 'list')
  List<NewsItem> list;

  Data(this.total,this.list,);

  List<Hot_block> hot_block;

  List<Audio_block> audio_block;
  List<Categories> categories;

  List<Content_modules> content_modules;

  List<Exclusive_report> exclusive_report;
  List<Banners> banners;

  Hot_topics hot_topics;

  List<Slides> slides;
  List<NewsItem> listForHot;
  List<dynamic> top_articles;

  factory Data.fromJson(Map<String, dynamic> srcJson) => _$DataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$DataToJson(this);

}


@JsonSerializable()
class NewsItem extends Object {

  static final int TYPE_BLANK = 0;
  static final int TYPE_SINGLE_IMG = 1;
  static final int TYPE_MULTI_IMG = 2;

  //视频大图
  static final int TYPE_BIG_IMG = 3;
  static final int TYPE_VIDEO_NORMAL = 3;

  static final int TYPE_AUDIO = 4;

  static final int TYPE_NO_IMG = 5;
  //竖屏视频
  static final int TYPE_VIDEO_PORT = 6;
  //每日策略
  static final int TYPE_VIDEO_TWO = 7;
  static final int TYPE_AUDIO_HEAD = 8;
  //视频竖屏
  static final int TYPE_VIDEO_VER = 9;
  //视频横屏
  static final int TYPE_VIDEO_ACROSS = 10;
  static final int TYPE_TOP_TITLE = 11;
  //vip界面的小视频样式
  static final int TYPE_VIDEO_SMALL = 12;
  static final int TYPE_NEWS_AD = 13;

  @JsonKey(name: 'web_thumbs')
  List<String> webThumbs;

  @JsonKey(name: 'has_pdf')
  int hasPdf;

  @JsonKey(name: 'topic_ids')
  List<dynamic> topicIds;

  @JsonKey(name: 'audio_duration')
  int audioDuration;

  @JsonKey(name: 'bad')
  int bad;

  @JsonKey(name: 'source')
  String source;

  @JsonKey(name: 'type')
  String type;

  @JsonKey(name: 'title')
  String title;

  @JsonKey(name: 'good')
  int good;

  @JsonKey(name: 'source_url')
  String sourceUrl;

  @JsonKey(name: 'display_datetime')
  String displayDatetime;

  @JsonKey(name: 'id')
  int id;

  @JsonKey(name: 'category_ids')
  List<int> categoryIds;

  @JsonKey(name: 'vip')
  int vip;

  @JsonKey(name: 'mobile_thumbs')
  List<String> mobileThumbs;

  @JsonKey(name: 'introduction')
  String introduction;

  @JsonKey(name: 'reveal_tags')
  List<dynamic> revealTags;

  @JsonKey(name: 'offset')
  int offset;

  @JsonKey(name: 'original_article')
  int originalArticle;

  @JsonKey(name: 'elite_vip')
  int eliteVip;

  @JsonKey(name: 'comment_status')
  int commentStatus;

  @JsonKey(name: 'hits')
  int hits;

  @JsonKey(name: 'old_id')
  int oldId;

  @JsonKey(name: 'date_format')
  int dateFormat;

  @JsonKey(name: 'detail_url')
  String detailUrl;

  @JsonKey(name: 'periods')
  int periods;

  @JsonKey(name: 'video_duration')
  int videoDuration;
  int is_big;
  int itemType;
  int play_type;
  String web_redirect_url;


  int getItemType(){
    if (ObjectUtil.isNotEmpty(type)) {
      if (type == 'video') {
        return TYPE_BIG_IMG;
      }
      if (type == 'topic' && is_big == 1) {
        return TYPE_BIG_IMG;
      }
      if (type == 'news' || "flash" == type) {
        if (ObjectUtil.isEmpty(mobileThumbs) || ObjectUtil.isEmptyList(mobileThumbs)) {
          return TYPE_NO_IMG;
        }
        if (mobileThumbs.length == 1) {
          return TYPE_SINGLE_IMG;
        }
        return TYPE_MULTI_IMG;
      }
      if ('audio' == type) {
        if (play_type == 1) {
          return TYPE_AUDIO_HEAD;
        } else {
          return TYPE_AUDIO;
        }
      }
    }else{
      return TYPE_BLANK;
    }
  }


  NewsItem(this.webThumbs,this.hasPdf,this.topicIds,this.audioDuration,this.bad,this.source,this.type,this.title,this.good,this.sourceUrl,this.displayDatetime,this.id,this.categoryIds,this.vip,this.mobileThumbs,this.introduction,this.revealTags,this.offset,this.originalArticle,this.eliteVip,this.commentStatus,this.hits,this.oldId,this.dateFormat,this.detailUrl,this.periods,this.videoDuration,);

  factory NewsItem.fromJson(Map<String, dynamic> srcJson) => _$NewsItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsItemToJson(this);

}

@JsonSerializable()
class Banners extends Object {

  String img;

  int vip;

  String redirect_url;

  Banners(this.img,this.vip,this.redirect_url,);

  factory Banners.fromJson(Map<String, dynamic> srcJson) => _$BannersFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BannersToJson(this);

}

@JsonSerializable()
class Hot_topics extends Object {

  String title;

  String type;

  List<HotTopicsData> list;

  int total;

  int page;

  int page_size;

  int index;

  Hot_topics(this.title,this.type,this.list,this.total,this.page,this.page_size,this.index,);

  factory Hot_topics.fromJson(Map<String, dynamic> srcJson) => _$Hot_topicsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Hot_topicsToJson(this);

}

@JsonSerializable()
class Slides extends Object {

  int id;

  int nav_bar_id;

  String title;

  String source_type;

  int source_id;

  String cover_img;

  String tag;

  int show_vip_flag;

  int source_play_type;

  String icon_img;

  NewsExtra extra;

  Slides(this.id,this.nav_bar_id,this.title,this.source_type,this.source_id,this.cover_img,this.tag,this.show_vip_flag,this.source_play_type,this.icon_img,this.extra,);

  factory Slides.fromJson(Map<String, dynamic> srcJson) => _$SlidesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SlidesToJson(this);

}

@JsonSerializable()
class NewsExtra extends Object {

  int vip;

  int elite_vip;

  String display_datetime;

  NewsExtra(this.vip,this.elite_vip,this.display_datetime,);

  factory NewsExtra.fromJson(Map<String, dynamic> srcJson) => _$NewsExtraFromJson(srcJson);

  Map<String, dynamic> toJson() => _$NewsExtraToJson(this);

}


@JsonSerializable()
class HotTopicsData extends Object {

  var id;

  String title;

  String introduction;

  var nav_bar_id;

  String web_thumb;

  String mobile_thumb;

  var is_big;

  var is_hot;

  String web_subscription_thumb;

  String mobile_subscription_thumb;

  String web_bg_img;

  String mobile_bg_img;

  String web_nav_bg_img;

  String mobile_nav_bg_img;

  int show_vip_flag;

  String type;

  String web_redirect_url;

  var is_video;

  var sort;

  var category_sort;

  String latest_source_display_datetime;

  String display_datetime;

  String short_name;

  String category_name;

  List<dynamic> subscription_ids;

  HotTopicsData(this.id,this.title,this.introduction,this.nav_bar_id,this.web_thumb,this.mobile_thumb,this.is_big,this.is_hot,this.web_subscription_thumb,this.mobile_subscription_thumb,this.web_bg_img,this.mobile_bg_img,this.web_nav_bg_img,this.mobile_nav_bg_img,this.show_vip_flag,this.type,this.web_redirect_url,this.is_video,this.sort,this.category_sort,this.latest_source_display_datetime,this.display_datetime,this.short_name,this.category_name,this.subscription_ids,);

  factory HotTopicsData.fromJson(Map<String, dynamic> srcJson) => _$HotTopicsDataFromJson(srcJson);

  Map<String, dynamic> toJson() => _$HotTopicsDataToJson(this);

}


@JsonSerializable()
class Hot_block extends Object {

  String desc;

  String name;

  String type;

  String money;

  String img_url;

  String intro_url;

  int play_type;

  String bg_img_url;

  int category_id;

  String display_type;

  String introduction;

  String outside_bg_img;

  String dark_outside_bg_img;

  List<NewsItem> list;

  int total;

  Hot_block(this.desc,this.name,this.type,this.money,this.img_url,this.intro_url,this.play_type,this.bg_img_url,this.category_id,this.display_type,this.introduction,this.outside_bg_img,this.dark_outside_bg_img,this.list,this.total,);

  factory Hot_block.fromJson(Map<String, dynamic> srcJson) => _$Hot_blockFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Hot_blockToJson(this);

}

@JsonSerializable()
class Categories extends Object {

  String icon_img;

  String name;

  int date_format;

  int id;

  int p_id;

  List<Tags> tags;

  String type;

  int cid;

  String category_id;

  List<NewsItem> list;

  int total;

  List<int> subscription_ids;

  int play_type;

  int show_vip_flag;

  String bg_img;

  int hits;

  Categories(this.icon_img,this.name,this.date_format,this.id,this.p_id,this.tags,);

  factory Categories.fromJson(Map<String, dynamic> srcJson) => _$CategoriesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$CategoriesToJson(this);

}

@JsonSerializable()
class Tags extends Object {

  String name;

  int id;

  Tags(this.name,this.id,);

  factory Tags.fromJson(Map<String, dynamic> srcJson) => _$TagsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$TagsToJson(this);

}
@JsonSerializable()
class Audio_block extends Object {

  String desc;

  String name;

  String type;

  String money;

  String img_url;

  String bg_img_url;

  int category_id;

  String introduction;

  List<AudioItem> list;

  int total;

  Audio_block(this.desc,this.name,this.type,this.money,this.img_url,this.bg_img_url,this.category_id,this.introduction,this.list,this.total,);

  factory Audio_block.fromJson(Map<String, dynamic> srcJson) => _$Audio_blockFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Audio_blockToJson(this);

}

@JsonSerializable()
class AudioItem extends Object {

  List<String> web_thumbs;

  List<dynamic> topic_ids;

  int audio_duration;

  int bad;

  String type;

  String book_name;

  String title;

  int good;

  String display_datetime;

  int periods;

  int id;

  List<int> category_ids;

  List<Categories> categories;

  int vip;

  List<String> mobile_thumbs;

  String introduction;

  int offset;

  int original_article;

  String narrator_name;

  int elite_vip;

  int comment_status;

  int hits;

  int play_type;

  int date_format;

  String quarter;

  String detail_url;

  AudioItem(this.web_thumbs,this.topic_ids,this.audio_duration,this.bad,this.type,this.book_name,this.title,this.good,this.display_datetime,this.periods,this.id,this.category_ids,this.categories,this.vip,this.mobile_thumbs,this.introduction,this.offset,this.original_article,this.narrator_name,this.elite_vip,this.comment_status,this.hits,this.play_type,this.date_format,this.quarter,this.detail_url,);

  factory AudioItem.fromJson(Map<String, dynamic> srcJson) => _$AudioItemFromJson(srcJson);

  Map<String, dynamic> toJson() => _$AudioItemToJson(this);

}

@JsonSerializable()
class Content_modules extends Object {

  String mode;

  String type;

  Extra extra;

  String title;

  int page_size;

  int nav_bar_id;

  List<int> category_ids;

  String display_type;

  Content_modules(this.mode,this.type,this.extra,this.title,this.page_size,this.nav_bar_id,this.category_ids,this.display_type,);

  factory Content_modules.fromJson(Map<String, dynamic> srcJson) => _$Content_modulesFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Content_modulesToJson(this);

}

@JsonSerializable()
class Extra extends Object {

  List<Columns> columns;

  String bg_img_url;

  Extra(this.columns,this.bg_img_url,);

  factory Extra.fromJson(Map<String, dynamic> srcJson) => _$ExtraFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ExtraToJson(this);

}

@JsonSerializable()
class Columns extends Object {

  Btn btn;

  String type;

  String intro;

  String title;

  List<Subcolumns> subcolumns;

  List<int> category_ids;

  String icon_img_url;

  Columns(this.btn,this.type,this.intro,this.title,this.subcolumns,this.category_ids,this.icon_img_url,);

  factory Columns.fromJson(Map<String, dynamic> srcJson) => _$ColumnsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$ColumnsToJson(this);

}

@JsonSerializable()
class Btn extends Object {

  String title;

  String redirect_url;

  Btn(this.title,this.redirect_url,);

  factory Btn.fromJson(Map<String, dynamic> srcJson) => _$BtnFromJson(srcJson);

  Map<String, dynamic> toJson() => _$BtnToJson(this);

}

@JsonSerializable()
class Subcolumns extends Object {

  String type;

  String intro;

  String title;

  List<int> category_ids;

  String icon_img_url;

  Subcolumns(this.type,this.intro,this.title,this.category_ids,this.icon_img_url,);

  factory Subcolumns.fromJson(Map<String, dynamic> srcJson) => _$SubcolumnsFromJson(srcJson);

  Map<String, dynamic> toJson() => _$SubcolumnsToJson(this);

}


@JsonSerializable()
class Exclusive_report extends Object {

  String name;

  String type;

  String img_url;

  String icon_url;

  int category_id;

  String dark_img_url;

  String introduction;

  List<dynamic> subcategories;

  Exclusive_report(this.name,this.type,this.img_url,this.icon_url,this.category_id,this.dark_img_url,this.introduction,this.subcategories,);

  factory Exclusive_report.fromJson(Map<String, dynamic> srcJson) => _$Exclusive_reportFromJson(srcJson);

  Map<String, dynamic> toJson() => _$Exclusive_reportToJson(this);

}
