import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/diagnostics/wallet_model.dart';
import 'package:cradenthealth/models/profile_model.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:cradenthealth/services/profile_service.dart';
import 'package:cradenthealth/services/wallet_service.dart';
import 'package:get/get.dart';

class ProfileController extends GetxController {
  var profileModelResponse = ProfileModelResponse().obs;

  final ProfileService profileService;

  var isLoading = false.obs; // Observable for loading state

  ProfileController(this.profileService);

  void fetctProfile() async {
    try {
      isLoading.value = true; // Set loading to false
      profileModelResponse.value = await profileService.fetctProfile();
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
