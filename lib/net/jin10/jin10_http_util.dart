import 'dart:collection';
import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:assistantflutter/model/bean/jin10/calendar_data.dart';
import 'package:assistantflutter/model/bean/jin10/jin10_flash_data.dart';
import 'package:assistantflutter/model/bean/jin10/jin10_news_data.dart';
import 'package:assistantflutter/model/bean/jin10/market_data.dart';
import 'package:assistantflutter/model/bean/jin10/nav_tab_data.dart';
import 'package:assistantflutter/model/bean/jin10/news_detail_data.dart';
import 'package:assistantflutter/model/bean/jin10/news_vip_tab_data.dart';
import 'package:common_utils/common_utils.dart';
import 'package:dio/dio.dart';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

import '../dio_log_interceptor.dart';

class Jin10HttpUtil{

  Options baseOptions = Options(headers: {HttpHeaders.acceptHeader:"accept: application/json"});
  Options changeOp = Options(headers: {HttpHeaders.acceptHeader:"accept: application/json"});
  factory Jin10HttpUtil() =>_sharedInstance();
  static Jin10HttpUtil _instance;
  Dio _dio;
  MarketData _marketData;
  List<String> marketCates = List();
  List<MarketRootData> _marketRootDataList = List();
  List<MarketRootData> get marketRootDataList => _marketRootDataList;

  // 私有构造函数
  Jin10HttpUtil._() {
    // 具体初始化代码
    baseOptions.headers['User-Agent'] = "Jin10 Android Client(v 5.1.0)";
    baseOptions.headers['Connection'] = "close";
    baseOptions.headers['x-version'] = "1.0.0";
    baseOptions.headers['x-app-id'] = "g93rhHb9DcDptyPb";
    baseOptions.headers['x-udid'] = "fed9487668184bc29002d6437cf3d163";
    baseOptions.headers['x-token'] = "";
    baseOptions.headers['x-app-ver'] = "android_base_5.1.0.445";

    changeOp.headers['User-Agent'] = "Jin10 Android Client(v 5.1.0)";
    changeOp.headers['Connection'] = "close";
    changeOp.headers['x-version'] = "1.0.1";
    changeOp.headers['x-app-id'] = "g93rhHb9DcDptyPb";
    changeOp.headers['x-udid'] = "fed9487668184bc29002d6437cf3d163";
    changeOp.headers['x-token'] = "";
    changeOp.headers['x-app-ver'] = "android_base_5.1.0.445";

    _dio = Dio();
    _dio.interceptors.add(DioLogInterceptor());
  }
  // 静态、同步、私有访问点
  static Jin10HttpUtil _sharedInstance() {
    if (_instance == null) {
      _instance = Jin10HttpUtil._();
    }
    return _instance;
  }
  Future<List<FlashItem>> getFlashList(int id) async {
    Response response = await _dio
        .get("https://flash-api.jin10.com/get_flash_list",
        queryParameters: {
          "channel": id,
          "vip": 1,
        },
      options: baseOptions,
    );
    Jin10FlashData data = new Jin10FlashData.fromJson(response.data);
    return data.data;
  }
  Future<List<FlashItem>> getFlashListMore(int id,String max_time) async {
    Response response = await _dio
        .get("https://flash-api.jin10.com/get_flash_list",
        queryParameters: {
          "channel": id,
          "vip": 1,
          "max_time": max_time,
        },
      options: baseOptions,
    );
    Jin10FlashData data = new Jin10FlashData.fromJson(response.data);
    return data.data;
  }

  Future<FlashTabData> getFlashTabList()async{
    Response response = await _dio
        .get("https://flash-api.jin10.com/get_channel_list",
      options: baseOptions,
    );
    FlashTabData data = new FlashTabData.fromJson(response.data);
    return data;
  }

  ///视频详情
  Future<NewsDetailData> getDetailNews(String type,String id)async{
    changeOp.headers['x-version'] = "1.0.1";
    Response response = await _dio
        .get("https://reference-api.jin10.com/reference/getOne",
      queryParameters: {
        "type": type,
        "id":id,
      },
      options: changeOp,
    );
    NewsDetailData data = new NewsDetailData.fromJson(response.data);
    return data;
  }

  ///参考type:app、app_vip
  Future<NewsVipTabData> getNewsOrVipTabList(String type)async{
    changeOp.headers['x-version'] = "1.0.1";
    Response response = await _dio
        .get("https://reference-api.jin10.com/navBar",
      queryParameters: {
        "type": type,
      },
      options: changeOp,
    );
    NewsVipTabData data = new NewsVipTabData.fromJson(response.data);
    return data;
  }

  Future<Jin10NewsData> getNewsList(int id,int pageNumber) async {
    changeOp.headers['x-version'] = "1.0.1";
    Response response = await _dio
        .get("https://reference-api.jin10.com/reference",
      queryParameters: {
        "nav_bar_id": id,
        "page": pageNumber,
        "page_size": 20,
      },
      options: changeOp,
    );
    Jin10NewsData data = new Jin10NewsData.fromJson(response.data);
    return data;
  }

  Future<CalendarData> getCalenderEventList(String start_date,String end_dat) async {
    changeOp.headers['x-version'] = "2.0";
    Response response = await _dio
        .get("https://rili-open-api.jin10.com/get/event",
      queryParameters: {
        "start_date": start_date,
        "end_date": end_dat,
        "category": 'cj',
      },
      options: changeOp,
    );
    CalendarData data = new CalendarData.fromJson(response.data);
    return data;
  }
  Future<CalendarData> getCalenderHolidayList(String start_date,String end_dat) async {
    changeOp.headers['x-version'] = "2.0";
    Response response = await _dio
        .get("https://rili-open-api.jin10.com/get/holiday",
      queryParameters: {
        "start_date": start_date,
        "end_date": end_dat,
        "category": 'cj',
      },
      options: changeOp,
    );
    CalendarData data = new CalendarData.fromJson(response.data);
    return data;
  }
  Future<CalendarData> getCalenderList(String start_date,String end_dat) async {
    changeOp.headers['x-version'] = "2.0";
    Response response = await _dio
        .get("https://rili-open-api.jin10.com/get/data",
      queryParameters: {
        "start_date": start_date,
        "end_date": end_dat,
        "category": 'cj',
      },
      options: changeOp,
    );
    CalendarData data = new CalendarData.fromJson(response.data);
    return data;
  }

  Future<String> get _localPath async {
    final directory = await getApplicationDocumentsDirectory();
    return directory.path;
  }
  Future<File> get _localFile async {
    final path = await _localPath;
    return File('$path/symbolist_new.txt');
  }

  Future<File> writeCounter(int counter) async {
    final file = await _localFile;
    return file.writeAsString('$counter');
  }

  Future getAllMarketListNet() async {
    Map<String, String> headers = new HashMap();
    headers.putIfAbsent('Content-Type', () => 'application/json');
    var url = Uri.parse('https://app-server.jin10.com/symbolist_new.txt');
    http.Response response = await http.get(
      url,
      headers: headers,
    );
    var dir = await getApplicationDocumentsDirectory();
    String path = dir.path + '/';
    String fn = 'symbolist_new.txt';
    File file = File(path+fn);
    await file.writeAsBytes(GZipCodec().decode(response.bodyBytes));
    String text;
    text = await file.readAsString();
    MarketData marketData = MarketData.fromJson(convert.jsonDecode(text));
    _marketData = marketData;
    for(All_type tmp in _marketData.all_type){
      if(!marketCates.contains(tmp.name)){
        marketCates.add(tmp.name);
        List<MarketCateItem> marketCateItems = List();
        for(Exchange ex in tmp.list){
          MarketCateItem marketCateItem = MarketCateItem();
          marketCateItem.cate = ex.showname;
          marketCateItem.subItems = getDetailItems(ex.exchange,_marketData.all_stock);
          marketCateItems.add(marketCateItem);
        }
        List<MarketDetailItem> recommendList = List();
        for(String tmpStr in tmp.recommand){
          for(MarketCateItem marketCateItem in marketCateItems){
            for (MarketDetailItem item in marketCateItem.subItems) {
              String text = '${item.code}.${item.exchange}';
              if(tmpStr == text){
                recommendList.add(item);
              }
            }
          }
        }
        MarketRootData marketRootData = MarketRootData();
        marketRootData.cateName = tmp.name;
          marketRootData.commends = recommendList;
        marketRootData.cates = marketCateItems;
        _marketRootDataList.add(marketRootData);
      }
    }
    print(marketCates.toString());
    return marketData;
  }

  List<MarketDetailItem> getDetailItems(List<String> symbols, List<All_stock> stockItems){
    if(ObjectUtil.isEmpty(stockItems)){
      return List();
    }
    if(ObjectUtil.isEmptyList(stockItems)){
      return List();
    }
    List<MarketDetailItem> ret = List();
    for(All_stock all_stock in stockItems){
      if(symbols.contains(all_stock.exchange+"-"+all_stock.ntype)){
        MarketDetailItem detailItem = new MarketDetailItem(all_stock.cn, all_stock.code, all_stock.exchange, all_stock.decimal);
        ret.add(detailItem);
      }
    }
    return ret;
  }



  Future getAllMarketList() async {
    if (ObjectUtil.isEmpty(_marketData)) {
      return await getAllMarketListNet();
    } else {
      return _marketData;
    }
  }

}