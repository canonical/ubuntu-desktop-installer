class WizardData {
  const WizardData({this.totalSteps});
  final int? totalSteps;
}

class WizardRouteData {
  const WizardRouteData({
    this.step,
    this.canGoBack,
    this.canGoNext,
  });
  final int? step;
  final bool? canGoBack;
  final bool? canGoNext;
}
