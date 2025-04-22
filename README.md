#2024 プロジェクト実習後期 評価サイト
##概要
プロジェクト実習の授業で行われる採点を効率的にかつ分かりやすく行うために開発したウェブアプリケーションです。
Googleアカウントにログインした後にチームを選択すると、自身のチーム以外のすべてを評価可能となるようにしました。
また、自分のチームへの評価やコメントはリアルタイムに反映され、平均点等々が分かりやすいようにグラフ化されています。

## 取り組んだ場所
: FlutterFlow
フロント/バック: Dart(Flutter)
認証: Firebase Auth
DB: Firebase firestore
開発ツール: FlutterFlow
FlutterFlowにてローコード開発を行いました。

## 動作
_*現在公開されている者は、評価終了後の静態状態です！！*_

Googleアカウントによるユーザー認証にて内部を見ることが出来ます。
その後、自分のチームを設定し評価のホームページへと遷移します。

自分のチーム以外が評価可能となり、全ユーザーの評価はリアルタイムでレンダリングされます。
また、クエリにてデータの受け渡しをしますが不正防止のため自分のチームや名前であった場合について、評価が出来ない仕様です。

```
  Firestore Setting
  
  rules_version = '2';
  service cloud.firestore {
    match /databases/{database}/documents {
      match /users/{document} {
        allow create: if request.auth.uid == document;
        allow read: if request.auth.uid == document;
        allow write: if request.auth.uid == document;
        allow delete: if request.auth.uid == document;
      }
  
      match /scores/{document} {
        allow create: if true;
        allow read: if true;
        allow write: if request.auth != null;
        allow delete: if false;
      }
  
      match /teamScores/{document} {
        allow create: if true;
        allow read: if true;
        allow write: if false;
        allow delete: if false;
      }
    }
  }
```
