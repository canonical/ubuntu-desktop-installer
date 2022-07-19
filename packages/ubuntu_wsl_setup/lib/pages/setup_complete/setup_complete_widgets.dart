part of 'setup_complete_page.dart';

class _CodeLabel extends StatelessWidget {
  const _CodeLabel(this.code);

  final String code;

  @override
  Widget build(BuildContext context) {
    final style = Theme.of(context).textTheme.bodyText1!.copyWith(
          fontFamily: 'Ubuntu Mono',
          backgroundColor: Theme.of(context).highlightColor,
        );
    return Text(code, style: style);
  }
}
