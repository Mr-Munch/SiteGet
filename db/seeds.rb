# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require "csv"
#csvファイルを扱うためのgemを読み込む

CSV.foreach('db/site.csv') do |row|
#foreachは、ファイル（hoge.csv）の各行を引数として、ブロック(do~endまでを範囲とする『引数のかたまり』)を繰り返し実行する
#rowには、読み込まれた行が代入される

Site.create!(:name => row[0], :address => row[1], :caption => row[2], :region => row[3])
#usersテーブルの各カラムに、各行のn番目の値を代入している。

end