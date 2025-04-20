import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/diagnostics/wallet_model.dart';
import 'package:cradenthealth/models/doctors/bookAppointment_model.dart';
import 'package:cradenthealth/models/doctors/doctor_model.dart';
import 'package:cradenthealth/models/profile_model.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:cradenthealth/services/doctor_service.dart';
import 'package:cradenthealth/services/profile_service.dart';
import 'package:cradenthealth/services/wallet_service.dart';
import 'package:get/get.dart';

class DoctorsController extends GetxController {
  RxList<DoctorModel> doctorModel = <DoctorModel>[].obs;
  var appointmentModel = AppointmentModel().obs;

  final DoctorService doctorService;

  var isLoading = false.obs; // Observable for loading state

  DoctorsController(this.doctorService);

  final selectedAvailableDate = 0.obs; // Observable variable

  // Method to update the selectedAvailableDate field
  void updateSelectedAvailableDate(int value) {
    selectedAvailableDate.value = value;
  }

  final selectedtimeSlot = 0.obs; // Observable variable

  // Method to update the selectedAvailableDate field
  void updateSelectedtimeSlot(int value) {
    selectedtimeSlot.value = value;
  }

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

  void bookDoctorAppointment({
    required String diagnosticId,
    required String patientName,
    required String patientRelation,
    required String appointmentDate, // Format: yyyy-MM-dd
    required String appointmentTime, // Format: HH:mm
  }) async {
    try {
      isLoading.value = true; // Set loading to false
      appointmentModel.value = await doctorService.bookDoctorAppointment(
          diagnosticId: diagnosticId,
          patientName: patientName,
          patientRelation: patientRelation,
          appointmentDate: appointmentDate,
          appointmentTime: appointmentTime);


          
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
