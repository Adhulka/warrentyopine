

extension StringExtensions on String? {

  // String capitalize() {
  //   if (this.isEmpty) return this;
  //   return this[0].toUpperCase() + this.substring(1);
  // }
  bool isNullOrEmpty() {

    return this==null || this!.isEmpty;
  }

  String setIfNullEmpty() {
    return this==null?"":this!;
  }

}
extension IntExtensions on int? {

  bool isNullOrZero() {
    return this==null || this==0;
  }
  bool isGreaterThanZero() {
    return this!=null && this!>0;
  }
  String setIfNullEmpty() {
    return this==null?"":toString();
  }

}
extension DoubleExtensions on double? {

  bool isNullOrZero() {
    return this==null || this==0 || this==0.0;
  }
  bool isGreaterThanZero() {
    return this!=null && this!>0;
  }

}
