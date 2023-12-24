import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:math';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  _MyPageState createState() => _MyPageState();
}
class _MyPageState extends State<MyPage> {
  final TextEditingController _textController = TextEditingController();
  int times = 0;
    String generateCode() {
    String code = '';
    for (int i = 0; i < 6; i++) code += (0 + Random().nextInt(9)).toString();
    print('Generated code: $code');
    return code;
  }
  @override
  void initState() {
    super.initState();
    _textController.addListener(() {
      String text = _textController.text;
      if (text.length > 2 && !text.contains(')'))
        text = '+7 (${text.substring(0, 3)}) ';
      if (text.length > 11 && !text.contains('-')) {
        times++;
        text = '${text.substring(0, 12)} - ';
      }
      if (text.length > 16 && text.contains('-') && times < 2) {
        times++;
        text = '${text.substring(0, 17)} - ';
      }
      if (text != _textController.text) _textController.text = text;
    });
  }

  bool showButton = false;
  bool showErrorDialog = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Row(children: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyPage()),
                );
              },
              icon: const Icon(Icons.arrow_back_ios)),
          Spacer(
            flex: 3,
          ),
          Text(
            'Вход',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          Spacer(
            flex: 4,
          ),
        ]),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            const Spacer(),
            Row(children: [
              if (!showButton) const Spacer(),
              if (showButton) const SizedBox(width: 30),
              Container(
                width: 300,
                padding: const EdgeInsetsDirectional.only(
                    top: 0, bottom: 10, start: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0, 0),
                        blurStyle: BlurStyle.solid,
                        spreadRadius: 1.1,
                      ),
                    ],
                    borderRadius: BorderRadius.all(Radius.circular(20))),
                child: TextFormField(
                  enableInteractiveSelection: false,
                  controller: _textController,
                  maxLength: 22,
                  cursorHeight: 40,
                  cursorColor: const Color.fromARGB(255, 174, 174, 174),
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    setState(() {
                      showButton = _textController.text.length > 21;
                    });
                  },
                  inputFormatters: [
                    FilteringTextInputFormatter.allow(
                        RegExp(r'[0-9\-\(\)\+ ]')),
                  ],
                  style: const TextStyle(
                      fontSize: 26, fontWeight: FontWeight.w500),
                  decoration: InputDecoration(
                    counterText: '',
                    hintText: '+7 (000) 000 - 00 - 00',
                    border: InputBorder.none,
                    hintStyle: const TextStyle(
                      fontSize: 26,
                      height: 2,
                      fontWeight: FontWeight.w400,
                    ),
                    error: Container(color: Colors.black),
                  ),
                ),
              ),
              if (!showButton) const Spacer(),
              if (showButton)
                const SizedBox(
                  width: 10,
                ),
              if (showButton)
                Container(
                  height: 77,
                  width: 120,
                  decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black,
                          offset: Offset(0, 0),
                          blurStyle: BlurStyle.solid,
                          spreadRadius: 1,
                        ),
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                  child: ElevatedButton(
                    style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                          Color.fromARGB(0, 255, 255, 255)),
                      shadowColor: MaterialStatePropertyAll(
                          Color.fromARGB(0, 255, 255, 255)),
                    ),
                    child: const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: Color.fromARGB(255, 255, 255, 255),
                      shadows: [
                        Shadow(
                          color: Colors.black,
                          blurRadius: 1,
                        ),
                        Shadow(
                          color: Colors.black,
                          blurRadius: 1,
                        ),
                        Shadow(
                          color: Colors.black,
                          blurRadius: 1,
                        ),
                        Shadow(
                          color: Colors.black,
                          blurRadius: 1,
                        ),
                      ],
                      weight: 0.01,
                      size: 60,
                    ),
                    onPressed: () {
                      if (!_textController.text.startsWith('+7 985') ||
                          !_textController.text.startsWith('+7 926')) {
                        print("alo");
                      }
                      
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Confirm(code: generateCode())),
                      );
                    },
                  ),
                ),
            ]),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}


class Confirm extends StatelessWidget {
  String code = '';
  Confirm({
    super.key,
  required this.code
  });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 0, 0, 0),
        title: Row(children: [
          IconButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (BuildContext context) => MyPage()),
                );
              },
              icon: const Icon(Icons.arrow_back_ios)),
          Spacer(
            flex: 3,
          ),
          Text(
            'Подтверждение',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              letterSpacing: 2,
            ),
          ),
          Spacer(
            flex: 4,
          ),
        ]),
      ),
      body: Container(
        color: const Color.fromARGB(255, 255, 255, 255),
        child: Center(
          child: Column(
          
            children: [
              Spacer(),
              Text(
                'Введите 6-значный код, отправленный на номер:\n',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: const Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              Center(
                child: Text(
                '+798538632361',
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 0, 0, 0),
                ),
              ),
              ),
              
              SizedBox(height: 10),
              Center(
                child: Container(
                  width: 290,
                  child: TextFormField(
                    onChanged: (value) {
                      if (value.length == 6){
                      if(value == code){
                         Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => MyPage()),
                      );

                      }
                      else print('Код неверерн');
                      }
                    },
                    enableInteractiveSelection: false,
                    maxLength: 6,
                    cursorHeight: 40,
                    cursorColor: const Color.fromARGB(255, 174, 174, 174),
                    keyboardType: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.allow(
                          RegExp(r'[0-9\-\(\)\+ ]')),
                    ],
                    style: const TextStyle(
                        letterSpacing: 31,
                        fontSize: 26,
                        fontWeight: FontWeight.w500),
                    decoration: InputDecoration(
                      counterText: '',
                      helperText: 'dfksdgk',
                      hintMaxLines: 2,
                      hintText: '_ _ _ _ _ _',
                      border: InputBorder.none,
                      hintStyle: const TextStyle(
                        fontSize: 40,
                        height: 2,
                        letterSpacing: 8,
                        fontWeight: FontWeight.w400,
                      ),
                      error: Container(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Spacer(flex: 2),
            ],
          ),
        ),
      ),
    );
  }
}






































// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyPage(),
//       debugShowCheckedModeBanner: false,
//     );
//   }
// }

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   bool showButton = false;
//   final chanks = [1, 2, 3, 4, 5, 6, 7, 8, 9];
//   TextEditingController _textController = TextEditingController();
//   String formattedText = '';

  // @override

  // void initState() {
  //   super.initState();

  //   _textController.addListener(() {
  //     setState(() {
  //       String inputText = _textController.text;
  //       if (inputText.length ==3) {
  //         inputText = '(${inputText.substring(0, 3)}) ';
  //       }
  //       if (inputText.length >= 9) {
  //           inputText = '${inputText.substring(0, 10)}-';
  //       }
  //       if (inputText.length >= 12){
  //           inputText = '${inputText.substring(0, 13)}-';
  //       }
  //       _textController.text = inputText;
  //       // _textController.dispose();
  //       // super.dispose();
  //     });
  //   });
  // }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: [
//             TextField(
//               controller: _textController,
//               maxLength: 100,
//               onChanged: (value) {
//                 String mainText = '';
//                 setState(() {
//                   // if (value.length == 3) {
//                   //   _textController.text =
//                   //       '(${_textController.text.substring(0, value.length)}) ';
//                   //   mainText += _textController.text;
//                   //   if (value.length == 9) {
//                   //     _textController.text =
//                   //         '${_textController.text.substring(0, value.length)}- ';
//                   //         mainText += _textController.text;
//                   //     if (value.length == 12) {
//                   //       _textController.text =
//                   //           '${_textController.text.substring(0, value.length)}- ';
//                   //           mainText += _textController.text;
//                   //     }
//                   //   }
//                   // }
//                  // _textController.text = mainText;
//                   showButton = value.length > 9;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: '+7 (000) 000-00-00',
//                 border: OutlineInputBorder(),
//               ),
//               inputFormatters: <TextInputFormatter>[
//                 FilteringTextInputFormatter.digitsOnly
//               ],
//             ),
//             Spacer(),
//             Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     '+7 ' + _textController.text,
//                     style: TextStyle(height: 20, fontSize: 20),
//                   ),
//                   if (showButton)
//                     ElevatedButton(
//                       onPressed: () {
//                         Navigator.push(
//                           context,
//                           MaterialPageRoute(
//                               builder: (BuildContext context) => MyPage()),
//                         );
//                       },
//                       child: Text('Button'),
//                     ),
//                 ]),
//             Spacer(),
//           ],
//         ),
//       ),
//     );
//   }
// }





















// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyPage(),
//     );
//   }
// }

// class MyPage extends StatefulWidget {
//   @override
//   _MyPageState createState() => _MyPageState();
// }

// class _MyPageState extends State<MyPage> {
//   TextEditingController _textController = TextEditingController();
//   bool _showButton = false;

//   @override
//   void initState() {
//     super.initState();
//     _textController.addListener(_checkCharacterLimit);
//   }

//   @override
//   void dispose() {
//     _textController.dispose();
//     super.dispose();
//   }

//   void _checkCharacterLimit() {
//     if (_textController.text.length > 9) {
//       setState(() {
//         _showButton = true;
//       });
//     } else {
//       setState(() {
//         _showButton = false;
//       });
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Input Page'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             TextField(
//               controller: _textController,
//               maxLength: 10,
//               decoration: InputDecoration(
//                 labelText: 'Input',
//                 suffixIcon: _showButton
//                     ? IconButton(
//                         icon: Icon(Icons.clear),
//                         onPressed: () {
//                           setState(() {
//                             _textController.clear();
//                             _showButton = false;
//                           });
//                         },
//                       )
//                     : null,
//               ),
//             ),
//             Row(
//               children: [

              
            
//             if (_textController.text.length >= 3) // Первые 3 числа
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 8.0),
//                 child: Text(
//                   '(${_textController.text.substring(0, 3)})',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//             if (_textController.text.length >= 6) // Знак тире после 6 числа
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 8.0),
//                 child: Text(
//                   '${_textController.text.substring(3, 6)}-',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//             if (_textController.text.length >= 8) // Знак тире после 8 числа
//               Padding(
//                 padding: EdgeInsets.symmetric(vertical: 8.0),
//                 child: Text(
//                   '${_textController.text.substring(6, 8)}-',
//                   style: TextStyle(fontSize: 18.0),
//                 ),
//               ),
//           ],
//         ),
//         ]),
//       ),
      
//     );
//   }
// }

























































































































// import 'dart:math';

// import 'package:flutter/material.dart';

// void main() {
//   runApp(AuthenticationApp());
// }

// class AuthenticationApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: LoginPage(),
//     );
//   }
// }

// class LoginPage extends StatefulWidget {
//   @override
//   _LoginPageState createState() => _LoginPageState();
// }

// class _LoginPageState extends State<LoginPage> {
//   String phoneNumber = '';

//   void generateCode() {
//     String code = '';
//     for (int i = 0; i < 6; i++) {
//       code += (0 + Random().nextInt(9)).toString();
//     }
//     print('Generated code: $code');

//     // Переход на черный экран
//     Navigator.pushReplacement(
//       context,
//       MaterialPageRoute(
//         builder: (BuildContext context) => BlackScreen(),
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Container(
//               padding: EdgeInsets.symmetric(horizontal: 20),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Container(
//                     width: 30,
//                     height: 30,
//                     color: Colors.grey,
//                     child: Center(
//                       child: Text(
//                         '+7',
//                         style: TextStyle(
//                           color: Colors.white,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       ),
//                     ),
//                   ),
//                   SizedBox(width: 10),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: List.generate(
//                       10,
//                       (index) => Container(
//                         width: 20,
//                         height: 1,
//                         color: Colors.blue[200],
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(height: 20),
//             Text(
//               'Enter your phone number',
//               style: TextStyle(
//                 fontSize: 18,
//                 fontWeight: FontWeight.bold,
//                 color: Colors.blueGrey[800],
//               ),
//             ),
//             SizedBox(height: 10),
//             Padding(
//               padding: EdgeInsets.symmetric(horizontal: 40),
//               child: TextField(
//                 keyboardType: TextInputType.number,
//                 decoration: InputDecoration(
//                   hintText: 'Phone number',
//                   border: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blueGrey),
//                   ),
//                   focusedBorder: UnderlineInputBorder(
//                     borderSide: BorderSide(color: Colors.blueGrey),
//                   ),
//                 ),
//                 onChanged: (value) {
//                   setState(() {
//                     phoneNumber = value;
//                   });
//                 },
//               ),
//             ),
//             SizedBox(height: 20),
//             InkWell(
//               child:  Container(
//               child: Text(
//                 'Next',
//                 style: TextStyle(color: Colors.white),
//               ),
//               color: Colors.blueGrey[800],
//             ),
//               onTap: () {
//                 generateCode();
//               },
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// class BlackScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//       ),
//       body: Container(
//         color: Colors.black,
//         child: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Text(
//                 'Enter the 6-digit code',
//                 style: TextStyle(
//                   fontSize: 18,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                 ),
//               ),
//               SizedBox(height: 10),
//               Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 40),
//                 child: TextField(
//                   keyboardType: TextInputType.number,
//                   decoration: InputDecoration(
//                     hintText: 'Code',
//                     hintStyle: TextStyle(color: Colors.grey),
//                     border: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                     focusedBorder: UnderlineInputBorder(
//                       borderSide: BorderSide(color: Colors.white),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 20),
//               InkWell(
//                 child: Container(
//                 child: Text(
//                   'Submit',
//                   style: TextStyle(color: Colors.white),
//                 ),
//                 color: Colors.blueGrey[800],
//                 ),
//                 onTap: () {
//                   // Действия при нажатии на кнопку "Submit"
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }