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
  }) async {
    try {
      isLoadingDiagnosticCheckout.value = true; // Set loading to false
      diagnosticCheckoutResponse.value = await diagnosticService
          .fetchDiagnosticsCheckout(diagnosticId: diagnosticId, tests: tests);
      isLoadingDiagnosticCheckout.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingDiagnosticCheckout.value = false; // Set loading to false
    } finally {
      isLoadingDiagnosticCheckout.value = false; // Set loading to false
    }
  }

  Future<void> deleteTests(
      {required String testId, required String bookingId}) async {
    // Find the index of the test in the list
    print('Test with ID $testId removed successfully.');
    int testIndex = diagnosticCheckoutResponse.value.booking!.tests!
        .indexWhere((test) => test.id == testId);

    if (testIndex != -1) {
      // Remove the test from the list
      diagnosticCheckoutResponse.value.booking!.tests!.removeAt(testIndex);
      diagnosticCheckoutResponse.refresh();

      try {
        isLoadingDiagnosticTests.value = true; // Set loading to false
        await diagnosticService.removeDiagnosticsTests(
            bookingId: bookingId, testId: testId);
        isLoadingDiagnosticTests.value = false; // Set loading to false
      } catch (e) {
        // Handle error
        isLoadingDiagnosticTests.value = false; // Set loading to false
      } finally {
        isLoadingDiagnosticTests.value = false; // Set loading to false
      }

      print('Test with ID $testId removed successfully.');
    } else {
      print('Test with ID $testId not found.');
    }
  }

  var selectedDiagnosticTests = <TestModel>[].obs;

  // int get totalPrice => selectedTests.fold(0, (sum, item) => sum + int.parse(item.price!));
  // int get totalOfferPrice =>
  //     selectedTests.fold(0, (sum, item) => sum + item.offerPrice);
  // List<String> get selectedIds => selectedTests.map((e) => e.id).toList();
  // List<String> get selectedNames =>
  //     selectedTests.map((e) => e.testName!).toList();

  void addDiagnosticTest(TestModel test) {
    if (selectedDiagnosticTests.any((e) => e.id == test.id)) {
      selectedDiagnosticTests.removeWhere((e) => e.id == test.id);
      print("selectedTests${selectedDiagnosticTests}");
    } else {
      selectedDiagnosticTests.add(test);
      print("selectedTests${selectedDiagnosticTests}");
    }
  }

  void bookDiagnosticsTests({
    required String bookingId,
  }) async {
    try {
      isLoadingDiagnosticBooking.value = true; // Set loading to false
      await diagnosticService.bookDiagnosticsTests(bookingId: bookingId);
      isLoadingDiagnosticBooking.value = false; // Set loading to false
    } catch (e) {
      // Handle error
      isLoadingDiagnosticBooking.value = false; // Set loading to false
    } finally {
      isLoadingDiagnosticBooking.value = false; // Set loading to false
    }
  }

  void fetchDiagnosticHistory() async {
    try {
      isLoadingDiagnosticBookingHistory.value = true; // Set loading to false
      bookingsHistoryDiagnosticResponseModel.value =
          await diagnosticService.fetchDiagnosticHistory();
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
