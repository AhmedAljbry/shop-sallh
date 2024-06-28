

abstract class AppSerachState {}
class AppSerachInitleState extends AppSerachState{}
class AppLodingSerachState extends AppSerachState{}
class AppSecsseusSerachState extends AppSerachState
{

}
class AppErroreSerachState extends AppSerachState{
  final String Erreor;
  AppErroreSerachState(this.Erreor);
}