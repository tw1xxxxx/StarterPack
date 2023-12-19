import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  // TextEditingController _textController = TextEditingController();
  // String formattedText = '';

  //  @override
  //  void initState() {
  //    super.initState();

  //    _textController.addListener(() {
  // //     setState(() {
  // //       if (_textController.text.length > 7) {
  // //         // Ограничиваем длину ввода до 8 символов
  // //         _textController.text = _textController.text.substring(0, 8);
  // //       }

  // //       String inputText = _textController.text;
  // //       if (inputText.length >= 3) {
  // //         // Добавляем скобки вокруг первых 3 чисел
  // //         String firstThreeDigits = inputText.substring(0, 3);
  // //         inputText = '(${inputText.substring(0, 3)})';

  // //         if (inputText.length >= 7) {
  // //           // Добавляем тире между 3-им и 4-ым, а также между 6-ым и 7-ым числами
  // //           inputText =
  // //               '${inputText.substring(0, 7)}-${inputText.substring(7)}';
  // //         }
  // //       }

  // //       formattedText = inputText;
  //      });
  //  //  });
  //  }

  // @override
  // void dispose() {
  //   _textController.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Date Input')),
        body: Center(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
                child: TextFormField(
                enableSuggestions: false,
                maxLength:  28,
                keyboardType: TextInputType.text,
              // validator: (value) {
              //   final isDigitsOnly = int.tryParse(value!);
              //   return isDigitsOnly == null
              //       ? 'Input needs to be digits only'
              //       : null;
              // },
              inputFormatters: [
                DateInputFormatter(),
              ],
              decoration: InputDecoration(labelText: 'Date'),
            )),
          ),
        ),
      ),
    );
  }
}

class DateInputFormatter extends TextInputFormatter {
  int times = 0;
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    final text = newValue.text;
    int times = 0;
    if (text.length > 2 && !text.contains(')')) {
      return TextEditingValue(
        text: '+7 (${text.substring(0, 3)}) ', //${text.substring(3)}',
        selection: TextSelection.collapsed(offset: text.length + 6),
      );
    }
    if (text.length > 11 && !text.contains('-')) {
      times++;
      print(text.length);
      return TextEditingValue(
        text: '${text.substring(0, 12)} - ', //${text.substring(3)}',
        selection: TextSelection.collapsed(offset: text.length + 3),
      );
    }
    if (text.length > 16 && text.contains('-') && times < 2) {
      times++;
      print(text.length);
      return TextEditingValue(
        text: '${text.substring(0, 17)} - ',//${text.substring(16)}',
        selection: TextSelection.collapsed(offset: text.length + 2,affinity: TextAffinity.downstream),
      );
    }
    return newValue;
  }
}
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Input Page'),
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(children: [
//           TextField(
//             controller: _textController,
//             decoration: InputDecoration(
//               hintText: 'Введите текст',
//             ),
//           ),
//           SizedBox(height: 16.0),
//           Text(
//             formattedText,
//             style: TextStyle(fontSize: 24.0),
//           ),

//         ]),
//       ),
//     );
//   }
// }

void main() {
  runApp(MaterialApp(
    home: InputPage(),
  ));
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
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Page'),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (showButton)
//               ElevatedButton(
//                 onPressed: () {
//                   Navigator.push(context, MaterialPageRoute(
//                     builder: (BuildContext context) => MyPage()
//                       ),
//                     );
//                 },
//                 child: Text('Button'),
//               ),
//             SizedBox(height: 20),
//             TextField(
//               maxLength: 10,
//               onChanged: (value) {
//                 setState(() {
//                   showButton = value.length > 9;
//                 });
//               },
//               decoration: InputDecoration(
//                 hintText: 'Введите текст',
//                 border: OutlineInputBorder(),
//               ),
//               inputFormatters: <TextInputFormatter>[
//               FilteringTextInputFormatter.digitsOnly
//             ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }









































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

//   @override

//   void initState() {
//     super.initState();

//     _textController.addListener(() {
//       setState(() {
//         String inputText = _textController.text;
//         if (inputText.length ==3) {
//           inputText = '(${inputText.substring(0, 3)}) ';
//         }
//         if (inputText.length >= 9) {
//             inputText = '${inputText.substring(0, 10)}-';
//         }
//         if (inputText.length >= 12){
//             inputText = '${inputText.substring(0, 13)}-';
//         }
//         _textController.text = inputText;
//         // _textController.dispose();
//         // super.dispose();
//       });
//     });
//   }

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