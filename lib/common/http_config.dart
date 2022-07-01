class HttpConfig {

  //  测试域名 https://test.2030gewu.com/french/
  //  正式域名 https://api.2030gewu.com/french/
  static const String baseURL = "https://test.2030gewu.com/french/";


  /// 请求配置参数
  static const bool isFormat = true;
  static const int timeout = 30000;
  static const int pageSize = 10;

  /*
  约单
   */
  ///擦亮订单
  static const String reflashOrder = 'app/order/reflashOrder';
  ///取消订单
  static const String cancelOrder = 'app/order/cancelOrder';
  ///完成订单
  static const String completeOrder = 'app/order/completeOrder';
  ///订单付款
  static const String payOrder = 'app/order/payOrder';
  ///订单报名
  static const String orderApplyAdd = 'app/order-apply/add';
  ///订单报名取消
  static const String orderApplyCancelApply = 'app/order-apply/cancelApply';
  ///订单选定接单人
  static const String orderApplySelectUser = 'app/order-apply/selectUser';
  ///订单增加曝光
  static const String orderValueaddAdd = 'app/order-valueadd/add';
  ///订单举报
  static const String orderComplaintAdd = 'app/order-complaint/add';
  ///同意接单
  static const String orderApplyAgree = 'app/order-apply/agree';
  ///拒绝接单
  static const String orderApplyRefuse = 'app/order-apply/refuse';

  ///申请终止
  static const String orderTerminationAdd = 'app/order-termination/add';
  ///同意终止
  static const String orderTerminationAgree = 'app/order-termination/agree';
  ///撤销申请
  static const String orderTerminationCancel = 'app/order-termination/cancel';
  ///拒绝终止
  static const String orderTerminationRefuse = 'app/order-termination/refuse';
  ///订单异常理由列表
  static const String orderAbnormalReasonList = 'app/order-abnormal-reason/list';
  ///终止记录分页
  static const String orderTerminationPage = 'app/order-termination/page';
  ///终止详情
  static const String orderTerminationDetail = 'app/order-termination/detail';

  ///申请退款
  static const String orderRefundAdd = 'app/order-refund/add';
  ///同意退款
  static const String orderRefundAgree = 'app/order-refund/agree';
  ///撤销退款
  static const String orderRefundCancel = 'app/order-refund/cancel';
  ///拒绝退款
  static const String orderRefundRefuse = 'app/order-refund/refuse';
  ///退款详情
  static const String orderRefundDetail = 'app/order-refund/detail';




  ///退款协商留言
  static const String orderRefundConsultationAdd = 'app/order-refund-consultation/add';
  ///退款协商历史
  static const String orderRefundConsultationPage = 'app/order-refund-consultation/page';

  /*
  发布
   */
  ///发布游戏订单
  static const String orderAddGameOrder = 'app/order/addGameOrder';
  ///发布约会订单
  static const String orderAddAppointmentOrder = 'app/order/addAppointmentOrder';



  /*
  社区
   */

  ///评论列表
  static const String postComment = 'app/post-comment/page';
  ///发布评论
  static const String postCommentAdd = 'app/post-comment/add';
  ///回复评论
  static const String postCommentAddReply = 'app/post-comment/addReply';
  ///删除评论
  static const String postCommentDelete = 'app/post-comment/delete';

  ///动态或评论点赞
  static const String postLikeAdd = 'app/post-like/add';
  ///动态或评论取消点赞
  static const String postLikeDelete = 'app/post-like/delete';

  ///收藏
  static const String postFavoritesAdd = 'app/post-favorites/add';
  ///取消收藏
  static const String postFavoritesDelete = 'app/post-favorites/delete';

  ///关注用户
  static const String userFollowAdd = 'app/user-follow/add';
  ///取消关注
  static const String userFollowDelete = 'app/user-follow/delete';

  ///新增
  static const String postAdd = 'app/post/add';
  ///删除
  static const String postDelete = 'app/post/delete';
  ///举报动态
  static const String postComplaintAdd = 'app/post-complaint/add';
  ///列表
  static const String giftList = 'app/gift/list';


  /*
  消息
   */
  ///相关推送列表
  static const String aboutNotifOrder = 'app/information/listPushOrder';
  ///聊天对象用户信息
  static const String userChatDetailUser = 'app/user-chat/detailUser';
  ///发布聊天约会订单(聊天界面下单)
  static const String orderAddChatAppointmentOrder = 'app/order/addChatAppointmentOrder';
  ///发布聊天游戏订单(聊天界面下单)
  static const String orderAddChatGameOrder = 'app/order/addChatGameOrder';
  ///超级喜欢价格
  static const String giftGetLikeAmount = 'app/gift/getLikeAmount';
  ///购买超级喜欢(聊天页面)
  static const String userChatBuyLikeCount = 'app/user-chat/buyLikeCount';

  /*
  我的
   */
  ///注册
  static const String userInfoRegister = 'app/user-info/register';
  ///微信登录绑定账号
  static const String userInfoLoginByWx = 'app/user-info/loginByWx';
  ///苹果登录绑定账号
  static const String userInfoLoginByApple = 'app/user-info/loginByApple';
  ///微信登录绑定账号解绑
  static const String userInfoUnbindWx = 'app/user-info/unbindWx';

  ///获取用户信息
  static const String userInfoDetail = 'app/user-info/detail';
  ///我的订单列表
  static const String pageUserOrder = 'app/order/pageUserOrder';
  ///修改资料
  static const String userInfoUpdate = 'app/user-info/update';
  ///修改密码，修改支付密码
  static const String userInfoUpdatePassword = 'app/user-info/updatePassword';
  ///忘记密码，忘记支付密码
  static const String updateForgetPassword = 'app/user-info/updateForgetPassword';
  ///发送短信验证码
  static const String smsSendSms = 'app/sms/sendSms';
  ///短信验证码校验
  static const String smsverifySmsCode = 'app/sms/verifySmsCode';
  ///用户星座运程
  static const String userInfoDetailAstro = 'app/user-info/detailAstro';
  /// 用户搜索
  static const String userInfoQuery = 'app/user-info/query';
  ///保存不喜欢用户记录
  static const String userMatchingAddUnlike = 'app/user-matching/addUnlike';
  ///用户任务列表
  static const String userInfoListDailyTask = 'app/user-info/listDailyTask';

  ///系统充值配置列表
  static const String sysListTop = 'app/sys/listTop';

  ///系统VIP充值配置列表
  static const String sysListTopVip = 'app/sys/listTopVip';

  ///我的钱包详情(充值/收益)
  static const String walletDetail = 'app/wallet/detail';

  ///个人中心 - 我的账单列表
  static const String walletBillPage = 'app/wallet-bill/page';

  ///动态视频投币
  static const String walletBillPostCoin = 'app/wallet-bill/postCoin';

  ///送礼
  static const String walletBillSendGift = 'app/wallet-bill/sendGift';

  ///钱包金币充值(创建充值订单)
  static const String walletBillTopUp = 'app/wallet-bill/topUp';

  ///充值回调接口(支付成功充值业务处理)
  static const String walletBillTopUpCallback = 'app/wallet-bill/topUpCallback';

  ///会员充值(创建会员充值订单)
  static const String walletBillTopUpVip = 'app/wallet-bill/topUpVip';

  ///充值VIP回调接口(支付成功充值业务处理)
  static const String walletBillTopUpVipCallback = 'app/wallet-bill/topUpVipCallback';

  ///提现
  static const String walletBillWithdraw = 'app/wallet-bill/withdraw';

  ///反馈内容
  static const String userFeedbackAdd = 'app/user-feedback/add';

  ///保存访客记录
  static const String userVisitorAdd = 'app/user-visitor/add';
  ///访客记录列表
  static const String userVisitorPage = 'app/user-visitor/page';

  ///修改设置
  static const String userInfoUpdateSettings = 'app/user-info/updateSettings';

  ///实名认证
  static const String userAuthenticationOcridcard = 'app/user-authentication/ocridcard';
  ///人脸认证
  static const String userAuthenticationFaceDetect = 'app/user-authentication/faceDetect';
  ///获取 bizToken
  static const String userAuthenticationGetBizToken = 'app/user-authentication/getBizToken';
  ///验证
  static const String userAuthenticationVerify = 'app/user-authentication/verify';
  ///微信统一下单(获取 预支付交易会话标识)
  static const String wxPayUnifiedOrder = 'wxPay/unifiedOrder';

  ///国家列表
  static const String dataListCountry = 'app/data/listCountry';
  ///国家 州/城市 列表
  static const String dataListCity = 'app/data/listCity';



  /*
  通用
   */

  /*
  *获取系统配置
  * ORDER_VALUE_ADD_FEE 这是曝光的金额的配置
  * ORDER_APPOINTMENT_SERVICE_FEE 这是约会订单服务费用的配置（非会员的）
   */
  static const String sysGetConfigValue = 'app/sys/getConfigValue';
  ///系统配置列表
  static const String sysListConfig = 'app/sys/listConfig';
  ///游戏列表
  static const String sysListGame = 'app/sys/listGame';
  ///游戏段位列表
  static const String sysListGameDan = 'app/sys/listGameDan';
  ///游戏大区列表
  static const String sysListGameZone = 'app/sys/listGameZone';
  ///影音娱乐列表
  static const String dataListHobby = 'app/data/listHobby';
  ///性格列表
  static const String dataListPersonality = 'app/data/listPersonality';
}