# アプリケーション名
  eventM
# アプリケーション概要
  イベントを登録し、ユーザーの出欠を管理することができる。
# URL
　https://eventm2-app.onrender.com/
# テスト用アカウント
- Basic認証パスワード：2222
- Basic認証ID：admin  
adminユーザー
- メールアドレス：test@test.co.jp
- パスワード：aaa111  
メンバーユーザー
- メールアドレス：testtest@test.co.jp
- パスワード：aaa111
# 利用方法
## イベント登録
  1.新規登録ページでユーザー登録  
  2.Eventsボタンから、イベントの内容（日付、開始時刻、終了時刻、開催場所、詳細場所、費用、支払者、予約者・備考欄）を入力し登録する  
  3.イベント一覧ページからイベント詳細ページに遷移、編集ボタンから内容の変更やクローズ.削除ボタンで削除が可能。
## イベント出席回答
  1.Attendanceボタンからイベント回答一覧ページにて出席回答を行うことが可能。  
  2.イベント一覧ページでは全体の出欠状況を確認でき、回答一覧ページでは、ログインユーザーの回答を確認できる。

# アプリケーションを作成した背景
  スポーツのサークル活動を行う中で、イベントの内容と出欠を別々に行っており、主催者側も手間が多いことや、メンバーも予定のわかりずらさが問題となっていた。  
  そこで、定期的なイベントの内容とメンバーの出欠確認が簡単にできるアプリがあれば、便利になると考え、アプリケーションを作成した。

# 洗い出した要件
[要件を定義したシート](https://docs.google.com/spreadsheets/d/1jDldxo3UNluvYhCb8ghGcpVkfilnMr7Wvihby4175KQ/edit#gid=982722306)

# 実装した機能についての画像やGIFおよびその説明※
- イベント登録ページから登録しイベント一覧ページに遷移
[![Image from Gyazo](https://i.gyazo.com/f097914131154beccd2c529e22d7d4d6.gif)](https://gyazo.com/f097914131154beccd2c529e22d7d4d6)
- 詳細画面遷移。ステータスをopen→closeに変更
[![Image from Gyazo](https://i.gyazo.com/1380fd2cf17a24f65d070e63a0a7303c.gif)](https://gyazo.com/1380fd2cf17a24f65d070e63a0a7303c)
- イベントの出欠回答方法
[![Image from Gyazo](https://i.gyazo.com/acbcf937cc53714d2004346e51aa44c5.gif)](https://gyazo.com/acbcf937cc53714d2004346e51aa44c5)

# 実装予定の機能
テストコード
エラーハンドハンドリング
マイページ作成
参加費支払記録機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/08b69bf285b6b009b76a239b6a863c4c.png)](https://gyazo.com/08b69bf285b6b009b76a239b6a863c4c)

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/a71a34ad942b4b1d1f8e44c48fd322fa.png)](https://gyazo.com/a71a34ad942b4b1d1f8e44c48fd322fa)

# 開発環境
- フロントエンド
- バックエンド
- インフラ
- テキストエディタ
- タスク管理

# ローカルでの動作方法
以下のコマンドを順に実行  
% git clone https://github.com/mimimuu/eventM_2  
% cd eventM_2  
% bundle install  


# 工夫したポイント
- イベントを一覧で表示し、出席人数を一目でわかるようにした。
- イベントのopen/closeにより挙動を変更することで、今後開催されるイベントをわかりやすくした
# 改善点  
- イベント登録ページ  
現在よりも前の情報は記入できないようにする。  
OpenとCloseでページを切り替えられるようにする。  
- 詳細ページ  
入力できるようになっているので、表示するだけに変更(変更しても更新できない)  
支払者や予約者をユーザーと紐づける。  
誰が出席か欠席か未定かをわかるように表示する。  
- ユーザー登録  
ユーザー登録時もしくはユーザー登録後に画像を登録できるようにする。
