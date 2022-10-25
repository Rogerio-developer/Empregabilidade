import 'package:empregabildade/components/animations/database_store_animation.dart';
import 'package:empregabildade/components/navegation/navegation_bar_widget.dart';
import 'package:empregabildade/components/safe_area/safe_area_widget.dart';
import 'package:empregabildade/repository/local_data.dart';
import 'package:empregabildade/repository/farebase_controller.dart';
import 'package:empregabildade/views/splash/splash_controller.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  FireBaseController db = FireBaseController();
  LocalData localData = LocalData.instance;
  bool _error = false;

  SplashController controller = SplashController();

  @override
  void initState() {
    _carregar();
    super.initState();
  }

  Future<void> _carregar() async {
    FireBaseController db = FireBaseController();
    try {
      localData.projectList = await db.selectAllProjects();
      localData.studentList = await db.selectAllStudents();
      _onSuccess();
    } catch (e) {
      setState(() {
        _error = true;
      });
    }
  }

  _onSuccess() {
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => const NavegationBar21()),
        (route) => false);
  }

  _getConteudoCarregando() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        Expanded(
          flex: 8,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: DatabaseStoreAnimation(),
          ),
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              "Carregando...",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
        )
      ],
    );
  }

  _getConteudoErro() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Text("Erro!"),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        ElevatedButton(
          onPressed: () {
            _carregar();
            setState(() {
              _error = false;
            });
          },
          child: const Text("Recarregar"),
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea21(
      body: _error ? _getConteudoErro() : _getConteudoCarregando(),
    );
  }
}
