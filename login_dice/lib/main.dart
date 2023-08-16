import 'package:flutter/material.dart';
import 'package:login_dice/dice.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Dice game',
      home: LogIn(),
    );
  }
}

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  TextEditingController controller = TextEditingController();
  TextEditingController controller2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Log in'),
        backgroundColor: Colors.redAccent,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.menu),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // const Padding(padding: EdgeInsets.only(top: 50)),
            const SizedBox(height: 50),
            const Center(
              child: Image(
                image: AssetImage('image/chef.gif'),
                width: 170,
                height: 190,
              ),
            ),
            Form(
              child: Theme(
                data: ThemeData(
                  primaryColor: Colors.teal,
                  inputDecorationTheme: const InputDecorationTheme(
                    labelStyle: TextStyle(color: Colors.teal, fontSize: 15),
                  ),
                ),
                child: Container(
                  padding: const EdgeInsets.all(40),
                  child: Column(
                    children: [
                      TextField(
                        controller: controller,
                        decoration:
                            const InputDecoration(labelText: 'Enter "dice"'),
                        keyboardType: TextInputType.emailAddress,
                      ),
                      TextField(
                        controller: controller2,
                        decoration:
                            const InputDecoration(labelText: 'Enter Password'),
                        keyboardType: TextInputType.text,
                        obscureText: true,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: const Size(100, 50),
                            backgroundColor: Colors.orangeAccent),
                        child: const Icon(
                          Icons.arrow_forward,
                          color: Colors.white,
                          size: 35,
                        ),
                        onPressed: () {
                          if (controller.text == 'dice' &&
                              controller2.text == '1234') {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const Dice(),
                              ),
                            );
                          } else if (controller.text == 'dice' &&
                              controller2.text != '1234') {
                            showSnackBar2(context);
                          } else if (controller.text != 'dice' &&
                              controller2.text == '1234') {
                            showSnackBar3(context);
                          } else {
                            showSnackBar(context);
                          }
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

void showSnackBar(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text('로그인 정보를 다시 확인하세요!'),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.blue,
      action: SnackBarAction(
        label: '닫기',
        textColor: Colors.white,
        onPressed: () {},
      ),
    ),
  );
}

void showSnackBar2(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text('비밀번호가 일치하지 않습니다!'),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.blue,
      action: SnackBarAction(
        label: '닫기',
        textColor: Colors.white,
        onPressed: () {},
      ),
    ),
  );
}

void showSnackBar3(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: const Text('dice의 철자를 확인하세요!'),
      duration: const Duration(seconds: 2),
      backgroundColor: Colors.blue,
      action: SnackBarAction(
        label: '닫기',
        textColor: Colors.white,
        onPressed: () {},
      ),
    ),
  );
}
