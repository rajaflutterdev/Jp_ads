import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:lottie/lottie.dart';

import '../const_file.dart';

class addwallet_Amount_Page extends StatefulWidget {
  String? Userid;
  String? UserType;
  addwallet_Amount_Page(this.Userid,this.UserType);

  @override
  State<addwallet_Amount_Page> createState() => _addwallet_Amount_PageState();
}

class _addwallet_Amount_PageState extends State<addwallet_Amount_Page> {

  bool Loading=false;

  TextEditingController Walletamountcontroller=TextEditingController();
  TextEditingController Usernamecontroller=TextEditingController();
  TextEditingController Phonecontroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double  width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffF2F6FF),
        elevation: 0,
        toolbarHeight: 70,
        title: Text("Wallet Amount",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
              fontSize:width/22,
              color: Colors.white),),
        flexibleSpace: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(20),
                bottomLeft: Radius.circular(20),
              ),
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color(0xff245BCA),
                    Color(0xff245BCA),
                  ]
              )
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              children: [

                Padding(
                  padding:  EdgeInsets.symmetric(
                      vertical: height/94.5,
                      horizontal: width/45
                  ),
                  child: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Color(0xffffe09f)
                    ),
                    padding: EdgeInsets.only(left: width/36.0,right: width/36.0,top: height/37.8,bottom: height/37.8),
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            ///Username container
                            SizedBox(
                              height: height/7.56,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("User Name *",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                        fontSize:width/22,
                                        color: Colors.black),),
                                  SizedBox(height: height/75.6,),
                                  Container(
                                    height: height/15.12,
                                    width: width/1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Color(0xff353535)
                                        )
                                    ),
                                    child: TextFormField(

                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/22,
                                          color: Colors.black),
                                      controller: Usernamecontroller,
                                      textCapitalization: TextCapitalization.characters,
                                      maxLength: 10,
                                      maxLines: 1,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp("[A-Z]")),
                                      ],
                                      decoration: InputDecoration(
                                          counterText: "",
                                          contentPadding: EdgeInsets.only(left: width/18),
                                          border: InputBorder.none,
                                          hintText: "Type Full Name",
                                          hintStyle: GoogleFonts.poppins()
                                      ),
                                      validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                      onChanged: (_){
                                        // _formKey.currentState!.validate();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),

                            ///Phonenumber container
                            SizedBox(
                              height: height/7.56,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Phone Number *",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                        fontSize:width/22,
                                        color: Colors.black),),
                                  SizedBox(height: height/75.6,),
                                  Container(
                                    height: height/15.12,
                                    width: width/1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Color(0xff353535)
                                        )
                                    ),
                                    child: TextFormField(
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/22,
                                          color: Colors.black),
                                      keyboardType: TextInputType.number,
                                      controller: Phonecontroller,
                                      maxLength: 10,
                                      maxLines: 1,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                      ],
                                      decoration: InputDecoration(
                                          counterText: "",
                                          contentPadding: EdgeInsets.only(left: width/18),
                                          border: InputBorder.none,
                                          hintText: "Type Phone number",
                                          hintStyle: GoogleFonts.poppins()
                                      ),
                                      validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                      onChanged: (_){
                                        // _formKey.currentState!.validate();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),

                            ///Amount container
                            SizedBox(
                              height: height/7.56,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Amount *",
                                    textAlign: TextAlign.center,
                                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                        fontSize:width/22,
                                        color: Colors.black),),
                                  SizedBox(height: height/75.6,),
                                  Container(
                                    height: height/15.12,
                                    width: width/1.2,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(8),
                                        border: Border.all(
                                            color: Color(0xff353535)
                                        )
                                    ),
                                    child: TextFormField(
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/22,
                                          color: Colors.black),
                                      keyboardType: TextInputType.number,
                                      controller: Walletamountcontroller,
                                      maxLength: 10,
                                      maxLines: 1,
                                      inputFormatters: [
                                        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                                      ],
                                      decoration: InputDecoration(
                                          counterText: "",
                                          contentPadding: EdgeInsets.only(left: width/18),
                                          border: InputBorder.none,
                                          hintText: "Type Amount",
                                          hintStyle: GoogleFonts.poppins()
                                      ),
                                      validator: (value) => value!.isEmpty ? 'Field is required' : null,
                                      onChanged: (_){
                                        // _formKey.currentState!.validate();
                                      },
                                    ),
                                  )
                                ],
                              ),
                            ),




                            GestureDetector(
                              onTap: (){
                                setState(() {
                                  Loading=true;
                                });
                                FocusManager.instance.primaryFocus?.unfocus();

                                if(int.parse(Walletamountcontroller.text)>=500){
                                  Walletamountfunction();
                                }
                                else{
                                  //Your Balance is Low Kindly Recharge Wallet Minimum Recharge Rs: 500
                                  awesomeDialog("Balance is Low","Your Balance is Low Kindly Recharge Wallet Minimum Recharge Rs: 500",1);
                                }


                              },
                              child: Center(
                                child:
                                Container(
                                  height: height/15.12,
                                  width: width/2,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8),
                                      gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Color(0xff245BCA),
                                            Color(0xff245BCA),
                                          ]
                                      )
                                  ),
                                  child: Center(
                                    child:  Text("Submit",
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                          fontSize:width/22,
                                          color: Colors.white),),
                                  ),
                                ),
                              ),
                            )

                          ]),
                    ),
                  ),
                ),

                Container(
                  height: height/4.2,
                  width: width/1.125,
                  padding: EdgeInsets.symmetric(
                      horizontal: width/36.0,
                      vertical: height/75.6
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: Color(0xffFFFFFF)
                  ),

                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text("! Note:",
                          textAlign: TextAlign.center,
                          style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                              fontSize:width/26,
                              color: Colors.black),),
                        Divider(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.circle,size: width/24,),
                            SizedBox(width: width/72,),
                            SizedBox(
                              width: width/1.290,
                              child: Text("Signature Should be clear and visible ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/28,
                                  color: Colors.black)),
                            )
                          ],
                        ),
                        SizedBox(height: height/151.2,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Icon(Icons.circle,size: width/24,),
                            SizedBox(width: width/72,),
                            SizedBox(
                              width: width/1.290,
                              child: Text("Signature Should be written only in blue ink pen ",style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                                  fontSize:width/28,
                                  color: Colors.black)),
                            )
                          ],
                        ),

                      ]),
                ),
              ],
            ),
            Loading==true?
            Container(
              height:160,
              width:160,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8)
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Please Wait...",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(fontWeight: FontWeight.w500,
                        fontSize:width/22,
                        color: Colors.black),),
                  SizedBox(height:10),
                  CircularProgressIndicator(
                    color: Color(0xff263646),
                    strokeWidth: 5,
                  ),
                ],
              ),
            )
                :const SizedBox()
          ],
        ),
      ),
    );
  }

  Walletamountfunction(){
    FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).collection("Wallet_Histroy").doc().set({
      "name":Usernamecontroller.text,
      "Phoneno":Phonecontroller.text,
      "Amount":Walletamountcontroller.text,
      "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      "time":DateFormat('hh:mm a').format(DateTime.now()),
      "userType":widget.UserType,
      "timestamp":DateTime.now().millisecondsSinceEpoch
    });
    FirebaseFirestore.instance.collection("Wallet_Transcation").doc().set({
      "name":Usernamecontroller.text,
      "Phoneno":Phonecontroller.text,
      "Amount":Walletamountcontroller.text,
      "date":"${DateTime.now().day}/${DateTime.now().month}/${DateTime.now().year}",
      "time":DateFormat('hh:mm a').format(DateTime.now()),
      "userType":widget.UserType,
      "timestamp":DateTime.now().millisecondsSinceEpoch
    });
    FirebaseFirestore.instance.collection("Users").doc(FirebaseAuth.instance.currentUser!.uid).update({
      "walletamount":FieldValue.increment(double.parse(Walletamountcontroller.text))
    });
    awesomeDialog("Success", "Add in Your Wallet Amount Successfully",3);

    setState(() {
      Usernamecontroller.clear();
      Phonecontroller.clear();
      Walletamountcontroller.clear();
      Loading=false;
    });


  }

  awesomeDialog(title,description,errortype){
    return AwesomeDialog(
      dismissOnBackKeyPress: errortype==3?true:false,
      dismissOnTouchOutside:errortype==3? true:false,
      context: context,
      dialogType:errortype==1? DialogType.error:errortype==2?DialogType.warning:errortype==3?DialogType.success:DialogType.error,
      animType: AnimType.rightSlide,
      title: title,
      desc: description,
      btnOkOnPress: () {
        setState(() {
          Loading=false;
        });
        Navigator.pop(context);

      },
    )..show();
  }




}
