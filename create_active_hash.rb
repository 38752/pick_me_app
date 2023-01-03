def create_active_hash(start_with, value_name)
  puts 'class名を入力してください'
  active_hash = "class #{gets.chomp} < ActiveHash::Base\n  self.data = [\n"
  list = []
  input = ''
  while input != 'finished'
    puts "#{list.length + 1}番目の要素を入力してください"
    input = gets.chomp
    case input
    when 'finished'
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
    i += 1
  end
  puts active_hash += "  ]\n\n  include ActiveHash::Associations\nend"
end

# # idの始めの値
# start_with = 1
# # 要素の名前
# value_name = "name"

# # 使う時だけコメントアウト外す
# create_active_hash(start_with, value_name)
