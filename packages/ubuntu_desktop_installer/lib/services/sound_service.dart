import 'dart:io';

class SoundService {
  Future<void> play(String id) async {
    await Process.run('canberra-gtk-play', ['--id=$id']);
  }
}
