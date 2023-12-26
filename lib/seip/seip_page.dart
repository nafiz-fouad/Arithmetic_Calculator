import 'dart:convert';
import 'dart:io';

//import 'package:art_sweetalert/art_sweetalert.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task6/seip/seip_overview.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'models/student_model.dart';
//import 'package:image_picker/image_picker.dart';
// import 'package:intl/intl.dart';
// import 'package:pencilbox_apk/custom/footer.dart';
// import 'package:pencilbox_apk/custom/subscribe.dart';
//import 'package:pencilbox_apk/models/seip_register_model.dart';
// import 'package:pencilbox_apk/utils/constants.dart';
// import '../custom/header.dart';
// import '../custom/menu.dart';
// import '../db_api_calls/seip_db.dart';
// import '../models/Errors.dart';
// import '../utils/seip_overview.dart';

class SeipPage extends StatefulWidget {
  static const String routeName = '/seip_page';

  @override
  State<SeipPage> createState() => _SeipPageState();
}

class _SeipPageState extends State<SeipPage> {
  var _course;
  var _relegion;
  var _gender;
  var _empStatus;
  var _division;
  var _eduLevel;
  String? _dob;
  File? file;

  final _studentNameControler = TextEditingController();
  final _studentEmailControler = TextEditingController();
  final _studentPhoneControler = TextEditingController();
  final _studentNidControler = TextEditingController();
  final _studentAddressControler = TextEditingController();
  final _studentCityControler = TextEditingController();
  final _studentPostalCodeControler = TextEditingController();
  final _studentDistrictControler = TextEditingController();
  final _studentInstituteControler = TextEditingController();
  final _studentSubjectControler = TextEditingController();
  final _studentPassingYearControler = TextEditingController();

  final _studentSubDestrictControler = TextEditingController();
  final _studentInstitute = TextEditingController();

  final _status_students_institute = TextEditingController();
  String? _status_students_year;
  final _status_freelancer_marketplace = TextEditingController();
  final _status_freelancer_income = TextEditingController();
  final _status_businessman_business_type = TextEditingController();
  final _status_businessman_income = TextEditingController();
  final _status_entrepreneur_working_sector = TextEditingController();
  final _status_entrepreneur_income = TextEditingController();
  final _statusPassingYearControler = TextEditingController();

  String _status_jobseeker_interest_field = '';
  String? _status_jobseeker_interest_dropdown_field;
  final _status_jobseeker_interest_income = TextEditingController();
  final _status_jobholder_company_name = TextEditingController();
  final _status_jobholder_designation = TextEditingController();
  final _status_jobholder_income = TextEditingController();

  bool showStudentsContainer = false;
  bool showFreelancerContainer = false;
  bool showBusinessmanContainer = false;
  bool showEnterpreneurContainer = false;
  bool showJobSeekerContainer = false;
  bool showJobHolderContainer = false;

  bool emailValidation = false;
  bool phoneValidation = false;
  bool nidValidation = false;
  final _dobControler = TextEditingController();
  //ImageSource _imageSource = ImageSource.gallery;
  String? _imagePath = 'No File Chosen';
  final _fromKey = GlobalKey<FormState>();

  bool showOverViewTab=false;
  bool showAdmissionProcessTab=false;
  bool showSeipTab=true;
  Color seipFromBtnBgColorOn=Color(0xff000052);
  Color seipOverviewBtnBgColorOn=Color(0xff000052);
  Color seipAdmissionProcessBtnBgColorOn=Color(0xff000052);
  Color seipFromBtnBgColorOff=Colors.grey.shade700;
  Color seipOverviewBtnBgColorOff=Colors.grey.shade700;
  Color seipAdmissionProcessBtnBgColorOff=Colors.grey.shade700;

  Color seipBtnColor=Color(0xff000052);
  Color overViewBtnColor=Colors.grey.shade700;
  Color admissionBtnColor=Colors.grey.shade700;

  @override
  void dispose() {
    _studentNameControler.dispose();
    _studentEmailControler.dispose();
    _studentPhoneControler.dispose();
    _studentNidControler.dispose();
    _studentAddressControler.dispose();
    _studentCityControler.dispose();
    _studentPostalCodeControler.dispose();
    _studentDistrictControler.dispose();
    _studentInstituteControler.dispose();
    _studentNidControler.dispose();
    _studentSubjectControler.dispose();
    _studentPassingYearControler.dispose();
    _studentSubDestrictControler.dispose();
    _studentInstitute.dispose();

    _status_students_institute.dispose();
    _status_freelancer_marketplace.dispose();
    _status_freelancer_income.dispose();
    _status_businessman_business_type.dispose();
    _status_businessman_income.dispose();
    _status_entrepreneur_working_sector.dispose();
    _status_entrepreneur_income.dispose();
    _status_jobseeker_interest_income.dispose();
    _status_jobholder_company_name.dispose();
    _status_jobholder_designation.dispose();
    _status_jobholder_income.dispose();

    super.dispose();
  }

  @override
  void didChangeDependencies() {
    if (ModalRoute.of(context)!.settings.arguments != null) {
      final studentInfo =
          ModalRoute.of(context)!.settings.arguments as StudentModel;
      if (studentInfo != null) {
        setState(() {
          _studentNameControler.text = studentInfo.name;
          _studentPhoneControler.text = studentInfo.phone;
          _studentEmailControler.text = studentInfo.email;
          _course = studentInfo.course;
        });
      }
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //main app bar
        title: Text('SEIP',),
      ),
      body: ListView(
        children: [
          //HeaderMenu(),
          Container(
            color: Colors.grey.shade700,
            child: Column(
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 3,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Image.asset(
                          'images/seip.png',
                          height: 80,
                          width: 200,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      const Text(
                        'Skills For Employment Investment Program',
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Image.asset(
                        'images/partners_logo.png',
                      )
                    ],
                  ),
                ), //
              ],
            ),
          ),
          showSeipPageButtons(context),
          if (showOverViewTab) SeipOverview(),
          if (showSeipTab)  SeipRegForm(context),
          //if (showSeipTab)Center(child: Padding(padding: EdgeInsets.all(20),child: Text('SEIP Registration is closed for now.',style: TextStyle(fontSize: 20),),)),
          if(showAdmissionProcessTab) admissionProcessofSeip(),

         // Subscribe(),
         // Footer()
        ],
      ),
    );
  }

  Container admissionProcessofSeip() {
    return Container(
      margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 30,),
                Text('To enroll in any SEIP courses, an applicant must complete the online \' Registration Form \'. To be more specific, trainee selection and enrolment process will go through the following process',textAlign: TextAlign.center,),
                SizedBox(height: 20,),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(width: 1,color: Color(0xff000052))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25,top: 10,bottom: 10),
                    child: Text('Online Registration'),
                  ),
                ),
                Icon(Icons.arrow_drop_down_outlined,size: 25,color: Color(0xff000052),),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Color(0xff000052))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25,top: 10,bottom: 10),
                    child: Text('Written Test/Viva'),
                  ),
                ),
                Icon(Icons.arrow_drop_down_outlined,size: 25,color: Color(0xff000052),),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(width: 1,color: Color(0xff000052))
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 25.0,right: 25,top: 10,bottom: 10),
                    child: Text('Final Selection and Enrollment'),
                  ),
                ),
                SizedBox(height: 20,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('STEP 1: ONLINE REGISTRATION',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Flexible(child: Text('Interested applicant can complete online registration using online registration platform of PencilBox Training Institute. For online registration, applicants need to provide following information:')),

                  ],
                ),
                SizedBox(height: 10,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_forward,size: 16,),
                    SizedBox(width: 5,),
                    Flexible(child: Text('Personal details')),

                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_forward,size: 16,),
                    SizedBox(width: 5,),
                    Flexible(child: Text('Educational qualification')),

                  ],
                ),
                SizedBox(height: 5,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(Icons.arrow_forward,size: 16,),
                    SizedBox(width: 5,),
                    Flexible(child: Text('All the related information of the trainee')),

                  ],
                ),
                SizedBox(height: 15,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('STEP 2: SHORT LISTING',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                SizedBox(height: 5,),
                Flexible(child: Text('Interested applicants will be invited to sit for an admission test. The format of the admission test could be the face-to-face interview, written or both. Applicants selected through the admission test will be notified for enrollment through SMS and email.')),
                SizedBox(height: 15,),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text('STEP 3: FINAL ENROLMENT',style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),)),
                SizedBox(height: 10,),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_forward,size: 16,),
                        Flexible(child: Text('Selected applicants will be duly enrolled on submission of necessary records including')),
                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.circle,size: 10,),
                        SizedBox(width: 5,),
                        Flexible(child: Text('Photocopy of NID/BRC')),

                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(width: 15,),
                        Icon(Icons.circle,size: 10,),
                        SizedBox(width: 5,),
                        Flexible(child: Text('Documents relating to academic qualification')),

                      ],
                    ),
                    SizedBox(height: 5,),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Icon(Icons.arrow_forward,size: 16,),
                        SizedBox(width: 5,),
                        Flexible(child: Text('Documents relating to academic qualification')),

                      ],
                    ),
                    SizedBox(height: 35,),
                  ],
                ),

                  ],
            ),
          );
  }

  Column showSeipPageButtons(BuildContext context) {
    return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showOverViewTab=true;
                        showSeipTab=false;
                        showAdmissionProcessTab=false;
                        overViewBtnColor=seipOverviewBtnBgColorOn;
                        seipBtnColor=seipFromBtnBgColorOff;
                        admissionBtnColor=seipAdmissionProcessBtnBgColorOff;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: overViewBtnColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text('OVERVIEW OF SEIP'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0, top: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showOverViewTab=false;
                        showSeipTab=false;
                        showAdmissionProcessTab=true;
                        overViewBtnColor=seipOverviewBtnBgColorOff;
                        seipBtnColor=seipFromBtnBgColorOff;
                        admissionBtnColor=seipAdmissionProcessBtnBgColorOn;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: admissionBtnColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text('ADMISSION PROCESS OF SEIP'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        showOverViewTab=false;
                        showSeipTab=true;
                        showAdmissionProcessTab=false;
                        overViewBtnColor=seipOverviewBtnBgColorOff;
                        seipBtnColor=seipFromBtnBgColorOn;
                        admissionBtnColor=seipAdmissionProcessBtnBgColorOff;
                      });
                    },
                    style: ElevatedButton.styleFrom(
                        primary: seipBtnColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8))),
                    child: const Padding(
                      padding: EdgeInsets.only(top: 20, bottom: 20),
                      child: Text('SEIP REGISTRATION FROM'),
                    ),
                  ),
                ),
              ),
            ],
          );
  }

  Padding SeipRegForm(BuildContext context) {
    return Padding(
            padding: const EdgeInsets.all(12.0),
            child: Form(
              key: _fromKey,
              child: Column(
                children: [

                  // Padding(
                  //   padding: const EdgeInsets.only(left: 12.0, right: 12),
                  //   child: DropdownButtonFormField(
                  //     validator: (value) {
                  //       if (value == null) {
                  //         return 'Select a Course';
                  //       } else {
                  //         return null;
                  //       }
                  //     },
                  //     decoration: const InputDecoration(
                  //       border: OutlineInputBorder(
                  //           borderSide: BorderSide(color: Color(0xff000054)),
                  //           borderRadius:
                  //           BorderRadius.all(Radius.circular(12))),
                  //     ),
                  //     hint: Text('Select Course'),
                  //     value: _course,
                  //     onChanged: (value) {
                  //       setState(() {
                  //         _course = value;
                  //       });
                  //     },
                  //     items: courseList
                  //         .map((e) => DropdownMenuItem(
                  //       child: SizedBox(child: new Text(e)),
                  //       value: e,
                  //     ))
                  //         .toList(),
                  //   ),
                  // )






                  //drop down
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: ListView(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      children: [
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Personal Information',
                          style: TextStyle(
                              color: Color(0xff000054),
                              fontSize: 26,
                              fontWeight: FontWeight.bold),
                        ),
                        Column(
                        mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: 15,
                            ),
                            TextFormField(
                              controller: _studentNameControler,
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Name is Required';
                                }
                                if (value.length > 20) {
                                  return 'Name must be in 20 carecter';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                label: Text('Full Name'),
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ), //
                            TextFormField(
                              keyboardType: TextInputType.number,
                              controller: _studentPhoneControler,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Mobile Number is required';
                                }
                                if (value.length != 11) {
                                  return 'Phone must be in 11 carecter';
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              decoration: const InputDecoration(
                                label: Text('Mobile Number'),
                                hintText: 'EX: 01xxxxxxxxx',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ), //number
                            SizedBox(
                              height: 15,
                            ), //
                            TextFormField(
                              controller: _studentEmailControler,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Email is required';
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              decoration: const InputDecoration(
                                label: Text('Email Address'),
                                hintText: 'Email Address',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ), //religion
                            SizedBox(
                              height: 15,
                            ),
                             //gender
                            SizedBox(
                              height: 15,
                            ), //
                            TextFormField(
                              keyboardType: TextInputType.number,
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select a birth date';
                                } else {
                                  return null;
                                }
                              },
                              controller: _dobControler,
                              decoration: InputDecoration(
                                label: Text('Date of Birth'),
                                hintText: 'mm/dd/yyyy',
                                suffixIcon: IconButton(
                                    onPressed: _selectedDate,
                                    icon: Icon(Icons.date_range_rounded)),
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ), //dob
                            SizedBox(
                              height: 15,
                            ), //

                            SizedBox(
                              height: 15,
                            ), //
                            if (showStudentsContainer)
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 1.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: _studentInstitute,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'University Name is required';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text(
                                              'Current University/Institution'),
                                          hintText: 'Address',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (showFreelancerContainer)
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 1.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            _status_freelancer_marketplace,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Marketplace Link';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text('Marketplace Link'),
                                          hintText: 'Marketplace Link',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: _status_freelancer_income,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Monthly Income';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text('Monthly Income'),
                                          hintText: 'Monthly Income',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (showBusinessmanContainer)
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 1.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            _status_businessman_business_type,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Required';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text('Type of Bussiness'),
                                          hintText: 'Type of Bussiness',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            _status_businessman_income,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Monthly Income';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text('Monthly Income'),
                                          hintText: 'Monthly Income',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (showEnterpreneurContainer)
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 1.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            _status_entrepreneur_working_sector,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Required';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text('Working Sector'),
                                          hintText: 'Working Sector',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            _status_entrepreneur_income,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Monthly Income';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text('Monthly Income'),
                                          hintText: 'Monthly Income',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (showJobSeekerContainer)
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 1.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),

                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            _status_jobseeker_interest_income,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Monthly Income';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text('Monthly Income'),
                                          hintText: 'Monthly Income',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            if (showJobHolderContainer)
                              Container(
                                width:
                                    MediaQuery.of(context).size.width / 1.5,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            _status_jobholder_company_name,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Required';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text('Company Name'),
                                          hintText: 'Company Name',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller:
                                            _status_jobholder_designation,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Required';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text('Designation'),
                                          hintText: 'Designation',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                      TextFormField(
                                        controller: _status_jobholder_income,
                                        validator: (value) {
                                          if (value == null ||
                                              value.isEmpty) {
                                            return 'Monthly Income';
                                          } else {
                                            return null;
                                          }
                                        },
                                        autocorrect: true,
                                        decoration: const InputDecoration(
                                          label: Text('Monthly Income'),
                                          hintText: 'Monthly Income',
                                          hintStyle:
                                              TextStyle(color: Colors.grey),
                                          filled: true,
                                          fillColor: Colors.white70,
                                          enabledBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(12.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054),
                                                width: 2),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(10.0)),
                                            borderSide: BorderSide(
                                                color: Color(0xff000054)),
                                          ),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 15,
                                      ),
                                    ],
                                  ),
                                ),
                              ), //Job seeker

                            SizedBox(
                              height: 20,
                            ),
                            TextFormField(
                              controller: _studentAddressControler,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Address is required';
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              decoration: const InputDecoration(
                                label: Text('ADDRESS'),
                                hintText: 'Address',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ), //
                            TextFormField(
                              controller: _studentCityControler,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'City is required';
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              decoration: const InputDecoration(
                                label: Text('CITY'),
                                hintText: 'City',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ), //
                            TextFormField(
                              controller: _studentPostalCodeControler,
                              keyboardType: TextInputType.number,
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Postal Code is required';
                                }
                                if (value.length != 4) {
                                  return 'Postal Code must be four number';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                label: Text('POSTAL CODE'),
                                hintText: 'Postal Code',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ), //

                            SizedBox(
                              height: 15,
                            ), //
                            TextFormField(
                              controller: _studentDistrictControler,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select DISTRICT';
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              decoration: const InputDecoration(
                                label: Text('DISTRICT'),
                                hintText: 'District',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ), //
                            TextFormField(
                              controller: _studentSubDestrictControler,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select SUB-DISTRICT';
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              decoration: const InputDecoration(
                                label: Text('SUB-DISTRICT'),
                                hintText: 'Sub-District',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ),

                            //
                            SizedBox(
                              height: 15,
                            ), //
                            TextFormField(
                              controller: _studentInstituteControler,
                              autocorrect: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select INSTITUTE';
                                } else {
                                  return null;
                                }
                              },
                              decoration: const InputDecoration(
                                label: Text('INSTITUTE/BOARD'),
                                hintText: 'Institute',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ), //
                            TextFormField(
                              controller: _studentSubjectControler,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select Subject';
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              decoration: const InputDecoration(
                                label: Text('SUBJECT'),
                                hintText: 'Subject',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ), //
                            TextFormField(
                              controller: _studentPassingYearControler,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Select Passing Year';
                                } else {
                                  return null;
                                }
                              },
                              autocorrect: true,
                              decoration: const InputDecoration(
                                label: Text('PASSING YEAR'),
                                hintText: 'Year',
                                hintStyle: TextStyle(color: Colors.grey),
                                filled: true,
                                fillColor: Colors.white70,
                                enabledBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(12.0)),
                                  borderSide: BorderSide(
                                      color: Color(0xff000054), width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  borderSide:
                                      BorderSide(color: Color(0xff000054)),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 15,
                            ), //
                            Container(
                              height: 50,
                              padding: EdgeInsets.only(left: 10, right: 10),
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                  border: Border.all(
                                      width: 2, color: Color(0xff000054))),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: Text(
                                    '$_imagePath',
                                    textAlign: TextAlign.center,
                                  )),
                                  Expanded(
                                      child: ElevatedButton(
                                    child: Text('Choose File'),
                                    onPressed: () {
                                     // _getImage();
                                    },
                                  )),
                                ],
                              ),
                            ),

                          ],
                        )

                        //religion
                        //email
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  void _selectedDate() async {
    final selectedDate = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(1950),
        lastDate: DateTime.now());
    if (selectedDate != null) {
      setState(() {
       // _dob = DateFormat('MM/dd/yyyy').format(selectedDate);
        _dobControler.text = _dob!;
      });
    }
  }




  Future showCongratsDialoge(String alertTitle, String alertContent) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: AppBar(
                leading: IconButton(
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                    icon: Icon(Icons.arrow_back)),
                title: Text(alertTitle),
                centerTitle: true,
              ),
              content: Container(
                  height: 200,
                  width: 300,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Icon(Icons.mail),
                      Text(alertContent),
                    ],
                  )),
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('Close'))
              ],
            ));
  }
}

class DateFormat {
}
