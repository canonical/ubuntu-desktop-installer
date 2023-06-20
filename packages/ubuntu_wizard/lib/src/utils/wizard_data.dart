class WizardData {
  const WizardData({this.totalSteps});
  final int? totalSteps;
}

class WizardRouteData {
  const WizardRouteData({
    this.step,
    this.hasPrevious,
    this.hasNext,
  });
  final int? step;
  final bool? hasPrevious;
  final bool? hasNext;
}
