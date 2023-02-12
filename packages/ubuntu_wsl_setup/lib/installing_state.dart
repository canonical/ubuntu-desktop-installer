import 'package:subiquity_client/subiquity_client.dart';

extension InstallingState on ApplicationState {
  bool get isInstalling =>
      index > ApplicationState.STARTING_UP.index &&
      index < ApplicationState.DONE.index;
}
