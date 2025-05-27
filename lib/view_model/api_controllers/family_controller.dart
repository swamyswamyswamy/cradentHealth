import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/diagnostics/wallet_model.dart';
import 'package:cradenthealth/models/familyMember_model.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:cradenthealth/services/family_service.dart';
import 'package:cradenthealth/services/wallet_service.dart';
import 'package:get/get.dart';

class FamilyController extends GetxController {
  var familyResponseModel = FamilyResponseModel().obs;

  final FamilyService familyService;

  var isLoadingCreateFamilyMember = false.obs; // Observable for loading state

  var isLoading = false.obs; // Observable for loading state
  FamilyController(this.familyService);

  void fetchFamilyList() async {
    try {
      isLoading.value = true; // Set loading to false
      familyResponseModel.value = await familyService.fetchFamilyList();
      isLoading.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoading.value = false; // Set loading to false
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  void createFamilyMember({
    required String fullName,
    required String mobileNumber,
    required String age,
    required String gender,
    required String DOB,
    required String height,
    required String weight,
    required String eyeSight,
    required String BMI,
    required String BP,
    required String sugar,
    required String relation,
  }) async {
    try {
      isLoadingCreateFamilyMember.value = true; // Set loading to false
      await familyService.createFamilyMember(
          fullName: fullName,
          mobileNumber: mobileNumber,
          age: age,
          gender: gender,
          DOB: DOB,
          height: height,
          weight: weight,
          eyeSight: eyeSight,
          BMI: BMI,
          BP: BP,
          sugar: sugar,
          relation: relation);
      isLoadingCreateFamilyMember.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingCreateFamilyMember.value = false; // Set loading to false
    } finally {
      isLoadingCreateFamilyMember.value = false; // Set loading to false
    }
  }

//ui
  var fullName = ''.obs;
  var mobileNumber = ''.obs;
  var age = 0.obs;
  var gender = ''.obs;
  var DOB = ''.obs;
  var height = 0.obs;
  var weight = 0.obs;
  var eyeSight = ''.obs;
  var BMI = 0.0.obs;
  var BP = ''.obs;
  var sugar = ''.obs;
  var relation = ''.obs;
  var staffId = ''.obs;
//ui

  var selectedPatientName = ''.obs;
  var selectedPatientAge = ''.obs;
  var selectedPatientGender = ''.obs;

  void deleteFamilyMember({required String familyId}) async {
    try {
      // isLoading.value = true; // Set loading to false
      await familyService.deleteFamilyMember(familyId: familyId);
      isLoading.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoading.value = false; // Set loading to false
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  @override
  void onInit() {
    // fetchSupportService(); // Fetch data on controller initialization
    super.onInit();
  }
}
