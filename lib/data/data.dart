enum Type{
  theory,
  lab,
  tutorial,
}


class Data{

  Data({
  required this.className,
  required this.attended,
  required this.bunked,
  required this.type,
  });

  final String className;
  final int attended;
  final int bunked;
  final Type type;

  int get calculatedPercentage{
    if(attended+bunked == 0){
      return 0;
    }else{
      return (((attended)/(attended+bunked))*100).round();
    }
  }

}