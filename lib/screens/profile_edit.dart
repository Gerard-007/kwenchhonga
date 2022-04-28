// ignore_for_file: deprecated_member_use
import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:image_picker/image_picker.dart';
import 'package:kwenchhonga/api/api_service.dart';
import 'package:kwenchhonga/models/profile_model.dart';
import 'package:kwenchhonga/screens/dashboard_v2.dart';

class profileScreen extends StatefulWidget {
  const profileScreen({key}) : super(key: key);

  @override
  State<profileScreen> createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  @override
  void initState() {
    super.initState();
    checkUserProfile();
  }

  void checkUserProfile() async {
    var res = await apiService.getDataV2("/api/auth/profile/user/");
    print(res);
    setState(() {
      profile = ProfileModelClass.fromJson(res);
    });
  }

  bool circular = false;
  final _globalKey = GlobalKey<FormState>();
  final apiService = APIService();
  ProfileModelClass profile = ProfileModelClass();

  //Image holder...
  PickedFile _imageFile;
  final ImagePicker _picker = ImagePicker();

  //Text form holder...
  final TextEditingController _firstName = TextEditingController();
  final TextEditingController _lastName = TextEditingController();

  final List<String> genderItems = [
    'Male',
    'Female',
  ];

  String selectedValue;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _globalKey,
          child: ListView(
            padding: EdgeInsets.symmetric(
              horizontal: 40.w,
            ),
            children: [
              SizedBox(
                height: 40.h,
              ),
              imageProfile(),
              SizedBox(
                height: 30.h,
              ),
              nameTextField("First Name", _firstName),
              SizedBox(
                height: 30.h,
              ),
              nameTextField("Last Name", _lastName),
              SizedBox(
                height: 30.h,
              ),
              genderSelect(),
              SizedBox(
                height: 40.h,
              ),
              Material(
                elevation: 2.0,
                borderRadius: BorderRadius.circular(10.r),
                child: TextButton(
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all(const Color(0xFF327531)),
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    padding: MaterialStateProperty.all(
                      EdgeInsets.symmetric(vertical: 17.h, horizontal: 100.w),
                    ),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                    ),
                  ),
                  child: circular
                      ? const SpinKitThreeInOut(
                          color: Colors.white,
                          size: 20.0,
                        )
                      : const Text("Update Profile"),
                  onPressed: () async {
                    setState(() {
                      circular = true;
                    });
                    //profile.avatarUrl;
                    if (_globalKey.currentState.validate()) {
                      // ignore: avoid_print
                      print("Current selected gender $selectedValue");
                      Map<String, String> data = {
                        "fname": _firstName.text,
                        "lname": _lastName.text,
                        "gender": selectedValue.toString(),
                      };
                      // ignore: avoid_print
                      print(data);
                      var response = await apiService.updateData(
                          "/api/auth/profile/user/", data);
                      if (response.statusCode == 200 ||
                          response.statusCode == 201) {
                        if (_imageFile != null) {
                          var imageResponse = await apiService.patchImage(
                              "/api/auth/profile/image/", _imageFile.path);
                          print(imageResponse.statusCode);
                          if (imageResponse.statusCode == 200) {
                            //===Display snack bar if user was successful.
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Image Updated..."),
                              ),
                            );
                            home();
                          }
                        } else {
                          setState(() {
                            circular = false;
                          });
                          home();
                        }
                        //===Display snack bar if user was successful.
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Profile updated successfully..."),
                          ),
                        );
                        // Navigate to  home
                        home();
                      }
                      print("Validated... ${response.statusCode}");
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget nameTextField(String name, TextEditingController controller) {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(10.r),
      child: TextFormField(
        controller: controller,
        validator: (value) {
          if (value.isEmpty) {
            return "$name Field cant be empty";
          }
          return null;
        },
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.r,
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.w,
            ),
          ),
          filled: true,
          contentPadding: EdgeInsets.symmetric(
            vertical: 17.h,
            horizontal: 21.w,
          ),
          fillColor: const Color(0xFFEAFFEA),
          hintText: name,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
    );
  }

  Widget genderSelect() {
    return Material(
      elevation: 2.0,
      borderRadius: BorderRadius.circular(10.r),
      child: DropdownButtonFormField2(
        decoration: InputDecoration(
          //Add isDense true and zero Padding.
          //Add Horizontal padding using buttonPadding and Vertical padding by increasing buttonHeight instead of add Padding here so that The whole TextField Button become clickable, and also the dropdown menu open under The whole TextField Button.
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10.r),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.w,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(
              10.r,
            ),
            borderSide: BorderSide(
              color: Colors.transparent,
              width: 0.w,
            ),
          ),
          filled: true,
          fillColor: const Color(0xFFEAFFEA),
          //Add more decoration as you want here
          //Add label If you want but add hint outside the decoration to be aligned in the button perfectly.
        ),
        isExpanded: true,
        hint: const Text(
          'Select Your Gender',
          style: TextStyle(fontSize: 14),
        ),
        icon: const Icon(
          Icons.arrow_drop_down,
          color: Colors.black45,
        ),
        iconSize: 30,
        buttonHeight: 60,
        buttonPadding: const EdgeInsets.only(left: 20, right: 10),
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
        ),
        items: genderItems
            .map((item) => DropdownMenuItem<String>(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                    ),
                  ),
                ))
            .toList(),
        // ignore: missing_return
        validator: (value) {
          if (value == null) {
            return 'Please select gender.';
          }
        },
        onChanged: (value) {
          setState(() {
            if (value != null) selectedValue = value.toString();
          });
        },
        onSaved: (value) {
          selectedValue = value.toString();
        },
      ),
    );
  }

  Widget imageProfile() {
    return Center(
      child: Stack(
        children: [
          CircleAvatar(
            radius: 35.r,
            backgroundImage: _imageFile == null
                ? const AssetImage("assets/images/kwenchhonga-removebg2.png")
                : FileImage(
                    File(_imageFile.path),
                  ),
            backgroundColor: const Color(0xFF327531),
          ),
          Positioned(
            bottom: 5,
            right: 5,
            child: InkWell(
              onTap: () {
                showModalBottomSheet(
                  context: context,
                  builder: ((builder) => bottomImageSelectionMenu()),
                );
              },
              child: const Icon(
                Icons.camera_alt,
                size: 30,
                color: Color(0xFFEAFFEA),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget bottomImageSelectionMenu() {
    return Container(
      height: 100.h,
      width: MediaQuery.of(context).size.width,
      margin: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 20.h,
      ),
      child: Column(
        children: <Widget>[
          const Text(
            "Choose profile photo",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.camera);
                },
                icon: const Icon(
                  Icons.camera_alt,
                  size: 20,
                  color: Color(0xFF327531),
                ),
                label: const Text("Camera"),
              ),
              FlatButton.icon(
                onPressed: () {
                  takePhoto(ImageSource.gallery);
                },
                icon: const Icon(
                  Icons.image,
                  size: 20,
                  color: Color(0xFF327531),
                ),
                label: const Text("Gallery"),
              )
            ],
          ),
        ],
      ),
    );
  }

  void takePhoto(ImageSource source) async {
    final pickedFile = await _picker.getImage(
      source: source,
    );
    setState(() {
      _imageFile = pickedFile;
    });
  }

  void home() {
    Navigator.of(context, rootNavigator: true).pushReplacement(
      MaterialPageRoute(builder: (context) => const dashboardScreenV2()),
    );
  }
}
