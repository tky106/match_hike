# README
# アプリケーション名
  「match hike」
# 概要
  同一の目的地に向かう人同士のマッチングを提供するアプリケーション。同乗者を募集するホストの投稿に対してユーザーが応募する仕組み。
# 制作意図
  お金がない大学生の帰省や地方在住大学生の就活をサポートするため。また社会人が車で出張を行う際などに伴う余剰スペースの有効活用のため。
# 使用言語・フレームワーク
  言語: ruby 2.5.1
  フレームワーク: Rails 6.0.3.1  
# 機能一覧
  ・ユーザー登録、編集、ログイン機能
  ・募集要項投稿機能
  ・募集要項詳細表示機能
  ・募集要項一覧表示機能
  ・画像ファイルアップロード機能
  ・応募機能
  ・チャット機能
  ・投稿検索機能
# 本番環境
  http://54.150.247.16/
# DEMO

# 工夫したポイント
  ・ユーザーが応募したあと、同乗者のことを互いに知る機会を与えるためにトークグループを設けた。
  ・ホストの信頼性を保つためにsnsリンクや性別、職業など詳細な個人情報を追加した。
  ・トークグループでAjaxを用いて非同期処理を行い、さらに話者によってトークの表示位置を変えることでLINEのような使用感にした。
# 使用技術
  ・インフラ: AWS
  ・データベース: Mysql
  ・セッション管理: CookieStore
  ・バージョン管理: git github
  ・画像アップロード: CarrierWave
  ・DBスキーマ管理ツール: ridgepole
  ・テンプレートエンジン: slim
  ・ストレージサービス: S3
  ・翻訳ライブラリ: rails-i18n
# 今後実装したい機能
  ・決済機能: ホスト、応募者の双方に、発生する料金のうち3%ほどの手数料を設定。
  ・ユーザーが応募した際にホストに通知が届き、承認して合意する機能の実装。
  ・トーク機能にdeepL翻訳のAPIを導入。
  ・投稿に対してコメントを送ることができるようにする。
# References
参考にした情報源（サイト・論文）などの情報、リンク