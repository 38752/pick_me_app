def return_hash_name(class_name)
  s = 0
  up_site = []
  hash_name = ""
  class_name.length.times do
    if class_name[s].match(/[A-Z]/)
      up_site << s
    end
    s += 1
  end
  up_site << 0
  s = 0
  (up_site.length - 1).times do
    hash_name += class_name.slice(up_site[s]..(up_site[s + 1] - 1)).downcase
    s += 1
    unless s == up_site.length - 1
      hash_name += "_"
    end
  end
  
  return hash_name
end

def create_active_hash(start_with, how_many_add, value_name)
  puts 'class名を入力してください'
  class_name = gets.chomp
  class_name[0] = class_name[0].upcase
  hash_name = return_hash_name(class_name)
  active_hash = "class #{class_name} < ActiveHash::Base\n  self.data = [\n"
  list = []
  input = ''
  while true
    puts "#{list.length + 1}番目の要素を入力してください"
    input = gets.chomp
    case input
    when 'finished'
      break
    when 'rollback'
      if list.empty?
        puts '要素はありません'
      else
        puts "#{list.length}番目の要素：#{list.slice!(-1)}を取り除きました"
      end
    when 'blank'
      list << ''
    when ''
      puts "入力がありませんでした\n空で登録したい場合はblankと入力してください"
    else
      list << input
    end
  end
  i = start_with
  list.each do |name|
    active_hash += "    { id: #{i}, #{value_name}: '#{name}' },\n"
    i += how_many_add
  end
  puts active_hash += "  ]\n\n  include ActiveHash::Associations\n  has_many :# モデル名\n\n  # モデルに記述\n  extend ActiveHash::Associations::ActiveRecordExtensions\n  belongs_to :#{hash_name}\nend"
end


# # idの始めの値
# start_with = 0
# # idの増加幅
# how_many_add = 10
# # 要素の名前
# value_name = "name"

# # 使う時だけコメントアウト外す
# create_active_hash(start_with, how_many_add, value_name)
