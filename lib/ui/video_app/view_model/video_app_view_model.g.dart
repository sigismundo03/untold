// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video_app_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$VideoAppViewModel on _VideoAppViewModelBase, Store {
  late final _$_controllerAtom =
      Atom(name: '_VideoAppViewModelBase._controller', context: context);

  @override
  VideoPlayerController get _controller {
    _$_controllerAtom.reportRead();
    return super._controller;
  }

  bool __controllerIsInitialized = false;

  @override
  set _controller(VideoPlayerController value) {
    _$_controllerAtom.reportWrite(
        value, __controllerIsInitialized ? super._controller : null, () {
      super._controller = value;
      __controllerIsInitialized = true;
    });
  }

  late final _$subtitlesAtom =
      Atom(name: '_VideoAppViewModelBase.subtitles', context: context);

  @override
  List<SubtitleModel> get subtitles {
    _$subtitlesAtom.reportRead();
    return super.subtitles;
  }

  @override
  set subtitles(List<SubtitleModel> value) {
    _$subtitlesAtom.reportWrite(value, super.subtitles, () {
      super.subtitles = value;
    });
  }

  late final _$selectedAudioAtom =
      Atom(name: '_VideoAppViewModelBase.selectedAudio', context: context);

  @override
  String get selectedAudio {
    _$selectedAudioAtom.reportRead();
    return super.selectedAudio;
  }

  @override
  set selectedAudio(String value) {
    _$selectedAudioAtom.reportWrite(value, super.selectedAudio, () {
      super.selectedAudio = value;
    });
  }

  late final _$selectedSubtitleAtom =
      Atom(name: '_VideoAppViewModelBase.selectedSubtitle', context: context);

  @override
  String get selectedSubtitle {
    _$selectedSubtitleAtom.reportRead();
    return super.selectedSubtitle;
  }

  @override
  set selectedSubtitle(String value) {
    _$selectedSubtitleAtom.reportWrite(value, super.selectedSubtitle, () {
      super.selectedSubtitle = value;
    });
  }

  late final _$isPlayingAtom =
      Atom(name: '_VideoAppViewModelBase.isPlaying', context: context);

  @override
  bool get isPlaying {
    _$isPlayingAtom.reportRead();
    return super.isPlaying;
  }

  @override
  set isPlaying(bool value) {
    _$isPlayingAtom.reportWrite(value, super.isPlaying, () {
      super.isPlaying = value;
    });
  }

  late final _$openCommentAtom =
      Atom(name: '_VideoAppViewModelBase.openComment', context: context);

  @override
  bool get openComment {
    _$openCommentAtom.reportRead();
    return super.openComment;
  }

  @override
  set openComment(bool value) {
    _$openCommentAtom.reportWrite(value, super.openComment, () {
      super.openComment = value;
    });
  }

  late final _$openAudioAtom =
      Atom(name: '_VideoAppViewModelBase.openAudio', context: context);

  @override
  bool get openAudio {
    _$openAudioAtom.reportRead();
    return super.openAudio;
  }

  @override
  set openAudio(bool value) {
    _$openAudioAtom.reportWrite(value, super.openAudio, () {
      super.openAudio = value;
    });
  }

  late final _$statusAtom =
      Atom(name: '_VideoAppViewModelBase.status', context: context);

  @override
  StatusEnum get status {
    _$statusAtom.reportRead();
    return super.status;
  }

  @override
  set status(StatusEnum value) {
    _$statusAtom.reportWrite(value, super.status, () {
      super.status = value;
    });
  }

  late final _$_showControlsAtom =
      Atom(name: '_VideoAppViewModelBase._showControls', context: context);

  @override
  bool get _showControls {
    _$_showControlsAtom.reportRead();
    return super._showControls;
  }

  @override
  set _showControls(bool value) {
    _$_showControlsAtom.reportWrite(value, super._showControls, () {
      super._showControls = value;
    });
  }

  late final _$positionAtom =
      Atom(name: '_VideoAppViewModelBase.position', context: context);

  @override
  Duration get position {
    _$positionAtom.reportRead();
    return super.position;
  }

  @override
  set position(Duration value) {
    _$positionAtom.reportWrite(value, super.position, () {
      super.position = value;
    });
  }

  late final _$downloadVideoAsyncAction =
      AsyncAction('_VideoAppViewModelBase.downloadVideo', context: context);

  @override
  Future<void> downloadVideo(String url) {
    return _$downloadVideoAsyncAction.run(() => super.downloadVideo(url));
  }

  late final _$getSubtitlesAsyncAction =
      AsyncAction('_VideoAppViewModelBase.getSubtitles', context: context);

  @override
  Future<void> getSubtitles(int moveId) {
    return _$getSubtitlesAsyncAction.run(() => super.getSubtitles(moveId));
  }

  late final _$_VideoAppViewModelBaseActionController =
      ActionController(name: '_VideoAppViewModelBase', context: context);

  @override
  void toggleControls() {
    final _$actionInfo = _$_VideoAppViewModelBaseActionController.startAction(
        name: '_VideoAppViewModelBase.toggleControls');
    try {
      return super.toggleControls();
    } finally {
      _$_VideoAppViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrease15Seconds() {
    final _$actionInfo = _$_VideoAppViewModelBaseActionController.startAction(
        name: '_VideoAppViewModelBase.decrease15Seconds');
    try {
      return super.decrease15Seconds();
    } finally {
      _$_VideoAppViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increase15Seconds() {
    final _$actionInfo = _$_VideoAppViewModelBaseActionController.startAction(
        name: '_VideoAppViewModelBase.increase15Seconds');
    try {
      return super.increase15Seconds();
    } finally {
      _$_VideoAppViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void playing() {
    final _$actionInfo = _$_VideoAppViewModelBaseActionController.startAction(
        name: '_VideoAppViewModelBase.playing');
    try {
      return super.playing();
    } finally {
      _$_VideoAppViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void pause() {
    final _$actionInfo = _$_VideoAppViewModelBaseActionController.startAction(
        name: '_VideoAppViewModelBase.pause');
    try {
      return super.pause();
    } finally {
      _$_VideoAppViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setPosition(Duration value) {
    final _$actionInfo = _$_VideoAppViewModelBaseActionController.startAction(
        name: '_VideoAppViewModelBase.setPosition');
    try {
      return super.setPosition(value);
    } finally {
      _$_VideoAppViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
subtitles: ${subtitles},
selectedAudio: ${selectedAudio},
selectedSubtitle: ${selectedSubtitle},
isPlaying: ${isPlaying},
openComment: ${openComment},
openAudio: ${openAudio},
status: ${status},
position: ${position}
    ''';
  }
}
