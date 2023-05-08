import 'package:flutter/material.dart';
import '../core/config/app_colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    //getAllUsers();
  }

  /* Future getAllUsers() async {
    HttpManager httpManager = HttpManager();
    Map result = await httpManager.request(url: "https://ilearn.appke.com.br/api/users", method: "GET");

    print(result);
  }*/

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              AppColors.primary,
              AppColors.primaryDark,
            ],
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //Text("SUMITOMO BIO", style: TextStyle(color: Colors.white, fontSize: 32.0)),
            Image.asset("assets/images/ilearn-logo-branca.png", width: 250),
            const SizedBox(height: 10),
            const CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation(Colors.white),
            )
          ],
        ),
      ),
    );
  }
}
