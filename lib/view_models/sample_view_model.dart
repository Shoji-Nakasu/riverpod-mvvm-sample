import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_mvvm_sample/models/entity/sample_state.dart';

// ①、②Providerの定義
class SampleViewModel extends StateNotifier<SampleState> {
  SampleViewModel(this._read) : super(const SampleState());
  final Reader _read;

  //画像ファイルの状態を更新
  void setImageFile(File? imageFile) {
    //③stateを更新
    state = state.copyWith(imageFile: imageFile);
  }

  //画像ファイルを保存
  void saveNowImg(File imageFile) async {
    //repositoryの処理を記述
    // final photoDomain = PhotoDomain();
    // await photoDomain.saveNowImageAndPath(imageFile);
  }
}
