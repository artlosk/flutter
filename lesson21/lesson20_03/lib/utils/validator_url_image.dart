bool validateUrlImage(String value) {
  Pattern pattern = r'(http[s]?:\/\/.*\.(?:png|jpg))$';
  RegExp regex = RegExp(pattern.toString());
  return (!regex.hasMatch(value)) ? false : true;
}
