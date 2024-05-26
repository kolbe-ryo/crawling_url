これは同じドメイン名内の全てのURLを取得し、printで出力するプログラムです。
ドメインを変更したければ、domainの値を変更してください。
ただし、クローリングに該当する行為にあたるため該当のドメインにおける規約に従った活用をお願いします。

以下の手順でdart環境をインストールし実行可能です。

// Homebrewのインストール確認
1. /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

// Dart SDKのインストール
2. brew tap dart-lang/dart
3. brew install dart

// PATHを通す
4. brew info dart
5. echo 'export PATH="/usr/local/opt/dart/libexec/bin:$PATH"' >> ~/.zshrc
6. source ~/.zshrc

// Dartのインストール確認
dart --version
