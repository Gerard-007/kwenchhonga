// void main() {
//   performTask();
// }

// void performTask() {
//   task1();
//   task2();
//   task3();
// }

// void task1() {
//   String result = "task1 data";
//   print(result);
// }

// void task2() {
//   Duration threesec = Duration(seconds: 5);

//   String result;

//   Future.delayed(threesec, () {
//     result = "task2 data";
//     print(result);
//   });
// }

// void task3() {
//   String result = "task3 data";
//   print(result);
// }

// Using async await
void main() {
  performTask();
}

void performTask() async {
  task1();
  String task2result = await task2();
  task3(task2result);
}

void task1() {
  String result = "task1 data";
  print(result);
}

Future task2() async {
  Duration threesec = Duration(seconds: 5);

  String result;

  await Future.delayed(threesec, () {
    result = "task2 data";
    print("task 2 complete");
  });
}

void task3(String task2Data) {
  String result = "task 3 data";
  print("Task 3 complete with $task2Data");
}



// bool _isLoading = false;

  // loginNow(String email, String password) async {
  //   var url = Uri.parse("https://kwenchhonga.herokuapp.com/api/auth/login/");
  //   SharedPreferences _sharedPreferences =
  //       await SharedPreferences.getInstance();
  //   Map body = {"email": email, "password": password};

  //   var _jsonResponse;
  //   var _response = await http.post(url, body: body);

  //   // Needs to check API status...
  //   if (_response.statusCode == 200) {
  //     _jsonResponse = json.decode(_response.body);

  //     print("Respponse status: ${_response.statusCode}");
  //     print("Respponse body: ${_response.body}");

  //     if (_jsonResponse != null) {
  //       setState(() {
  //         _isLoading = false;
  //       });

  //       _sharedPreferences.setString("token", _jsonResponse["token"]);

  //       //Navigate user to dashboard if login was successful
  //       dashboardPage();
  //     } else {
  //       setState(() {
  //         _isLoading = false;
  //       });

  //       print("Respponse body: ${_response.body}");
  //     }
  //   }
  // }

  // late String email;
  // late String password;

  // void _loginNow() {
  //   var isValid = _form.currentState?.validate();
  //   if (isValid!) {
  //     return dashboardPage();
  //   }
  //   _form.currentState?.save();
  //   print(email);
  //   print(password);
  // }



  
// onPressed: _emailController.text == "" ||
//         _passwordController.text == ""
//     ? null
//     : () {
//         setState(() {
//           _isLoading = true;
//         });
//         loginNow(_emailController.text,
//             _passwordController.text);
//       },


// final APIService _apiService = APIService();
//   var _notificationJson = [];

// Future<List<NotificationModelClass>> getNotificationData() async{
//     var response = await _apiService.getData("/api/notifications/");
//     final notificationModelClass = notificationModelClassFromMap(response);
//     List<NotificationModelClass> = notificationModelClass;
//   }

  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   fetchData();
  // }

  // void fetchData() async {
  //   SharedPreferences _pref = await SharedPreferences.getInstance();
  //   var token = _pref.getString("login");
  //   // String url = "$baseUrl/api/auth/user/";
  //   var url = baseUrl + "/api/notifications/";
  //   try {
  //     var _response = await http.get(
  //       Uri.parse(url),
  //       headers: {"Authorization": "Bearer $token"},
  //     );
  //     print(jsonDecode(_response.body));
  //     final jsonData = jsonDecode(_response.body) as List;
  //     setState(() {
  //       _notificationJson = jsonData;
  //     });
  //   } catch (err) {
  //     // ignore: avoid_print
  //     print(err);
  //   }
  // }



    // Widget genderChoiceField() {
  //   return Container(
  //     decoration: const BoxDecoration(
  //       color: Color(0xFFEAFFEA),
  //       borderRadius: BorderRadius.all(
  //         Radius.circular(10),
  //       ),
  //     ),
  //     child: DropDownFormField(
  //       titleText: 'Gender',
  //       hintText: 'Are you a Male or Female',
  //       value: selected,
  //       onSaved: (value) {
  //         setState(() {
  //           selected = value;
  //         });
  //       },
  //       onChanged: (value) {
  //         print(value);
  //         setState(() {
  //           if (value != null) selected = value;
  //         });
  //       },
  //       dataSource: const [
  //         {
  //           "display": "Male",
  //           "value": "Male",
  //         },
  //         {
  //           "display": "Female",
  //           "value": "Female",
  //         },
  //       ],
  //       textField: 'display',
  //       valueField: 'value',
  //     ),
  //   );
  // }

  // Widget genderDropDownList() {
  //   return DropdownButton(
  //     icon: const Icon(
  //       Icons.arrow_drop_down_circle_outlined,
  //       size: 25,
  //     ),
  //     value: selected,
  //     style: TextStyle(
  //       fontFamily: 'Baloo2',
  //       fontSize: 18.sm,
  //       color: Colors.black,
  //       fontWeight: FontWeight.w700,
  //     ),
  //     items: genderDropDown
  //         .map((e) => DropdownMenuItem(value: e, child: Text(e)))
  //         .toList(),
  //     onChanged: (String val) {
  //       print(val);
  //       setState(() {
  //         if (val != null) selected = val;
  //       });
  //     },
  //   );
  // }