これは同じドメイン名内の全てのURLを取得し、printで出力するプログラムです。
ドメインを変更したければ、domainの値を変更してください。
ただし、クローリングに該当する行為にあたるため該当のドメインにおける規約に従った活用をお願いします。

以下の手順でdart環境をインストールし実行可能です。

// Homebrewのインストール確認
```
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

// Dart SDKのインストール
```
brew tap dart-lang/dart
brew install dart
```

// PATHを通す
```
brew info dart
echo 'export PATH="/usr/local/opt/dart/libexec/bin:$PATH"' >> ~/.zshrc
source ~/.zshrc
```

// Dartのインストール確認
```
dart --version
```