// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'jin10_news_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Jin10NewsData _$Jin10NewsDataFromJson(Map<String, dynamic> json) =>
    Jin10NewsData(
      json['status'] as int,
      Data.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$Jin10NewsDataToJson(Jin10NewsData instance) =>
    <String, dynamic>{
      'status': instance.status,
      'data': instance.data,
    };

Data _$DataFromJson(Map<String, dynamic> json) => Data(
      json['total'] as int,
      (json['list'] as List<dynamic>)
          .map((e) => NewsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..hot_block = (json['hot_block'] as List<dynamic>)
          .map((e) => Hot_block.fromJson(e as Map<String, dynamic>))
          .toList()
      ..audio_block = (json['audio_block'] as List<dynamic>)
          .map((e) => Audio_block.fromJson(e as Map<String, dynamic>))
          .toList()
      ..categories = (json['categories'] as List<dynamic>)
          .map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList()
      ..content_modules = (json['content_modules'] as List<dynamic>)
          .map((e) => Content_modules.fromJson(e as Map<String, dynamic>))
          .toList()
      ..exclusive_report = (json['exclusive_report'] as List<dynamic>)
          .map((e) => Exclusive_report.fromJson(e as Map<String, dynamic>))
          .toList()
      ..banners = (json['banners'] as List<dynamic>)
          .map((e) => Banners.fromJson(e as Map<String, dynamic>))
          .toList()
      ..hot_topics =
          Hot_topics.fromJson(json['hot_topics'] as Map<String, dynamic>)
      ..slides = (json['slides'] as List<dynamic>)
          .map((e) => Slides.fromJson(e as Map<String, dynamic>))
          .toList()
      ..listForHot = (json['listForHot'] as List<dynamic>)
          .map((e) => NewsItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..top_articles = json['top_articles'] as List<dynamic>;

Map<String, dynamic> _$DataToJson(Data instance) => <String, dynamic>{
      'total': instance.total,
      'list': instance.list,
      'hot_block': instance.hot_block,
      'audio_block': instance.audio_block,
      'categories': instance.categories,
      'content_modules': instance.content_modules,
      'exclusive_report': instance.exclusive_report,
      'banners': instance.banners,
      'hot_topics': instance.hot_topics,
      'slides': instance.slides,
      'listForHot': instance.listForHot,
      'top_articles': instance.top_articles,
    };

NewsItem _$NewsItemFromJson(Map<String, dynamic> json) => NewsItem(
      (json['web_thumbs'] as List<dynamic>).map((e) => e as String).toList(),
      json['has_pdf'] as int,
      json['topic_ids'] as List<dynamic>,
      json['audio_duration'] as int,
      json['bad'] as int,
      json['source'] as String,
      json['type'] as String,
      json['title'] as String,
      json['good'] as int,
      json['source_url'] as String,
      json['display_datetime'] as String,
      json['id'] as int,
      (json['category_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['vip'] as int,
      (json['mobile_thumbs'] as List<dynamic>).map((e) => e as String).toList(),
      json['introduction'] as String,
      json['reveal_tags'] as List<dynamic>,
      json['offset'] as int,
      json['original_article'] as int,
      json['elite_vip'] as int,
      json['comment_status'] as int,
      json['hits'] as int,
      json['old_id'] as int,
      json['date_format'] as int,
      json['detail_url'] as String,
      json['periods'] as int,
      json['video_duration'] as int,
    )
      ..is_big = json['is_big'] as int
      ..itemType = json['itemType'] as int
      ..play_type = json['play_type'] as int
      ..web_redirect_url = json['web_redirect_url'] as String;

Map<String, dynamic> _$NewsItemToJson(NewsItem instance) => <String, dynamic>{
      'web_thumbs': instance.webThumbs,
      'has_pdf': instance.hasPdf,
      'topic_ids': instance.topicIds,
      'audio_duration': instance.audioDuration,
      'bad': instance.bad,
      'source': instance.source,
      'type': instance.type,
      'title': instance.title,
      'good': instance.good,
      'source_url': instance.sourceUrl,
      'display_datetime': instance.displayDatetime,
      'id': instance.id,
      'category_ids': instance.categoryIds,
      'vip': instance.vip,
      'mobile_thumbs': instance.mobileThumbs,
      'introduction': instance.introduction,
      'reveal_tags': instance.revealTags,
      'offset': instance.offset,
      'original_article': instance.originalArticle,
      'elite_vip': instance.eliteVip,
      'comment_status': instance.commentStatus,
      'hits': instance.hits,
      'old_id': instance.oldId,
      'date_format': instance.dateFormat,
      'detail_url': instance.detailUrl,
      'periods': instance.periods,
      'video_duration': instance.videoDuration,
      'is_big': instance.is_big,
      'itemType': instance.itemType,
      'play_type': instance.play_type,
      'web_redirect_url': instance.web_redirect_url,
    };

Banners _$BannersFromJson(Map<String, dynamic> json) => Banners(
      json['img'] as String,
      json['vip'] as int,
      json['redirect_url'] as String,
    );

Map<String, dynamic> _$BannersToJson(Banners instance) => <String, dynamic>{
      'img': instance.img,
      'vip': instance.vip,
      'redirect_url': instance.redirect_url,
    };

Hot_topics _$Hot_topicsFromJson(Map<String, dynamic> json) => Hot_topics(
      json['title'] as String,
      json['type'] as String,
      (json['list'] as List<dynamic>)
          .map((e) => HotTopicsData.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
      json['page'] as int,
      json['page_size'] as int,
      json['index'] as int,
    );

Map<String, dynamic> _$Hot_topicsToJson(Hot_topics instance) =>
    <String, dynamic>{
      'title': instance.title,
      'type': instance.type,
      'list': instance.list,
      'total': instance.total,
      'page': instance.page,
      'page_size': instance.page_size,
      'index': instance.index,
    };

Slides _$SlidesFromJson(Map<String, dynamic> json) => Slides(
      json['id'] as int,
      json['nav_bar_id'] as int,
      json['title'] as String,
      json['source_type'] as String,
      json['source_id'] as int,
      json['cover_img'] as String,
      json['tag'] as String,
      json['show_vip_flag'] as int,
      json['source_play_type'] as int,
      json['icon_img'] as String,
      NewsExtra.fromJson(json['extra'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SlidesToJson(Slides instance) => <String, dynamic>{
      'id': instance.id,
      'nav_bar_id': instance.nav_bar_id,
      'title': instance.title,
      'source_type': instance.source_type,
      'source_id': instance.source_id,
      'cover_img': instance.cover_img,
      'tag': instance.tag,
      'show_vip_flag': instance.show_vip_flag,
      'source_play_type': instance.source_play_type,
      'icon_img': instance.icon_img,
      'extra': instance.extra,
    };

NewsExtra _$NewsExtraFromJson(Map<String, dynamic> json) => NewsExtra(
      json['vip'] as int,
      json['elite_vip'] as int,
      json['display_datetime'] as String,
    );

Map<String, dynamic> _$NewsExtraToJson(NewsExtra instance) => <String, dynamic>{
      'vip': instance.vip,
      'elite_vip': instance.elite_vip,
      'display_datetime': instance.display_datetime,
    };

HotTopicsData _$HotTopicsDataFromJson(Map<String, dynamic> json) =>
    HotTopicsData(
      json['id'],
      json['title'] as String,
      json['introduction'] as String,
      json['nav_bar_id'],
      json['web_thumb'] as String,
      json['mobile_thumb'] as String,
      json['is_big'],
      json['is_hot'],
      json['web_subscription_thumb'] as String,
      json['mobile_subscription_thumb'] as String,
      json['web_bg_img'] as String,
      json['mobile_bg_img'] as String,
      json['web_nav_bg_img'] as String,
      json['mobile_nav_bg_img'] as String,
      json['show_vip_flag'] as int,
      json['type'] as String,
      json['web_redirect_url'] as String,
      json['is_video'],
      json['sort'],
      json['category_sort'],
      json['latest_source_display_datetime'] as String,
      json['display_datetime'] as String,
      json['short_name'] as String,
      json['category_name'] as String,
      json['subscription_ids'] as List<dynamic>,
    );

Map<String, dynamic> _$HotTopicsDataToJson(HotTopicsData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'introduction': instance.introduction,
      'nav_bar_id': instance.nav_bar_id,
      'web_thumb': instance.web_thumb,
      'mobile_thumb': instance.mobile_thumb,
      'is_big': instance.is_big,
      'is_hot': instance.is_hot,
      'web_subscription_thumb': instance.web_subscription_thumb,
      'mobile_subscription_thumb': instance.mobile_subscription_thumb,
      'web_bg_img': instance.web_bg_img,
      'mobile_bg_img': instance.mobile_bg_img,
      'web_nav_bg_img': instance.web_nav_bg_img,
      'mobile_nav_bg_img': instance.mobile_nav_bg_img,
      'show_vip_flag': instance.show_vip_flag,
      'type': instance.type,
      'web_redirect_url': instance.web_redirect_url,
      'is_video': instance.is_video,
      'sort': instance.sort,
      'category_sort': instance.category_sort,
      'latest_source_display_datetime': instance.latest_source_display_datetime,
      'display_datetime': instance.display_datetime,
      'short_name': instance.short_name,
      'category_name': instance.category_name,
      'subscription_ids': instance.subscription_ids,
    };

Hot_block _$Hot_blockFromJson(Map<String, dynamic> json) => Hot_block(
      json['desc'] as String,
      json['name'] as String,
      json['type'] as String,
      json['money'] as String,
      json['img_url'] as String,
      json['intro_url'] as String,
      json['play_type'] as int,
      json['bg_img_url'] as String,
      json['category_id'] as int,
      json['display_type'] as String,
      json['introduction'] as String,
      json['outside_bg_img'] as String,
      json['dark_outside_bg_img'] as String,
      (json['list'] as List<dynamic>)
          .map((e) => NewsItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
    );

Map<String, dynamic> _$Hot_blockToJson(Hot_block instance) => <String, dynamic>{
      'desc': instance.desc,
      'name': instance.name,
      'type': instance.type,
      'money': instance.money,
      'img_url': instance.img_url,
      'intro_url': instance.intro_url,
      'play_type': instance.play_type,
      'bg_img_url': instance.bg_img_url,
      'category_id': instance.category_id,
      'display_type': instance.display_type,
      'introduction': instance.introduction,
      'outside_bg_img': instance.outside_bg_img,
      'dark_outside_bg_img': instance.dark_outside_bg_img,
      'list': instance.list,
      'total': instance.total,
    };

Categories _$CategoriesFromJson(Map<String, dynamic> json) => Categories(
      json['icon_img'] as String,
      json['name'] as String,
      json['date_format'] as int,
      json['id'] as int,
      json['p_id'] as int,
      (json['tags'] as List<dynamic>)
          .map((e) => Tags.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..type = json['type'] as String
      ..cid = json['cid'] as int
      ..category_id = json['category_id'] as String
      ..list = (json['list'] as List<dynamic>)
          .map((e) => NewsItem.fromJson(e as Map<String, dynamic>))
          .toList()
      ..total = json['total'] as int
      ..subscription_ids = (json['subscription_ids'] as List<dynamic>)
          .map((e) => e as int)
          .toList()
      ..play_type = json['play_type'] as int
      ..show_vip_flag = json['show_vip_flag'] as int
      ..bg_img = json['bg_img'] as String
      ..hits = json['hits'] as int;

Map<String, dynamic> _$CategoriesToJson(Categories instance) =>
    <String, dynamic>{
      'icon_img': instance.icon_img,
      'name': instance.name,
      'date_format': instance.date_format,
      'id': instance.id,
      'p_id': instance.p_id,
      'tags': instance.tags,
      'type': instance.type,
      'cid': instance.cid,
      'category_id': instance.category_id,
      'list': instance.list,
      'total': instance.total,
      'subscription_ids': instance.subscription_ids,
      'play_type': instance.play_type,
      'show_vip_flag': instance.show_vip_flag,
      'bg_img': instance.bg_img,
      'hits': instance.hits,
    };

Tags _$TagsFromJson(Map<String, dynamic> json) => Tags(
      json['name'] as String,
      json['id'] as int,
    );

Map<String, dynamic> _$TagsToJson(Tags instance) => <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
    };

Audio_block _$Audio_blockFromJson(Map<String, dynamic> json) => Audio_block(
      json['desc'] as String,
      json['name'] as String,
      json['type'] as String,
      json['money'] as String,
      json['img_url'] as String,
      json['bg_img_url'] as String,
      json['category_id'] as int,
      json['introduction'] as String,
      (json['list'] as List<dynamic>)
          .map((e) => AudioItem.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['total'] as int,
    );

Map<String, dynamic> _$Audio_blockToJson(Audio_block instance) =>
    <String, dynamic>{
      'desc': instance.desc,
      'name': instance.name,
      'type': instance.type,
      'money': instance.money,
      'img_url': instance.img_url,
      'bg_img_url': instance.bg_img_url,
      'category_id': instance.category_id,
      'introduction': instance.introduction,
      'list': instance.list,
      'total': instance.total,
    };

AudioItem _$AudioItemFromJson(Map<String, dynamic> json) => AudioItem(
      (json['web_thumbs'] as List<dynamic>).map((e) => e as String).toList(),
      json['topic_ids'] as List<dynamic>,
      json['audio_duration'] as int,
      json['bad'] as int,
      json['type'] as String,
      json['book_name'] as String,
      json['title'] as String,
      json['good'] as int,
      json['display_datetime'] as String,
      json['periods'] as int,
      json['id'] as int,
      (json['category_ids'] as List<dynamic>).map((e) => e as int).toList(),
      (json['categories'] as List<dynamic>)
          .map((e) => Categories.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['vip'] as int,
      (json['mobile_thumbs'] as List<dynamic>).map((e) => e as String).toList(),
      json['introduction'] as String,
      json['offset'] as int,
      json['original_article'] as int,
      json['narrator_name'] as String,
      json['elite_vip'] as int,
      json['comment_status'] as int,
      json['hits'] as int,
      json['play_type'] as int,
      json['date_format'] as int,
      json['quarter'] as String,
      json['detail_url'] as String,
    );

Map<String, dynamic> _$AudioItemToJson(AudioItem instance) => <String, dynamic>{
      'web_thumbs': instance.web_thumbs,
      'topic_ids': instance.topic_ids,
      'audio_duration': instance.audio_duration,
      'bad': instance.bad,
      'type': instance.type,
      'book_name': instance.book_name,
      'title': instance.title,
      'good': instance.good,
      'display_datetime': instance.display_datetime,
      'periods': instance.periods,
      'id': instance.id,
      'category_ids': instance.category_ids,
      'categories': instance.categories,
      'vip': instance.vip,
      'mobile_thumbs': instance.mobile_thumbs,
      'introduction': instance.introduction,
      'offset': instance.offset,
      'original_article': instance.original_article,
      'narrator_name': instance.narrator_name,
      'elite_vip': instance.elite_vip,
      'comment_status': instance.comment_status,
      'hits': instance.hits,
      'play_type': instance.play_type,
      'date_format': instance.date_format,
      'quarter': instance.quarter,
      'detail_url': instance.detail_url,
    };

Content_modules _$Content_modulesFromJson(Map<String, dynamic> json) =>
    Content_modules(
      json['mode'] as String,
      json['type'] as String,
      Extra.fromJson(json['extra'] as Map<String, dynamic>),
      json['title'] as String,
      json['page_size'] as int,
      json['nav_bar_id'] as int,
      (json['category_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['display_type'] as String,
    );

Map<String, dynamic> _$Content_modulesToJson(Content_modules instance) =>
    <String, dynamic>{
      'mode': instance.mode,
      'type': instance.type,
      'extra': instance.extra,
      'title': instance.title,
      'page_size': instance.page_size,
      'nav_bar_id': instance.nav_bar_id,
      'category_ids': instance.category_ids,
      'display_type': instance.display_type,
    };

Extra _$ExtraFromJson(Map<String, dynamic> json) => Extra(
      (json['columns'] as List<dynamic>)
          .map((e) => Columns.fromJson(e as Map<String, dynamic>))
          .toList(),
      json['bg_img_url'] as String,
    );

Map<String, dynamic> _$ExtraToJson(Extra instance) => <String, dynamic>{
      'columns': instance.columns,
      'bg_img_url': instance.bg_img_url,
    };

Columns _$ColumnsFromJson(Map<String, dynamic> json) => Columns(
      Btn.fromJson(json['btn'] as Map<String, dynamic>),
      json['type'] as String,
      json['intro'] as String,
      json['title'] as String,
      (json['subcolumns'] as List<dynamic>)
          .map((e) => Subcolumns.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['category_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['icon_img_url'] as String,
    );

Map<String, dynamic> _$ColumnsToJson(Columns instance) => <String, dynamic>{
      'btn': instance.btn,
      'type': instance.type,
      'intro': instance.intro,
      'title': instance.title,
      'subcolumns': instance.subcolumns,
      'category_ids': instance.category_ids,
      'icon_img_url': instance.icon_img_url,
    };

Btn _$BtnFromJson(Map<String, dynamic> json) => Btn(
      json['title'] as String,
      json['redirect_url'] as String,
    );

Map<String, dynamic> _$BtnToJson(Btn instance) => <String, dynamic>{
      'title': instance.title,
      'redirect_url': instance.redirect_url,
    };

Subcolumns _$SubcolumnsFromJson(Map<String, dynamic> json) => Subcolumns(
      json['type'] as String,
      json['intro'] as String,
      json['title'] as String,
      (json['category_ids'] as List<dynamic>).map((e) => e as int).toList(),
      json['icon_img_url'] as String,
    );

Map<String, dynamic> _$SubcolumnsToJson(Subcolumns instance) =>
    <String, dynamic>{
      'type': instance.type,
      'intro': instance.intro,
      'title': instance.title,
      'category_ids': instance.category_ids,
      'icon_img_url': instance.icon_img_url,
    };

Exclusive_report _$Exclusive_reportFromJson(Map<String, dynamic> json) =>
    Exclusive_report(
      json['name'] as String,
      json['type'] as String,
      json['img_url'] as String,
      json['icon_url'] as String,
      json['category_id'] as int,
      json['dark_img_url'] as String,
      json['introduction'] as String,
      json['subcategories'] as List<dynamic>,
    );

Map<String, dynamic> _$Exclusive_reportToJson(Exclusive_report instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'img_url': instance.img_url,
      'icon_url': instance.icon_url,
      'category_id': instance.category_id,
      'dark_img_url': instance.dark_img_url,
      'introduction': instance.introduction,
      'subcategories': instance.subcategories,
    };
