


import 'app_localizations.dart';

/// The translations for Vietnamese (`vi`).
class AppLocalizationsVi extends AppLocalizations {
  AppLocalizationsVi([String locale = 'vi']) : super(locale);

  @override
  String get appTitle => 'Ubuntu WSL';

  @override
  String get windowTitle => 'Ubuntu WSL';

  @override
  String get exitButton => 'Thoát';

  @override
  String get finishButton => 'Hoàn thành';

  @override
  String get saveButton => 'lưu';

  @override
  String get setupButton => 'thiết lập';

  @override
  String get selectLanguageTitle => 'chọn ngôn ngữ của bạn';

  @override
  String get profileSetupTitle => 'Thiết lập hồ sơ';

  @override
  String get profileSetupHeader => 'Please create a default UNIX user account. For more information visit: <a href=\"https://aka.ms/wslusers\">https://aka.ms/wslusers</a>';

  @override
  String get profileSetupRealnameLabel => 'tên của bạn';

  @override
  String get profileSetupRealnameRequired => 'Một cái tên là bắt buộc';

  @override
  String get profileSetupUsernameHint => 'Chọn một tên người dùng';

  @override
  String get profileSetupUsernameHelper => 'Tên người dùng không cần phải khớp với tên người dùng windows của bạn.';

  @override
  String get profileSetupPasswordHint => 'Chọn một mật khẩu';

  @override
  String get profileSetupConfirmPasswordHint => 'Xác nhận mật khẩu của bạn';

  @override
  String get profileSetupShowAdvancedOptions => 'Hiển thị các tùy chọn nâng cao trang tiếp theo';

  @override
  String get profileSetupPasswordMismatch => 'Mật khẩu không trùng khớp';

  @override
  String get profileSetupUsernameRequired => 'Yêu cầu tên người dùng';

  @override
  String get profileSetupUsernameInvalid => 'Tên người dùng không hợp lệ';

  @override
  String get profileSetupPasswordRequired => 'Mật khẩu là bắt buộc';

  @override
  String get advancedSetupTitle => 'Cài đặt nâng cao';

  @override
  String get advancedSetupHeader => 'Trong trang này, bạn có thể điều chỉnh Ubuntu WSL theo nhu cầu của mình.';

  @override
  String get advancedSetupMountLocationHint => 'Mount location';

  @override
  String get advancedSetupMountLocationHelper => 'Location for the automount';

  @override
  String get advancedSetupMountLocationInvalid => 'The location is invalid';

  @override
  String get advancedSetupMountOptionHint => 'Mount option';

  @override
  String get advancedSetupMountOptionHelper => 'Mount option passed for the automount';

  @override
  String get advancedSetupHostGenerationTitle => 'Enable Host Generation';

  @override
  String get advancedSetupHostGenerationSubtitle => 'Selecting enables /etc/hosts re-generation at every start.';

  @override
  String get advancedSetupResolvConfGenerationTitle => 'Enable resolv.conf Generation';

  @override
  String get advancedSetupResolvConfGenerationSubtitle => 'Selecting enables /etc/resolv.conf re-generation at every start.';

  @override
  String get advancedSetupGUIIntegrationTitle => 'GUI Integration';

  @override
  String get advancedSetupGUIIntegrationSubtitle => 'Selecting enables automatic DISPLAY environment set-up. Third-party X server required.';

  @override
  String get configurationUITitle => 'Giao diện người dùng cấu hình Ubuntu WSL (thử nghiệm)';

  @override
  String get configurationUIInteroperabilityHeader => 'Interoperability';

  @override
  String get configurationUIInteroperabilityTitle => 'Enabled';

  @override
  String get configurationUIInteroperabilitySubtitle => 'Whether the Interoperability is enabled.';

  @override
  String get configurationUIInteropAppendWindowsPathTitle => 'Append Windows Path';

  @override
  String get configurationUIInteropAppendWindowsPathSubtitle => 'Whether Windows Path will be append in the PATH environment variable in WSL';

  @override
  String get configurationUIAutoMountHeader => 'Auto-Mount';

  @override
  String get configurationUIAutoMountTitle => 'được kích hoạt';

  @override
  String get configurationUIAutoMountSubtitle => 'Whether the Auto-Mount feature is enabled. This feature allows you to mount Windows drive in WSL.';

  @override
  String get configurationUIMountFstabTitle => 'Mount /etc/fstab';

  @override
  String get configurationUIMountFstabSubtitle => 'Whether /etc/fstab will be mounted. The configuration file /etc/fstab contains the???';

  @override
  String get configurationUISystemdHeader => 'EXPERIMENTAL - Systemd';

  @override
  String get configurationUISystemdTitle => 'Enabled';

  @override
  String get configurationUISystemdSubtitle => 'Whether systemd should be activated at boot time. CAUTION: This is an experimental feature.';

  @override
  String get applyingChanges => 'Applying changes...';

  @override
  String get setupCompleteTitle => 'Cài đặt hoàn tất';

  @override
  String setupCompleteHeader(Object user) {
    return 'Xin chào${user},\nBạn đã hoàn thành cài đặt thành công.';
  }

  @override
  String get setupCompleteUpdate => 'Bạn nên chạy lệnh sau để cập nhật Ubuntu lên phiên bản mới nhất:';

  @override
  String get setupCompleteManage => 'Bạn có thể sử dụng lệnh wsl trong ubuntu để quản lý cài đặt WSL của mình:';

  @override
  String get setupCompleteRestart => '* Tất cả các cài đặt sẽ có hiệu lực sau khi khởi động lại Ubuntu.';
}
