import 'package:flutter/material.dart';
import 'package:loginapp/SecondScreen.dart';

void main() {
  runApp(ManHinhDangNhap());
}

class ManHinhDangNhap extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _LoginPage createState() => _LoginPage();
}

class _LoginPage extends State<MyApp> {
  bool _showPass = false;
  TextEditingController _userController = new TextEditingController();
  TextEditingController _passController = new TextEditingController();
  var _userNameErr = "Tài khoản không hợp lệ";
  var _passErr = "Mât khẩu phải trên 6 ký tự";
  var _userInvalid = false;
  var _passInvalid = false;

  SecondScreen CreateState() => SecondScreen();
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Container(
        padding: EdgeInsets.fromLTRB(30, 0, 30, 0),
        constraints: BoxConstraints.expand(),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Container(
                  width: 70,
                  height: 70,
                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                  child: FlutterLogo()),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Text(
                  "hello\nWecome",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 30),
                )),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: TextField(
                  controller: _userController,
                  decoration: InputDecoration(
                      labelText: "USERNAME",
                      errorText: _userInvalid ? "UserName không hơp lệ" : null,
                      labelStyle:
                          TextStyle(color: Color(0xff888888), fontSize: 15)),
                  style: TextStyle(fontSize: 18, color: Colors.black)),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: Stack(
                alignment: AlignmentDirectional.centerEnd,
                children: [
                  TextField(
                      controller: _passController,
                      obscureText: !_showPass,
                      decoration: InputDecoration(
                          errorText: _passInvalid ? "Pass không hơp lệ" : null,
                          labelText: "PASWWORD",
                          labelStyle: TextStyle(
                              color: Color(0xff888888), fontSize: 15)),
                      style: TextStyle(fontSize: 18, color: Colors.black)),
                  GestureDetector(
                    onTap: onToggleShowPass,
                    child: Text(
                      _showPass ? "HiDe" : "Show",
                      style: TextStyle(
                          color: Colors.blue,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(8))),
                  color: Colors.blue,
                  onPressed: OnClick,
                  child: Text('SIGN IN'),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                child: Container(
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'NEW USER? SIGN UP',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff888888)),
                      ),
                      Text(
                        'ForWordPassWord',
                        style: TextStyle(fontSize: 15, color: Colors.blue),
                      )
                    ],
                  ),
                )),
          ],
        ),
      ),
    );
  }

  void onToggleShowPass() {
    setState(() {
      _showPass = !_showPass;
    });
  }

  void OnClick() {
    setState(() {
      if (_userController.text.length < 6 ||
          !_userController.text.contains("@")) {
        _userInvalid = true;
      } else {
        _userInvalid = false;
      }

      if (_passController.text.length < 6) {
        _passInvalid = true;
      } else {
        _passInvalid = false;
      }
      if (!_userInvalid && !_passInvalid) {
        // Navigator.push(context, MaterialPageRoute(builder: gotoHome));
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => gotoHome(context)));
      }
    });
  }

  Widget gotoHome(BuildContext context) {
    return SecondScreen();
  }
}
