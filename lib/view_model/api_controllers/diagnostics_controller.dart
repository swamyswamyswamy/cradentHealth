import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:get/get.dart';

class DiagnosticsController extends GetxController {
  var diagnosticResponse = DiagnosticResponse().obs;
  var diagnosticTestResponse = DiagnosticTestResponse().obs;
  final DiagnosticService diagnosticService;

  var isLoading = false.obs; // Observable for loading state
  var isLoadingDiagnosticTests = false.obs; // Observable for loading state
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

  void fetchDiagnosticsTests({required String diagnosticId}) async {
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

  @override
  void onInit() {
    // fetchSupportService(); // Fetch data on controller initialization
    super.onInit();
  }
}
