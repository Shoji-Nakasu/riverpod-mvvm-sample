# riverpod_mvvm_sample

**Version: Flutter 2.10.3-stable**

## ディレクトリ構成
```
riverpod_mvvm_sample/
  ├─ android/                       Androidアプリのフォルダ
  │     (基本修正禁止)
  ├─ assets/                        画像・フォントファイルなど
  ├─ ios/　　　　　　　　　　　　　　　　iOSアプリのフォルダ
  │     (基本修正禁止)
  ├─ lib/　　　　　　　　　　　　　　　(Flutterソースコード本体)
  │    ├ models/      (ビジネスロジック)
  │    │    ├ entity/ (データ、モデルのスキーマ定義)
  │    │    └ repository/(Entityの操作群、Datastoreとのやりとり)
  │    ├ pages/ (View、画面単位で分割)
  │    ├ util/ (インスタンス化する意味がないもの群 例)アップデートが必要な時にだすポップ)
  │    ├ view_models/ (状態を保持して、Viewに渡す)
  │    └ widgets/ (共通部品Widget　例)自分たちで作ったボタン）
  │
  ├─ test/　　（自動テストコードフォルダ）
  ├─ .gitignore  (git管理除外設定用ファイル)
  ├─ analysis_options.yaml  (静的解析ツール)
  └─ pubspec.yaml  (パッケージライブラリ)
```
