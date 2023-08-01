import 'package:flutter/material.dart';
import 'package:vengamo_chat_ui/components/voice_wave/voice_message.dart';
import '../seen_status.dart';
import 'audio_placeholder.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

class AudioWidget extends StatelessWidget {
  const AudioWidget(
      {super.key,
      required this.isMe,
      required this.audioSource,
      required this.textColor,
      required this.ack,
      required this.time,
      required this.timeLabelColor,
      required this.senderBgColor,
      required this.receiverBgColor,
      required this.isLoading});

  final bool isMe;
  final String audioSource;
  final Color textColor;
  final Widget ack;
  final String time;
  final Color timeLabelColor;
  final Color senderBgColor;
  final Color receiverBgColor;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Padding(
      key: key,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: Wrap(
        crossAxisAlignment: WrapCrossAlignment.end,
        runAlignment: WrapAlignment.end,
        alignment: WrapAlignment.end,
        spacing: 18,
        children: [
          Padding(
              padding: const EdgeInsets.only(top: 1.0, bottom: 1.0),
              child: isLoading
                  ? const AudioPlaceHolder(error: false)
                  : FutureBuilder(
                      future: DefaultCacheManager().getSingleFile(audioSource),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasError) {
                            return const AudioPlaceHolder(error: true);
                          }
                          final cachedAudioFile = snapshot.data;
                          return VoiceMessage(
                            audioSrc: cachedAudioFile!.path,
                            onPlay: () => {},
                            isSender: isMe,
                            senderBgColor: senderBgColor,
                            receiverBgColor: receiverBgColor,
                            statusAndTime: Padding(
                              padding: const EdgeInsets.only(bottom: 0.0),
                              child: SeenStatus(
                                isMe: isMe,
                                time: time,
                                dateTextColor: timeLabelColor,
                                messageAck: ack,
                              ),
                            ),
                          );
                        } else {
                          // Show loading indicator while caching.
                          return const AudioPlaceHolder(error:false);  
                        }
                      },
                    )),
        ],
      ),
    );
  }
}
