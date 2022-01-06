part of 'who_are_you_page.dart';

// class _LoginStrategyTile extends StatelessWidget {
//   const _LoginStrategyTile({
//     Key? key,
//     required this.value,
//     required this.label,
//   }) : super(key: key);

//   final LoginStrategy value;
//   final String label;

//   @override
//   Widget build(BuildContext context) {
//     final loginStrategy = context
//         .select<WhoAreYouModel, LoginStrategy>((model) => model.loginStrategy);

//     return RadioButton<LoginStrategy>(
//       title: Text(label),
//       contentPadding: EdgeInsets.only(left: _kRadioButtonIndentation),
//       value: value,
//       groupValue: loginStrategy,
//       onChanged: (value) {
//         final model = Provider.of<WhoAreYouModel>(context, listen: false);
//         model.loginStrategy = value!;
//       },
//     );
//   }
// }
