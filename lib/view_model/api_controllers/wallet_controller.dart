import 'package:cradenthealth/models/diagnostics/diagnosticlist_model.dart';
import 'package:cradenthealth/models/diagnostics/wallet_model.dart';
import 'package:cradenthealth/services/diagnostic_service.dart';
import 'package:cradenthealth/services/wallet_service.dart';
import 'package:get/get.dart';

class WalletController extends GetxController {
  var walletResponse = WalletResponse().obs;

  final WalletService walletService;

  var isLoading = false.obs; // Observable for loading state

  WalletController(this.walletService);

  void fetcthWallet() async {
    try {
      isLoading.value = true; // Set loading to false
      walletResponse.value = await walletService.fetcthWallet();
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
