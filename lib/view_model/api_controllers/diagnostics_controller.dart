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

  @override
  void onInit() {
    // fetchSupportService(); // Fetch data on controller initialization
    super.onInit();
  }
}
