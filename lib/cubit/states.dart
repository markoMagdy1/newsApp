abstract class AppStates {}
class AppInitialState extends AppStates{}

class AppChangeBottomNavBar extends AppStates{}

class AppLoadingBusinessNewsState extends AppStates{}
class AppSucceededBusinessNewsState extends AppStates{}
class AppErrorBusinessNewsState extends AppStates{}

class AppLoadingSportsNewsState extends AppStates{}
class AppSucceededSportsNewsState extends AppStates{}
class AppErrorSportsNewsState extends AppStates{}

class AppLoadingScienceNewsState extends AppStates{}
class AppSucceededScienceNewsState extends AppStates{}
class AppErrorScienceNewsState extends AppStates{}


class AppLoadingSearchNewsState extends AppStates{}
class AppSucceededSearchNewsState extends AppStates{}
class AppErrorSearchNewsState extends AppStates{}


class AppChangeThemModeState extends AppStates{}
