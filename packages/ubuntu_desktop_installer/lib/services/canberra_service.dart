import 'dart:io';

class CanberraService {
  Future<void> play(String id) async {
    Process.run('canberra-gtk-play', ['--id=$id']);
  }
}
