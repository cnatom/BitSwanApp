>算是进大学后做的第一个完整的项目吧
>虽然有很多地方设计的不太好，但我会努力的！

# 赛题
## 1. 公司资料(100分)
- 背景
烛光文化工作室将公司的基本资料发给了你，希望你能将公司的业务内容、理念文化充分展现出来。
- 题目要求
本题你将使用文档“公司资料”，将全部内容展示出来。
你可以根据自己的喜好，或是参照其它优秀的公司官网进行排版设计，任意使用网图和图标，但切忌简单的罗列堆叠。

## 2. 轮播图（100分）
- 背景
烛光文化又发来几张实拍图，希望你做成轮播图，放在页面的重要位置，作为公司的风采展示。
- 题目要求
本题你将使用接口：[http://batswan.design:9000/get_pics](http://batswan.design:9000/get_pics) 开发轮播图。你可以任意设计轮播图的显示方式，让图片与文字内容完整、合理、美观得展示出来。
本题素材在“轮播图”文件夹中。如果接口的使用让你感到困惑，可以直接使用本地资源，但我们不推荐这样做。

## 3. 加入我们（150分）
- 背景
每一个优秀的公司都会不断吸纳人才，烛光文化也不例外。烛光希望你在页面底部位置增加“加入我们”模块，让同学们自主填写个人信息、投递简历。
- 题目要求
本题你将开发一组表单，让用户填写姓名、学院、年级、自我介绍、QQ/微信号，并使用接口[http://batswan.design:9000/join](http://batswan.design:9000/join)  将表单内容发送给服务端。
- 接口请求规则
  - 请求方式：	POST
  - 数据格式：	JSON
  - 参数5个：	 name（姓名），department（学院），qq（QQ/微信号），grade						（年级），description（自我介绍）
请注意，该接口为模拟接口，并不会对数据进行存储

## 4. 设备展示（150分）
- 背景
设备是烛光文化的核心，烛光希望你能将6套设备放在主要位置进行介绍。
- 题目要求
本题你将依据文件“设备展示”，使用合适的组件，将6个设备的图片与内容完整、美观得展示出来，且不占用过多的页面空间；使用诸如“隐藏-展开”、“抽屉”、“滑块”、“悬停”等的功能会使设备展示更加有序。

## 5. 设备租赁（250分）
- 背景
由于设备繁多，业务繁忙，烛光希望你能帮助他们在线上完成设备的租赁。
- 题目要求
  - 本题你将开发一组表单，让用户选择设备名称，填写数量、租赁起始日期、租赁结束日期，使用接口 [http://batswan.design:9000/check](http://batswan.design:9000/check) 检查设备是否有余量可以租用。本题可以配合第4题的界面设计。
  - 若设备没有余量，不能进行租赁，并向用户进行反馈；
  - 若设备有余量，则将接口返回的租金显示给用户，并复用之前的设备、数量和开始结束日期表单，让用户继续填写姓名、学号、学院、电话，使用接口 []()http://batswan.design:9000/apply 提交租赁申请。


- /check接口请求规则
  - 请求方式：	GET
  - 参数4个：	 equipment（设备），amount（数量），start（开始日期								yyyy-MM-dd），end（结束日期yyyy-MM-dd）
  - 请注意，该接口为模拟接口，返回信息中的租金固定为50元；所有产品均有余量。
  
- /apply接口请求规则：
  - 请求方式：	POST
  - 数据格式：	JSON
  - 参数8个：	equipment（设备），amount（数量），start（租赁开始日期yyyy-MM-dd），end（租赁结束日期yyyy-MM-dd） name（姓名），department（学院），id（学号），phone（电话）

## 6. 管理员界面（250分）
- 背景
烛光文化的工作人员们需要随时查看设备租赁申请和入职申请，当然，这些内容是公司的内部信息，不可以对外展示。
- 题目要求
  - 本题你将首先使用[http://batswan.design:9000/login](http://batswan.design:9000/login) 验证用户输入的口令。
  - 如果口令输入正确，则跳转到新的管理员页面。
在这里，你将使用接口[http://batswan.design:9000/join_show](http://batswan.design:9000/join_show) 和 [http://batswan.design:9000/apply_show](http://batswan.design:9000/apply_show) 两个接口展示所有的入职申请和租赁申请。“卡片”和“向下滚动”是很好的展示方式，当然你也可以有自己的设计创意。


### 接口请求规则
- /login 接口请求规则：
  - 请求方式：	GET
  - 参数1个：	password	（口令内容）
默认正确的口令为：2020CUMT 和 2020BatSwanStudio

# 作品展示
- Home页

![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L2doL2NuYXRvbS9pbWFnZXMvaW1hZ2VzL1FRMjAyMDA1MjQxNDI2NTAuZ2lm)

- 租赁页

![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L2doL2NuYXRvbS9pbWFnZXMvaW1hZ2VzLzIwMjAwNTI0MTQwMjU0LmdpZg)

- 公司资料页

![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L2doL2NuYXRvbS9pbWFnZXMvaW1hZ2VzLzIwMjAwNTI0MTQwODU0LmdpZg)

- 发现页

![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L2doL2NuYXRvbS9pbWFnZXMvaW1hZ2VzLzIwMjAwNTI0MTQyOTE2LmpwZw?x-oss-process=image/format,png)

- 管理员登录

![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L2doL2NuYXRvbS9pbWFnZXMvaW1hZ2VzLzIwMjAwNTI0MTQxNzI2LmdpZg)

- 申请页

![](https://imgconvert.csdnimg.cn/aHR0cHM6Ly9jZG4uanNkZWxpdnIubmV0L2doL2NuYXRvbS9pbWFnZXMvaW1hZ2VzLzIwMjAwNTI0MTQyMTMxLmdpZg)

# 源代码

- 仓库地址
[https://github.com/cnatom/ZhuGuang](https://github.com/cnatom/ZhuGuang)
## 代码说明
1. 公司资料：lib/about.dart 

2. 轮播图：lib/home.dart 
使用了flutter_swiper: 1.0.6 依赖组件
通过dio: 3.0.8 进行网络访问
3. 加入我们：lib/join.dart
通过dio进行post请求
使用了FLUI库的加载效果，在post成功后取消加载动画
4. 设备展示：lib/home.dart （放在了轮播图的下面）
使用了ExpansionTile抽屉组件
图片资源文件：images/xxx.png
5. 设备租赁：lib/lease.dart
使用了Offstage对下方表格进行临时隐藏
使用了showDatePicker打开一个时间选择器
通过dio进行post请求。
6. 管理员界面：lib/admin.dart 与 lib/admin_page.dart
使用了FLUI库的加载效果
在点击登录之后，会判断口令然后进行post操作。
登录后会由admin.dart跳转到admin_page.dart页面
admin_page.dart页面复用了主页的抽屉设计。
7. 有关网络请求：json解析出的dart类都位于model目录里面
由JsonToDart生成这些类。
