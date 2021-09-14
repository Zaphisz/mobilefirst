import 'city.dart';

void main() {
  City item = City("น่าน");
  print(item.city);
  print(item.color);
  print(item.name);
  print(item.language);

  item.callSuper();
  item.showPeople();
  item.showProblem();
}




//  var item = new Country.language("Thailand", "Thai");
//   print("ประเทศ :" + item.name);
//   print("ภาษาหลัก :" + item.showLanguage());
//   item.setAnimal("ช้าง");
//   print("สัตว์ประจำชาติ :" + item.getAnimal());
//   print("เมืองหลวง :" + Country.city);

//   Country.callHello();
