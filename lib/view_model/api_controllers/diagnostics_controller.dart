import 'package:cradenthealth/models/diagnostics/booking_history_diagnostic.dart';
import 'package:cradenthealth/models/diagnostics/diagnostic_checkout_model.dart';
import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:get/get.dart';

class DiagnosticsController extends GetxController {
  var diagnosticResponse = DiagnosticResponse().obs;
  var diagnosticTestResponse = DiagnosticTestResponse().obs;
  var diagnosticCheckoutResponse = DiagnosticCheckoutResponse().obs;
  var bookingsHistoryDiagnosticResponseModel =
      BookingsHistoryDiagnosticResponseModel().obs;
  final DiagnosticService diagnosticService;

  var isLoading = false.obs; // Observable for loading state
  var isLoadingDiagnosticTests = false.obs; // Observable for loading state
  var isLoadingDiagnosticCheckout = false.obs; // Observable for loading state
  var isLoadingDiagnosticBooking = false.obs; // Observable for loading state
  var isLoadingDiagnosticBookingHistory =
      false.obs; // Observable for loading state
  DiagnosticsController(this.diagnosticService);

  void fetchDiagnostics() async {
    try {
      isLoading.value = true; // Set loading to false
      diagnosticResponse.value = await diagnosticService.fetchDiagnostics();
      isLoading.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoading.value = false; // Set loading to false
    } finally {
      isLoading.value = false; // Set loading to false
    }
  }

  void fetchDiagnosticsTests({
    required String diagnosticId,
  }) async {
    try {
      isLoadingDiagnosticTests.value = true; // Set loading to false
      diagnosticTestResponse.value = await diagnosticService
          .fetchDiagnosticsTests(diagnosticId: diagnosticId);
      isLoadingDiagnosticTests.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingDiagnosticTests.value = false; // Set loading to false
    } finally {
      isLoadingDiagnosticTests.value = false; // Set loading to false
    }
  }

  void fetchDiagnosticsCheckout({
    required String diagnosticId,
    required List tests,
    required String gender,
    required String patient_name,
    required String age,
    required String packageId,
  }) async {
    try {
      isLoadingDiagnosticCheckout.value = true; // Set loading to false
      diagnosticCheckoutResponse.value =
          await diagnosticService.fetchDiagnosticsCheckout(
              diagnosticId: diagnosticId,
              gender: gender,
              patient_name: patient_name,
              age: age,
              packageId: packageId,
              tests: tests);
      isLoadingDiagnosticCheckout.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingDiagnosticCheckout.value = false; // Set loading to false
    } finally {
      isLoadingDiagnosticCheckout.value = false; // Set loading to false
    }
  }

  Future<void> deleteTests(
      {required String testId,
      required String packageId,
      required String bookingId}) async {
    // Find the index of the test in the list
    // print('Test with ID $testId removed successfully.');

    if (diagnosticTestType.value == "tests") {
      int testIndex = diagnosticCheckoutResponse.value.booking!.tests!
          .indexWhere((test) => test.id == testId);

      // Remove the test from the list
      diagnosticCheckoutResponse.value.booking!.tests!.removeAt(testIndex);
      selectedDiagnosticTests.removeWhere((e) => e.id == testId);
    } else {
      diagnosticCheckoutResponse.value.booking!.tests!.clear();
      selectedDiagnosticTests.removeWhere((e) => e.id == packageId);
    }

    diagnosticCheckoutResponse.refresh();

    try {
      isLoadingDiagnosticTests.value = true; // Set loading to false
      await diagnosticService.removeDiagnosticsTests(
          packageId: packageId, bookingId: bookingId, testId: testId);

      isLoadingDiagnosticTests.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingDiagnosticTests.value = false; // Set loading to false
    } finally {
      isLoadingDiagnosticTests.value = false; // Set loading to false
    }

    print('Test with ID $testId removed successfully.');
  }

  var selectedDiagnosticTests = <TestModel>[].obs;

  // int get totalPrice => selectedTests.fold(0, (sum, item) => sum + int.parse(item.price!));
  // int get totalOfferPrice =>
  //     selectedTests.fold(0, (sum, item) => sum + item.offerPrice);
  // List<String> get selectedIds => selectedTests.map((e) => e.id).toList();
  // List<String> get selectedNames =>
  //     selectedTests.map((e) => e.testName!).toList();

  var diagnosticTestType = "tests".obs;
  void addDiagnosticTest(TestModel test) {
    if (selectedDiagnosticTests.any((e) => e.id == test.id)) {
      selectedDiagnosticTests.removeWhere((e) => e.id == test.id);
      print("selectedTests${selectedDiagnosticTests}");
    } else {
      if (diagnosticTestType != "tests" && selectedDiagnosticTests.isNotEmpty) {
        selectedDiagnosticTests.clear();
        selectedDiagnosticTests.add(test);
      } else {
        selectedDiagnosticTests.add(test);
      }

      print("selectedTests${selectedDiagnosticTests}");
    }
  }

  void paymentDiagnosticsTests({
    required String bookingId,
  }) async {
    try {
      isLoadingDiagnosticBooking.value = true; // Set loading to false
      await diagnosticService.paymentDiagnosticsTests(bookingId: bookingId);
      isLoadingDiagnosticBooking.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingDiagnosticBooking.value = false; // Set loading to false
    } finally {
      isLoadingDiagnosticBooking.value = false; // Set loading to false
    }
  }

  void fetchDiagnosticHistory({required String status}) async {
    try {
      isLoadingDiagnosticBookingHistory.value = true; // Set loading to false
      bookingsHistoryDiagnosticResponseModel.value =
          await diagnosticService.fetchDiagnosticHistory(status: status);
      isLoadingDiagnosticBookingHistory.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingDiagnosticBookingHistory.value = false; // Set loading to false
    } finally {
      isLoadingDiagnosticBookingHistory.value = false; // Set loading to false
    }
  }

  @override
  void onInit() {
    // fetchSupportService(); // Fetch data on controller initialization
    super.onInit();
  }
}
