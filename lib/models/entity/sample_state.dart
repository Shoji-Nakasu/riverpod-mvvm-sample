import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

//①生成されるファイル名を指定する（ `生成元ファイル名.freezed.dart` ）
part 'sample_state.freezed.dart';

@freezed
class SampleState with _$SampleState {
  const factory SampleState({
    //②画像ファイル
    File? imageFile,
  }) = _SampleState;
}
