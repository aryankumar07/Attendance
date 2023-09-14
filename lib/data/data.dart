enum Type{
  theory,
  lab,
  tutorial,
}


class Data{

  Data({required this.className,
  required this.bunked,
  required this.attended,
  required this.type,
  });

  final String className;
  final int attended;
  final int bunked;
  final Type type;

}