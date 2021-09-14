class Country {
  var name;
  var language;
  var _animal;

  var color = "Red";

  static var city = "กรุงเทพ";

  Country(this.name, this.language);

  // Country.language(String name, String language) : this(name, language);

  String showLanguage() => this.language;

  void setAnimal(String animal) => this._animal = animal;

  String getAnimal() => this._animal;

  static void callHello() => print("สวัสดีครับ");

  void showPeople() {
    print("คนในประเทศ 70 ล้านคน");
  }
}
