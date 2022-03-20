import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:riverpod_mvvm_sample/models/entity/sample_state.dart';
import 'package:riverpod_mvvm_sample/view_models/sample_view_model.dart';

//①RiverpodのプロバイダーをGlobalで定義
final sampleProvider = StateNotifierProvider<SampleViewModel, SampleState>(
  (ref) => SampleViewModel(ref.read),
);

class SamplePage extends ConsumerWidget {
  SamplePage({Key? key}) : super(key: key);
  final picker = ImagePicker();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //Riverpodの変数定義
    //②freezedで定義した変数を使うための変数を定義
    final sampleState = ref.watch(sampleProvider);
    //③notifierで定義したメソッドを使うための変数を定義
    final sampleNotifier = ref.watch(sampleProvider.notifier);

    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            sampleState.imageFile == null
                ? const Padding(
                    padding: EdgeInsets.all(30.0),
                    child: Text(' '),
                  )
                : Image.file(sampleState.imageFile!),
            if (sampleState.imageFile != null)
              //画像が表示された時に再度画像のとる　表示を変えるのに使用
              const Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(' '),
              ),
            Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FloatingActionButton.extended(
                    label: const Text(
                      'カメラで撮る',
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.lightGreen[100],
                    onPressed: () async {
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.camera);
                      if (pickedFile != null) {
                        //画像ファイルの変数を更新。notifierで定義したメソッドを使用
                        sampleNotifier.setImageFile(File(pickedFile.path));
                      }
                    },
                  ),
                  if (sampleState.imageFile != null)
                    //保存ボタンの表示
                    FloatingActionButton.extended(
                      label: const Text('保存'),
                      backgroundColor: Colors.amber,
                      onPressed: () {
                        //画像を保存。notifierで定義したメソッドを使用
                        sampleNotifier.saveNowImg(sampleState.imageFile!);
                        //todo 遷移
                      },
                    ),
                  FloatingActionButton.extended(
                    label: const Text(
                      'アルバムから選択',
                      style: TextStyle(color: Colors.black),
                    ),
                    backgroundColor: Colors.lightGreen[100],
                    onPressed: () async {
                      final pickedFile =
                          await picker.pickImage(source: ImageSource.gallery);
                      if (pickedFile != null) {
                        //画像ファイルの変数を更新。notifierで定義したメソッドを使用
                        sampleNotifier.setImageFile(File(pickedFile.path));
                      }
                    },
                  ),
                  if (sampleState.imageFile != null)
                    FloatingActionButton.extended(
                      label: const Text('戻る'),
                      backgroundColor: Colors.lightGreen[100],
                      onPressed: () async {
                        sampleNotifier.setImageFile(null);
                      },
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}
