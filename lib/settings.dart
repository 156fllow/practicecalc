class settings{
  static final settings _settings = new settings._internal();

  int mode = 1;
  int first_term = 1;
  int second_term = 1;
  factory settings(){
    return _settings;
  }
  settings._internal();
}
final Settings = settings();