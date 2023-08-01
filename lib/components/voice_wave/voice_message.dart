import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
// ignore: library_prefixes
import 'package:just_audio/just_audio.dart' as jsAudio;
import 'package:vengamo_chat_ui/components/voice_wave/helpers/utils.dart';
import './helpers/widgets.dart';
import 'audio_waves.dart';

/// This is the main widget.
// ignore: must_be_immutable
class VoiceMessage extends StatefulWidget {
  VoiceMessage({
    Key? key,
    this.audioSrc,
    this.duration,
    this.formatDuration,
    this.showDuration = false,
    this.onPlay,
    this.statusAndTime, this.isSender, 
    required this.senderBgColor,
    required this.receiverBgColor,
  }) : super(key: key);

  /// Audio Source, for now we support remote url (mp3,ogg)
  /// since we're caching files,
  /// audio source will be fetched locally
  final String? audioSrc;

  /// This is the duration of processed audio file.
  final Duration? duration;
  /// this will show audio duration
  final bool showDuration;
  ///This function serves as a callback that will be triggered when the play button is tapped.
  final Function()? onPlay;
  /// This function takes a 'Duration' object representing audio time and formats it to the "mm:ss" format.
  String Function(Duration duration)? formatDuration;
  ///This widget is used to display both the time and status message (tick, sent, delivered, and seen)
  final Widget? statusAndTime;

  /// Who is the sender of the message.
  /// From me or from someone else in group or one to one chat.
  final bool? isSender;

  /// the background color applied to chat bubble of message from you
  final Color senderBgColor;
  /// the background color applied to chat bubble of message from the other user
  final Color receiverBgColor;

  @override
  // ignore: library_private_types_in_public_api
  _VoiceMessageState createState() => _VoiceMessageState();
}

class _VoiceMessageState extends State<VoiceMessage>
    with SingleTickerProviderStateMixin {
  late StreamSubscription stream;

  final AudioPlayer _player = AudioPlayer();

  final double maxWaveHeight = 6.w(), waveWidth = 44.1.w();

  Duration? _audioDuration;

  double maxDurationForSlider = .0000001;

  bool _isPlaying = false, x2 = false, _audioConfigurationDone = false;
  int duration = 00;
  String _remainingTime = '';
  AnimationController? _controller;

  @override
  void initState() {
    widget.formatDuration ??= (Duration duration) {
      String twoDigits(int n) => n.toString().padLeft(2, '0');
      String minutes = twoDigits(duration.inMinutes.remainder(60));
      String seconds = twoDigits(duration.inSeconds.remainder(60));
      return '$minutes:$seconds';
    };

    _setDuration();
    super.initState();

    stream = _player.onPlayerStateChanged.listen((event) {
      switch (event) {
        case PlayerState.stopped:
          break;
        case PlayerState.playing:
          setState(() => _isPlaying = true);
          break;
        case PlayerState.paused:
          setState(() => _isPlaying = false);
          break;
        case PlayerState.completed:
          _player.seek(const Duration(milliseconds: 0));
          setState(() {
            duration = _audioDuration!.inMilliseconds;
            _remainingTime = widget.formatDuration!(_audioDuration!);
          });
          break;
        default:
          break;
      }
    });

    _player.onPositionChanged.listen(
      (Duration p) {
        final String minutes = twoDigits(p.inMinutes.remainder(60));
        final String seconds = twoDigits(p.inSeconds.remainder(60));
         if(mounted){
            setState(() {
            _remainingTime = '$minutes:$seconds';
          });
         }
      },
    );
  }

  void _startPlaying() async {

    if(widget.audioSrc != null) {
      await _player.play(DeviceFileSource(widget.audioSrc!));
    }
      if (mounted) {
      setState(() {
        _isPlaying = true;
      });
    }
    _controller!.forward();
  }

  _stopPlaying() async {
    await _player.pause();
    _controller!.stop();
    if(mounted) {
    setState(() {
      _isPlaying = false;
    });
  }
  }

  void _setDuration() async {
  if (widget.duration != null) {
    _audioDuration = widget.duration;
  } else {
    _audioDuration = await jsAudio.AudioPlayer().setFilePath(widget.audioSrc!);
  }
  duration = _audioDuration!.inMilliseconds;
  maxDurationForSlider = duration + .0;

  // Check if the animation controller is currently animating before stopping and disposing of it.
  if (_controller != null && _controller!.isAnimating) {
    _controller!.stop();
  }
  _controller?.dispose();

   if(mounted){
       _controller = AnimationController(
        vsync: this,
        lowerBound: 0,
        upperBound: waveWidth,
        duration: _audioDuration!,
      );

    _controller!.addListener(() {
      if (_controller!.isCompleted) {
        _controller!.reset();
        _isPlaying = false;
        x2 = false;
        setState(() {});
      }
    });
   }
  _setAnimationConfiguration(_audioDuration!);
}

  void _setAnimationConfiguration(Duration audioDuration) async {
    final String minutes = twoDigits(audioDuration.inMinutes.remainder(60));
    final String seconds = twoDigits(audioDuration.inSeconds.remainder(60));
    if(mounted){
       setState(() {
      _remainingTime = '$minutes:$seconds';
    });
    }
    _completeAnimationConfiguration();
  }

  String twoDigits(int n) => n.toString().padLeft(2, '0');

  void _completeAnimationConfiguration(){
    if(mounted){
       setState(() => _audioConfigurationDone = true);
    }
  }

  void _changePlayingStatus() async {
    if (widget.onPlay != null) widget.onPlay!();
     _isPlaying ? _stopPlaying() : _startPlaying();
    // Check if the widget is still mounted before calling setState.
    if(mounted) {
      setState(() => _isPlaying = !_isPlaying);
    }
  }

 @override
void deactivate() {
  super.deactivate();
}

@override
void dispose() {
  stream.cancel();
  _player.dispose();
  // Check if the animation controller is running before disposing it.
  if (_controller != null && _controller!.isAnimating) {
    _controller!.stop();
  }
  _controller?.dispose();

  super.dispose();
}
  ///
  _onChangeSlider(double d) async {
    if (_isPlaying) _changePlayingStatus();
    duration = d.round();
    _controller?.value = (waveWidth) * duration / maxDurationForSlider;
    _remainingTime = widget.formatDuration!(_audioDuration!);
    await _player.seek(Duration(milliseconds: duration));
    // Check if the widget is still mounted before calling setState.
    if (mounted) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => _sizerChild(context);

  Container _sizerChild(BuildContext context) => Container(
        width: 300,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 1, vertical: 2),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              _playButton(context),
              SizedBox(width: 3.w()),
              waveFormWithDuration(context),
              SizedBox(width: 2.2.w())
            ],
          ),
        ),
      );

  Widget _playButton(BuildContext context) => InkWell(
        child: Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.isSender! ? const Color.fromARGB(255, 175, 173, 173) : const Color(0xFF2BCA72),
          ),
          width: 12.w(),
          height: 12.w(),
          child: InkWell(
            onTap: () =>
                !_audioConfigurationDone ? null : _changePlayingStatus(),
            child: !_audioConfigurationDone
                ? Container(
                    padding: const EdgeInsets.all(8),
                    width: 10,
                    height: 0,
                    child: CircularProgressIndicator(
                      strokeWidth: 1,
                      color:widget.receiverBgColor,
                    ),
                  )
                : Icon(
                    _isPlaying ? Icons.pause : Icons.play_arrow,
                    color: widget.receiverBgColor,
                    size: 7.w(),
                  ),
          ),
        ),
      );

  Widget waveFormWithDuration(BuildContext context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          audioWave(context),
          SizedBox(height: .4.w()),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  /// show played badge
                  Widgets.circle(context, 1.5.w(), const Color(0x99000000)),
                  /// show duration
                  if (widget.showDuration)
                    Padding(
                      padding: EdgeInsets.only(left: 1.2.w()),
                      child: Text(
                        widget.formatDuration?.call(widget.duration!) ?? '',
                        style: const TextStyle(
                          fontSize: 10,
                          color: Color(0x99000000),
                        ),
                      ),
                    ),
                  SizedBox(width: 1.5.w()),
                  SizedBox(
                    width: waveWidth - 50,
                    child: Text(
                      _remainingTime,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0x99000000),
                      ),
                    ),
                  ),
                ],
              ),
              widget.statusAndTime!,
            ],
          ),
        ],
      );

  /// Wave widget of audio.
  Widget audioWave(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final newTHeme = theme.copyWith(
      sliderTheme: SliderThemeData(
        thumbShape: SliderComponentShape.noThumb,
        minThumbSeparation: 0,
      ),
    );

    ///
    return Theme(
      data: newTHeme,
      child: SizedBox(
        height: 6.5.w(),
        width: waveWidth,
        child: Stack(
          clipBehavior: Clip.hardEdge,
          children: [
            const AudioWaves(),
            if (_audioConfigurationDone)
              AnimatedBuilder(
                animation:
                    CurvedAnimation(parent: _controller!, curve: Curves.ease),
                builder: (context, child) {
                  return Positioned(
                    left: _controller!.value,
                    child: Container(
                        width: waveWidth,
                        height: 6.w(),
                        color: widget.isSender! ? widget.senderBgColor.withOpacity(.7) : widget.receiverBgColor.withOpacity(.7)
                        ),
                  );
                },
              ),
            Opacity(
              opacity: .0,
              child: Container(
                width: waveWidth,
                color: Colors.amber.withOpacity(0),
                child: Slider(
                  min: 0.0,
                  max: maxDurationForSlider,
                  onChangeStart: (__) => _stopPlaying(),
                  onChanged: (_) => _onChangeSlider(_),
                  value: duration + .0,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
