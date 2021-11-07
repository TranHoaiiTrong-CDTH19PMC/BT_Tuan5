import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class ScreenArguments {
  final String title;
  final String message;

  ScreenArguments(this.title, this.message);
}



class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Named Routes Demo',
      initialRoute: '/',
      routes: {
        '/': (context) => trangchu(),
        SecondScreen.routeName: (context) => tranghai(),
        baScreen.routeName: (context) => trangba()
      },
    );
  }
}

class trangchu extends StatefulWidget {
  @override
  FirstScreen createState() => FirstScreen();
}

class FirstScreen extends State<trangchu> {
  TextEditingController _mail = TextEditingController();
  TextEditingController _password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    thongbao(BuildContext context) {
      return showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text("Thông báo"),
              content: Text("Bạn chưa nhập đầy đủ thông tin "),
              actions: <Widget>[
                ElevatedButton(
                  child: Text("Tắt"),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              ],
            );
          });
    }
    return Scaffold(
        backgroundColor: Colors.lightBlue[400],
        body: Column(
          children: [
            Container(
              padding: EdgeInsets.only(top: 50),
              child: Image.asset(
                "images/mail.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                'SignIn',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),
              ),
            ),
            Container(
              child: Text(
                'Speak, friend, and enter',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 100, 50, 10),
              child: TextField(
                  textAlign: TextAlign.center,
                  controller: _mail,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.email, color: Colors.grey),
                    hintText: '            Email',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.zero,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.zero,
                    ),
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 5, 50, 60),
              child: TextField(
                  textAlign: TextAlign.center,
                  controller: _password,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    suffixIcon: Icon(Icons.lock, color: Colors.grey),
                    hintText: '            Password',
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.zero,
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.white),
                      borderRadius: BorderRadius.zero,
                    ),
                  )),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(50, 10, 50, 10),
              width: double.infinity,
              height: 70,
              child: OutlinedButton(
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.black,
                  primary: Colors.white,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0))),
                ),
                child: Text('SIGN IN'),
                onPressed: () {
                  if (_mail.text == "" || _password.text == "") {
                    thongbao(context);
                  } else {
                    if (_mail.text == _password.text) {
                      ScreenArguments ms =
                          ScreenArguments('Chúc mừng', 'Đăng nhập thành công');
                      Navigator.pushNamed(context, SecondScreen.routeName,
                          arguments: ms);
                    } else {
                      ScreenArguments ms = ScreenArguments(
                          'Xin lỗi', 'Đăng nhập không thành công thành công');
                      Navigator.pushNamed(context, baScreen.routeName,
                          arguments: ms);
                    }
                  }
                  setState(() {});
                },
              ),
            )
          ],
        ));
  }
}

class tranghai extends StatefulWidget {
  @override
  SecondScreen createState() => SecondScreen();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////
class SecondScreen extends State<tranghai> {
  static const routeName = '/tranghai';

  @override
  Widget build(BuildContext context) {
      final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập thành công'),
      ),
      body: Center(
          child: Column(children: [
        Text(args.title),
        Text(args.message),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Try again'),
        ),
      ])),
    );
  }
}

class trangba extends StatefulWidget {
  @override
  baScreen createState() => baScreen();
}

class baScreen extends State<trangba> {
  static const routeName = '/trangba';
  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as ScreenArguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Đăng nhập thất bại'),
      ),
      body: Center(
          child: Column(children: [
        Text(args.title),
        Text(args.message),
        ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('Try again'),
        ),
      ])),
    );
  }
}