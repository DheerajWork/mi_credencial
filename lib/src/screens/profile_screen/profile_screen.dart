import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mi_credencial/src/custom_widgets/custom_textfield.dart';
import 'package:mi_credencial/src/custom_widgets/profile_col.dart';
import 'package:mi_credencial/src/global/global.dart';
import 'package:mi_credencial/src/model_class/user_detail_model.dart';
import 'package:mi_credencial/src/screens/home_screen/home_screen.dart';
import 'package:mi_credencial/src/utils/my_colors.dart';
import 'package:mi_credencial/src/utils/my_style.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  UserDetailModel? userDetails;

  getData() async {
    http.Response response = await http.get(Uri.parse(
        "https://api.micredencial.com.ar/affiliate/C9950BEA9012437494FDDD3EE8DC601A"));

    var data = jsonDecode(response.body);

    userDetails =
        (data as List).map((e) => UserDetailModel.fromJson(e)).toList().first;

    setState(() {});
  }

  TextEditingController emailCont =
      TextEditingController(text: "mail@gmal.com");
  TextEditingController phoneCont = TextEditingController(text: "123456");

  update() async {
    var abc = {"dS_MAIL": emailCont.text, "dS_PHONE": phoneCont.text};
    print("body++++++++++++++++++++$abc");
    print("asdfsdfasdfsdfsdf");
    http.Response response = await http.put(
        Uri.parse(
            'https://api.micredencial.com.ar/affiliate/updateContact/C9950BEA9012437494FDDD3EE8DC601A'),
        body:
            jsonEncode({"dS_MAIL": emailCont.text, "dS_PHONE": phoneCont.text}),
        headers: <String, String>{
          'Content-Type': 'application/json',
        });
    print("body++++++++++++++++++++${response.statusCode}");
    var data = jsonDecode(response.body);

    if (response.statusCode == 200) {
      // ignore: use_build_context_synchronously
      Navigator.pop(context);
      getData();
    } else {
      print("ERRORRRRR");
    }

    print("data----------------$data");
    setState(() {});
  }

  _bottomSheet(context) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (c) {
          return Padding(
            padding: EdgeInsets.only(
                bottom: MediaQuery.of(context).viewInsets.bottom),
            child: Container(
              width: double.infinity,
              height: 472,
              decoration: BoxDecoration(
                  // ignore: deprecated_member_use
                  color: Theme.of(context).bottomAppBarColor,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(50),
                      topRight: Radius.circular(50))),
              child: Padding(
                padding: const EdgeInsets.only(
                    right: 15, left: 15, bottom: 10, top: 20),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: Icon(Icons.close)),
                      ],
                    ),
                    Text(
                      "Actualizar Datos",
                      style: MyStyles.black20Regular
                          .copyWith(color: Theme.of(context).hintColor),
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Es importante que actualice sus datos de contacto",
                      style: MyStyles.gray15Light
                          .copyWith(color: Theme.of(context).canvasColor),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    CustomTextField(
                      icon: false,
                      hint: "xxxxxxxxxx",
                      title: "Teléfono",
                      keyboardType: TextInputType.number,
                      controller: phoneCont,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomTextField(
                      icon: false,
                      hint: "e-mail",
                      title: "e-mail",
                      keyboardType: TextInputType.emailAddress,
                      controller: emailCont,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          update();
                          getData();
                        });
                      },
                      child: Container(
                        width: 236,
                        height: 46,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: MyColors.bgClr,
                          border:
                              Border.all(color: MyColors.themeClr, width: 1.5),
                        ),
                        child: Center(
                          child: Text("Actualizar",
                              style: MyStyles.blue18Light.copyWith(
                                  fontSize: 20, fontWeight: FontWeight.w600)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  Future pickImage() async {
    final returnedImage = await ImagePicker().pickImage(
      source: ImageSource.camera,
    );

    setState(() {
      GlobalClass.selectImage = File(returnedImage!.path);
      imageUpload();
    });
  }

  imageUpload() async {
    http.Response response = await http.post(Uri.parse(
        "https://api.micredencial.com.ar/affiliate/uploadPhoto/C9950BEA9012437494FDDD3EE8DC601A"));
    print(response.statusCode);
    print("------------------${response.body}");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
    imageUpload();
  }

  @override
  Widget build(BuildContext context) {
    var data = userDetails;
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (_)=> const HomeScreen()));
            },
            child:
                Icon(Icons.arrow_back_ios, color: Theme.of(context).hintColor)),
        elevation: 0,
        backgroundColor: Theme.of(context).appBarTheme.backgroundColor,
        title: Text("Mis datos",
            style: TextStyle(color: Theme.of(context).hintColor)),
        centerTitle: true,
      ),
      body: userDetails == null
          ? const Center(child: CircularProgressIndicator())
          : Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: GestureDetector(
                        onTap: () {
                          pickImage();
                        },
                        child: Stack(
                          children: [
                            SizedBox(
                              width: 170,
                              height: 164,
                              child: Center(
                                child: Container(
                                    width: 147,
                                    height: 141,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: MyColors.themeClr,
                                            width: 3)),
                                    child: GlobalClass.selectImage != null
                                        ? ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(8),
                                            child: Image.file(
                                              GlobalClass.selectImage!,
                                              fit: BoxFit.cover,
                                            ))
                                        : const SizedBox()),
                              ),
                            ),
                            Positioned(
                              right: 0,
                              bottom: 0,
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: MyColors.themeClr),
                                child: Center(
                                  child:
                                      Icon(Icons.edit, color: MyColors.white),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    ProfileCol(
                      title: "Nombre y apellido",
                      text: data!.dsName,
                    ),
                    ProfileCol(
                      title: "Documento",
                      text: data.dsDocument,
                    ),
                    ProfileCol(
                      title: "CUIL",
                      text: data.dsCuil,
                    ),
                    ProfileCol(
                      title: "Fecha de nacimiento",
                      text: data.dtBirthday,
                    ),
                    ProfileCol(
                      title: "Teléfono",
                      text: data.dsPhone,
                    ),
                    ProfileCol(
                      title: "Dirección",
                      text: data.dsAddress,
                    ),
                    ProfileCol(
                      title: "Localidad",
                      text: data.dsCity,
                    ),
                    ProfileCol(
                      title: "Provincia",
                      text: data.dsProvince,
                    ),
                    ProfileCol(
                      title: "Empresa",
                      text: data.dsCompany,
                    ),
                    ProfileCol(
                      title: "Seccional",
                      text: data.dsSeccional,
                    ),
                    ProfileCol(
                      title: "e-mail",
                      text: data.dsMail,
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Center(
                      child: InkWell(
                        onTap: () {
                          _bottomSheet(context);
                        },
                        child: Container(
                          width: 236,
                          height: 46,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: MyColors.bgClr,
                            border: Border.all(
                                color: MyColors.themeClr, width: 1.5),
                          ),
                          child: Center(
                            child: Text("Editar datos",
                                style: MyStyles.blue18Light.copyWith(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
