abstract class SessionService {
  Future<void> reboot({bool immediate = false});
  Future<void> shutdown({bool immediate = false});
}
