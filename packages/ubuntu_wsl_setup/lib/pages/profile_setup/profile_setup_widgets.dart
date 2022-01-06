part of 'profile_setup_page.dart';

// NOTE: The "Show advanced options" checkbox was temporarily removed (#431).
//       See [ProfileSetupModel.showAdvancedOptions] for more details.
//
// class _ShowAdvancedOptionsCheckButton extends StatelessWidget {
//   const _ShowAdvancedOptionsCheckButton({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     final lang = AppLocalizations.of(context);
//     final showAdvancedOptions = context
//         .select<ProfileSetupModel, bool>((model) => model.showAdvancedOptions);

//     return Align(
//       alignment: Alignment.topLeft,
//       child: IntrinsicWidth(
//         child: CheckButton(
//           contentPadding: kContentPadding,
//           title: Text(lang.profileSetupShowAdvancedOptions),
//           value: showAdvancedOptions,
//           onChanged: (value) {
//             final model =
//                 Provider.of<ProfileSetupModel>(context, listen: false);
//             model.showAdvancedOptions = value!;
//           },
//         ),
//       ),
//     );
//   }
// }
