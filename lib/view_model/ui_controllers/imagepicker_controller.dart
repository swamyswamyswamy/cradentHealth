import 'dart:io';
import 'package:cradenthealth/view_model/api_controllers/profile_controller.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerController extends GetxController {
  var uploadImage = Rx<File?>(null);
  var panDocumentImage = Rx<File?>(null);
  var voterIdDocmentImage = Rx<File?>(null);
  var rcNoDocumentImage = Rx<File?>(null);
  var drivingLicensceDocumentImage = Rx<File?>(null);
  var aadhaarNoDocumentImage = Rx<File?>(null);
  var profilePhotoPersonalInfoImage = Rx<File?>(null);

  Future<void> pickImage(
      {required String imageType, bool isEditProfile = false}) async {
    // final _profileController = Get.find<ProfileController>();
    print("fdfddffdd");

    //  final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    // if (image != null) {
    //   carFrontImagePath.value = image.path;
    // }
    try {
      final image = await ImagePicker()
          .pickImage(source: ImageSource.gallery, imageQuality: 50);
      if (image != null) {
        if (imageType == "uploadImage") {
          uploadImage.value = File(image.path);
          if (isEditProfile) {
            final _profileController = Get.find<ProfileController>();
            _profileController.upadateProfile(
                profileImage: uploadImage.value!.path);
          }
        } else if (imageType == "panDocumentImage") {
          panDocumentImage.value = File(image.path);
        } else if (imageType == "voterIdDocmentImage") {
          voterIdDocmentImage.value = File(image.path);
        } else if (imageType == "rcNoDocumentImage") {
          rcNoDocumentImage.value = File(image.path);
        } else if (imageType == "drivingLicensceDocumentImage") {
          drivingLicensceDocumentImage.value = File(image.path);
        } else if (imageType == "aadhaarNoDocumentImage") {
          aadhaarNoDocumentImage.value = File(image.path);
        } else if (imageType == "profilePhotoPersonalInfoImage") {
          profilePhotoPersonalInfoImage.value = File(image.path);
        }
      }
    } catch (e) {
      print("Exception occurred: $e");
    }
  }

  void resetImage() {
    uploadImage.value = null;
    panDocumentImage.value = null;
    voterIdDocmentImage.value = null;
    rcNoDocumentImage.value = null;
    drivingLicensceDocumentImage.value = null;
    aadhaarNoDocumentImage.value = null;
    profilePhotoPersonalInfoImage.value = null;
  }
}
