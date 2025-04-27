import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/diagnostics/wallet_model.dart';
import 'package:cradenthealth/models/doctors/bookAppointment_model.dart';
import 'package:cradenthealth/models/doctors/booking_history_doctors_model.dart';
import 'package:cradenthealth/models/doctors/doctor_model.dart';
import 'package:cradenthealth/models/profile_model.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:cradenthealth/services/doctor_service.dart';
import 'package:cradenthealth/services/profile_service.dart';
import 'package:cradenthealth/services/wallet_service.dart';
import 'package:get/get.dart';

class DoctorsController extends GetxController {
  RxList<DoctorModel> doctorModel = <DoctorModel>[].obs;
  var bookingHistoryDoctorsResponseModel =
      BookingHistoryDoctorsResponseModel().obs;
  var appointmentModel = AppointmentModel().obs;

  final DoctorService doctorService;

  var isLoading = false.obs; // Observable for loading state
  var isLoadingBookDoctorAppointment =
      false.obs; // Observable for loading state
  var isLoadingDoctorsBookingHistory =
      false.obs; // Observable for loading state
  var isLoadingDoctorsPayment = false.obs; // Observable for loading state
  DoctorsController(this.doctorService);

  final selectedAvailableDateIndex = 0.obs; // Observable variable
  final selectedtimeSlotIndex = 0.obs; // Observable variable
  final selectedAvailableDate = "".obs; // Observable variable
  final selectedtimeSlot = "".obs; // Observable variable

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
      isLoadingBookDoctorAppointment.value = true; // Set loading to false
      appointmentModel.value = await doctorService.bookDoctorAppointment(
          diagnosticId: diagnosticId,
          patientName: patientName,
          patientRelation: patientRelation,
          appointmentDate: appointmentDate,
          appointmentTime: appointmentTime);

      isLoadingBookDoctorAppointment.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingBookDoctorAppointment.value = false; // Set loading to false
    } finally {
      isLoadingBookDoctorAppointment.value = false; // Set loading to false
    }
  }

  void fetchDoctorsBookingHistory({required String status}) async {
    try {
      isLoadingDoctorsBookingHistory.value = true; // Set loading to false
      bookingHistoryDoctorsResponseModel.value =
          await doctorService.fetchDoctorsBookingHistory(status: status);
      isLoadingDoctorsBookingHistory.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingDoctorsBookingHistory.value = false; // Set loading to false
    } finally {
      isLoadingDoctorsBookingHistory.value = false; // Set loading to false
    }
  }

  void paymentDoctorBooking({
    required String bookingId,
  }) async {
    try {
      isLoadingDoctorsPayment.value = true; // Set loading to false
      await doctorService.paymentDoctorBooking(bookingId: bookingId);
      isLoadingDoctorsPayment.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingDoctorsPayment.value = false; // Set loading to false
    } finally {
      isLoadingDoctorsPayment.value = false; // Set loading to false
    }
  }

  @override
  void onInit() {
    // fetchSupportService(); // Fetch data on controller initialization
    super.onInit();
  }
}
