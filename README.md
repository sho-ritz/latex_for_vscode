# LaTeX for VSCode

日本語 LaTeX を VSCode で快適に書くための、ミニマルで持ち運びやすい設定です。ビルドは高速、PDF ↔ ソースの同期も即座にできます。

## オンボーディング（3分）
### macOS
1. MacTeX をインストール

```sh
brew install --cask mactex
```

2. このフォルダを VSCode で開く
3. 推奨拡張機能のインストール通知が出たらインストール
4. `.tex` を開いて保存すると自動で PDF が生成されます

### Windows
1. TeX Live をダウンロード（MacTeX の Windows 版に相当）

```text
https://www.tug.org/texlive/
```

2. 「Download」→「Windows」→ `install-tl-windows.exe` を取得
3. 管理者権限で `install-tl-windows.exe` を実行
4. インストールには時間と容量（数 GB）がかかります
5. デフォルトのままで `platex` / `pbibtex` / `mendex` / `dvipdfmx` / `latexmk` はすべて含まれます
6. PATH の確認（例）

```text
C:\Users\<ユーザ名>\AppData\Local\Programs\MiKTeX
C:\texlive\2024\bin\windows
```

7. インストーラで「コマンドラインツールに PATH を追加」などの項目があれば有効にすると楽です
8. インストール後、新しいコマンドプロンプト or PowerShell で確認

```sh
where platex
where latexmk
where dvipdfmx
```

9. いずれもパスが表示されれば OK です

## 便利機能ハイライト
- **保存で自動ビルド**（`latexmk` / pLaTeX → dvipdfmx）
- **SyncTeX 双方向**（PDF → ソース / ソース → PDF）
- **ワークスペース限定の設定**でプロジェクトがそのまま移動可能
- **句読点の自動置換（任意）**：「、。」→「，．」

## 便利機能の使い方
### 自動ビルド（保存するだけ）
1. `.tex` を編集して保存します
2. LaTeX Workshop が自動でビルドを走らせます
3. `out/` に PDF が生成されます

手動で実行したい場合は、コマンドパレットから `LaTeX Workshop: Build LaTeX project` を実行します。

### PDF プレビュー
1. ビルド後、PDF が VSCode のタブで開きます
2. 開かない場合はコマンドパレットで `LaTeX Workshop: View LaTeX PDF` を実行します

### SyncTeX（PDF → ソース）
1. PDF タブ上のテキストをダブルクリックします
2. 対応する `.tex` の位置へジャンプします

### SyncTeX（ソース → PDF）
1. `.tex` の飛びたい行にカーソルを置きます
2. `Cmd+Option+J` を押します（macOS）
3. PDF 側が該当位置にスクロールします

ショートカットが合わない場合は、コマンドパレットで `LaTeX Workshop: SyncTeX from cursor` を実行してください。

### ワークスペース限定の設定
- 設定は `.vscode/settings.json` に閉じています
- このフォルダをそのまま移動しても同じ挙動になります

### 句読点の自動置換（任意）
1. 保存時に「、。」が「，．」へ置換されます
2. 「、」「。」をそのまま使いたい場合は、直前に `\\` を付けます（例: `\\、`）
3. 一時的に無効化したい場合は `.vscode/settings.json` の `betterReplaceOnSave.replacements` を削除 or コメントアウト

## 触る可能性のあるファイル
- `.vscode/settings.json` VSCode / LaTeX Workshop 設定
- `.latexmkrc` ビルド設定
- `out/` ビルド出力

## メモ
- 設定はこのワークスペース内でのみ有効
- `.tex` が LaTeX として認識されない場合でも `files.associations` で強制指定済み
