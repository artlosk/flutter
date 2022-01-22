import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:layer_business/layer_business.dart';
import 'package:provider/provider.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late final ListBloc _listBloc;
  late final InfoBloc _infoBloc;

  @override
  void initState() {
    super.initState();

    _listBloc = GetIt.I.get<ListBloc>();
    _listBloc.add(const ListBlocEvent.init());
    _infoBloc = GetIt.I.get<InfoBloc>();
    _infoBloc.add(const InfoBlocEvent.init());
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<ListBloc>(create: (_) => _listBloc),
        Provider<InfoBloc>(create: (_) => _infoBloc),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MainList(),//const UserInfo(id: 1),
        initialRoute: '/',
        onUnknownRoute: (RouteSettings settings) {
          return MaterialPageRoute(builder: (BuildContext context) {
            return const MainList();
          });
        },
        onGenerateRoute: (RouteSettings settings) {
          switch (settings.name) {
            case MainList.routeName:
              return MaterialPageRoute(builder: (BuildContext context) {
                return const MainList();
              });
            case UserInfo.routeName:
              final args = settings.arguments as Map<String, dynamic>;
              return MaterialPageRoute(builder: (BuildContext context) {
                if (args.containsKey('id')) {
                  return UserInfo(id: args['id']);
                }
                return const MainList();
              });
            default:
              return MaterialPageRoute(builder: (BuildContext context) {
                return const MainList();
              });
          }
        },
      ),
    );
  }

  @override
  void dispose() {
    // _mainBloc.dispose();
    _listBloc.dispose();
    _infoBloc.dispose();
    super.dispose();
  }
}

class MainList extends StatelessWidget {
  static const routeName = '/';

  const MainList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<ListBlocState>(
        stream: context.read<ListBloc>().state,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final state = snapshot.data;
            return state!.map<Widget>(
              loading: (_) => Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Loading data'),
                      Divider(),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
              loaded: (state) => Scaffold(
                  appBar: AppBar(),
                  body: ListView(
                    children: [
                      ...state.userData.map((user) {
                        return Container(
                          margin: const EdgeInsets.all(10.0),
                          decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(20.0)),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.7),
                                spreadRadius: 3,
                                blurRadius: 5,
                                offset: const Offset(0, 5),
                              ),
                            ],
                          ),
                          child: Column(children: [
                            Container(
                              decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10.0)),
                                color: Colors.white,
                              ),
                              child: Row(
                                children: [
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                        height: 50,
                                        alignment: Alignment.centerLeft,
                                        padding:
                                            const EdgeInsets.only(left: 10.0),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                                '${user.firstname} ${user.lastname}'),
                                            Text(
                                              user.email,
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  color: Colors.black38),
                                            ),
                                          ],
                                        )),
                                  ),
                                  Expanded(
                                    flex: 1,
                                    child: Container(
                                      height: 30,
                                      alignment: Alignment.centerRight,
                                      padding:
                                          const EdgeInsets.only(right: 10.0),
                                      child: ElevatedButton(
                                        child: const Text('Подробнее'),
                                        onPressed: () {
                                          context.read<InfoBloc>().add(InfoBlocEvent.getUser(user: user));
                                          Navigator.of(context).pushNamed(
                                              '/user-info',
                                              arguments: {'id': user.id});
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                        );
                      }).toList(),
                    ],
                  )),
            );
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Loading data'),
                    Divider(),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          }
        });
  }
}

class UserInfo extends StatefulWidget {
  final int id;

  const UserInfo({Key? key, required this.id}) : super(key: key);
  static const routeName = '/user-info';

  @override
  _UserInfoState createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<InfoBlocState>(
        stream: context.read<InfoBloc>().state,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            final state = snapshot.data;
            return state!.map<Widget>(
              loading: (_) => Scaffold(
                appBar: AppBar(),
                body: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text('Loading data'),
                      Divider(),
                      CircularProgressIndicator(),
                    ],
                  ),
                ),
              ),
              loaded: (state) => Scaffold(
                appBar: AppBar(),
                body: Container(
                  margin: const EdgeInsets.all(10.0),
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(20.0)),
                  ),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                height: 50,
                                alignment: Alignment.centerLeft,
                                padding: const EdgeInsets.only(left: 10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                        '${state.userData.firstname} ${state.userData.lastname}'),
                                    Text(
                                      state.userData.email,
                                      style: const TextStyle(
                                          fontSize: 12, color: Colors.black38),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(thickness: 2),
                      Text(state.userData.bio)
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('Loading data'),
                    Divider(),
                    CircularProgressIndicator(),
                  ],
                ),
              ),
            );
          }
        });
  }
}
