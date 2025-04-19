import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/diagnostics/wallet_model.dart';
import 'package:cradenthealth/models/doctor_model.dart';
import 'package:cradenthealth/models/profile_model.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:cradenthealth/services/doctor_service.dart';
import 'package:cradenthealth/services/profile_service.dart';
import 'package:cradenthealth/services/wallet_service.dart';
import 'package:get/get.dart';

class DoctorsController extends GetxController {
  RxList<DoctorModel> doctorModel = <DoctorModel>[].obs;

  final DoctorService doctorService;

  var isLoading = false.obs; // Observable for loading state

  DoctorsController(this.doctorService);

  void fetctDoctors() async {
    try {
      isLoading.value = true; // Set loading to false
      doctorModel.value = await doctorService.fetchDoctors();
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
