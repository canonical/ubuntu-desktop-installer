abstract class TimezoneService {
  Future<String> getTimezone();
  Future<void> setTimezone(String timezone);
}
