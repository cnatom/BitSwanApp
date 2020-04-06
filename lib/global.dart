import 'model/carpic.dart';
import 'model/peopleInfo.dart';
import 'model/leaseCheck.dart';
import 'model/leaseApplyInfo.dart';
import 'model/login.dart';
class Global{
  static List<CarPic> photos = new List();//轮播图json数据

  static Map<String,String> peopleInfo = new Map();//学生信息输入
  static PeopleInfoResult peopleInfoResult = new PeopleInfoResult();//学生信息post结果
  //租赁信息输入
  static Map<String,String> leaseInfo = new Map();
  static LeaseInfoCheckResult leaseInfoCheckResult = new LeaseInfoCheckResult();
  static LeaseApplyResult leaseApplyResult = new LeaseApplyResult();
  //登录信息
  static LoginResult loginResult = new LoginResult();

}