import 'dart:math';

import 'package:test_wai_kuai/Model/Model.dart';

class TaskTest {

  final String pre = "assets/TestImage/techFirm/";
  List<String> companyLogos =
  [
    "001-hp.png",
    "002-acer.png",
    "003-samsung.png",
    "004-t-mobile.png",
    "005-oppo.png",
    "006-asus.png",
    "007-one-plus.png",
    "008-gopro.png",
    "009-casio.png",
    "010-nokia.png",
    "011-zeiss.png",
    "012-huawei.png",
    "013-nikon.png",
    "014-beats.png",
    "015-jvc.png",
    "016-gigabyte.png",
    "017-seagate.png",
    "018-logitech.png",
    "019-nvidia.png",
    "020-cisco.png",
    "021-leica.png",
    "022-brother.png",
    "023-ibm.png",
    "024-dell.png",
    "025-htc.png",
    "026-att.png",
    "027-compaq.png",
    "028-lg.png",
    "029-sandisk.png",
    "030-xiaomi.png",
    "031-canon.png",
    "032-xerox.png",
    "033-lenovo.png",
    "034-zte.png",
    "035-vaio.png",
    "036-sharp.png",
    "037-sony.png",
    "038-packard-bell.png",
    "039-vivo.png",
    "040-android.png",
    "041-amd.png",
    "042-hitachi.png",
    "043-motorola.png",
    "044-epson.png",
    "045-verizon.png",
    "046-apple.png",
    "047-philips.png",
    "048-windows.png",
    "049-sap.png",
    "050-intel.png"
  ];

  List<String> jobs =
  [
    "项目工程测试",
    "在线讲师-数学",
    "在线讲师-语文",
    "在线讲师-物理",
    "在线讲师-化学",
    "项目策划",
    "数值策划",
    "销售咨询",
    "IOS前端项目",
    "LOGO设计",
    "ICON设计",
    "人力资源咨询",
    "编剧",
    "法务咨询",
    "英语翻译",
    "德语翻译",
    "法语翻译",
    "客服",
    "Android前端项目",
    "文案策划",
    "英语文案策划",
    "JAVA软件后台设计",
    "JAVA的GUI设计",
    "社会调查",
    "PYTHON爬虫工程",
    "FLUTTER前端工程",
    "人工智能算法设计",
    "数据集收集",
    "新媒体运营",
    "平面设计",
    "推广",
    "英语文献标注",
    "三维动画制作",
    "楼房设计"
  ];

  List<Task> get(int num) {
    List<Task> ret = new List<Task>();
    for(int i = 0; i < num; i++) {
      ret.add(getOne());
    }
    return ret;
  }

  Task getOne() {
    int a = Random.secure().nextInt(companyLogos.length-1);
    int b = Random.secure().nextInt(jobs.length-1);
    String A = companyLogos.removeAt(a);
    String B = jobs.removeAt(b);
    String companylogo = this.pre + A;
    String job = B;
    companyLogos.add(A);
    jobs.add(B);
    Task task = Task();
    task.logo = companylogo;
    task.name = job;
    PaymentType pt = PaymentType.Monthly;
    task.payment = new Payment();
    task.payment.type = pt;
    task.payment.lowerBound = Random.secure().nextInt(4000)+1000;
    task.payment.upperBound = task.payment.lowerBound + 500;
    return task;
  }

}