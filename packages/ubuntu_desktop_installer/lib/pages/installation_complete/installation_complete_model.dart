import 'package:subiquity_client/subiquity_client.dart';
import 'package:ubuntu_desktop_installer/services.dart';

/// View model for [InstallationCompletePage].
class InstallationCompleteModel {
  /// Creates an instance with the given client.
  InstallationCompleteModel(this._client, this._product);

  final SubiquityClient _client;
  final ProductService _product;

  ProductInfo get productInfo => _product.getProductInfo();

  Future<void> reboot() => _client.reboot(immediate: false);
}
