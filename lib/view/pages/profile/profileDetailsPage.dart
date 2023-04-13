import 'dart:io';

import 'package:enayas_app/services/configs/appColors.dart';
import 'package:enayas_app/services/configs/appUtils.dart';
import 'package:enayas_app/services/helpers/allController.dart';
import 'package:enayas_app/services/helpers/imageToBase64.dart';
import 'package:enayas_app/view/widgets/buttons/backButton.dart';
import 'package:enayas_app/view/widgets/buttons/iconButton.dart';
import 'package:enayas_app/view/widgets/buttons/primaryButton.dart';
import 'package:enayas_app/view/widgets/formfield/cFormField.dart';
import 'package:enayas_app/view/widgets/text/kText.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ProfileDetailsPage extends StatefulWidget {
  @override
  State<ProfileDetailsPage> createState() => _ProfileDetailsPageState();
}

class _ProfileDetailsPageState extends State<ProfileDetailsPage> {
  String? pickedImage;
  pickImage() async {
    var image = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      pickedImage = image!.path;
    });

    File file = File(image!.path);
    String base64String = await fileToBase64(file);

    AllController.profileC
        .uploadProfilePic(image.name.toString(), base64String);

    debugPrint(base64String);
  }

  @override
  Widget build(BuildContext context) {
    AllController.profileC.getProfileInfo();
    return Scaffold(
      appBar: AppBar(
        leading: backButton(),
        title: KText(text: 'Profile'),
        elevation: .5,
      ),
      body: Padding(
        padding: Apputils.paddingAll10,
        child: Obx(
          () => ListView(
            children: [
              Align(
                alignment: Alignment.center,
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    pickedImage == null
                        ? CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.transparent,
                            backgroundImage: NetworkImage(
                              AllController
                                  .profileC.profileInfo.value.avatarOriginal
                                  .toString(),
                            ),
                          )
                        : CircleAvatar(
                            radius: 50,
                            backgroundColor: AppColors.transparent,
                            backgroundImage: FileImage(
                              File(
                                pickedImage.toString(),
                              ),
                            ),
                          ),
                    Positioned(
                      bottom: 5,
                      right: -5,
                      child: CircleAvatar(
                        radius: 15,
                        backgroundColor: AppColors.grey100,
                        child: iconButton(
                          onTap: () => pickImage(),
                          icons: Icons.add_a_photo,
                          iconColor: AppColors.black54,
                          iconSize: 14,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Apputils.sizeH30,
              KText(
                text: 'Name:',
                color: AppColors.black54,
              ),
              Apputils.sizeH5,
              cFormField(
                hintText: 'Name',
                controller: AllController.profileC.name.value,
                filledColor: AppColors.grey100,
              ),
              Apputils.sizeH10,
              KText(
                text: 'Email:',
                color: AppColors.black54,
              ),
              Apputils.sizeH5,
              cFormField(
                controller: AllController.profileC.email.value,
                hintText: 'Email',
                filledColor: AppColors.grey100,
              ),
              Apputils.sizeH10,
              KText(
                text: 'Phone:',
                color: AppColors.black54,
              ),
              Apputils.sizeH5,
              cFormField(
                hintText: 'Phone',
                controller: AllController.profileC.phone.value,
                filledColor: AppColors.grey100,
              ),
              Apputils.sizeH20,
              primaryButton(
                onTap: () => AllController.profileC.profileUpdate(),
                height: 40,
                buttonName: 'Save',
                fontSize: 16,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
