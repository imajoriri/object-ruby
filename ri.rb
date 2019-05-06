
# --- qwan.rb ---

# rakeタスクのリファクタリング
# serviceについて知ってるのはOK
task import_masters do 

  sheet_names = []
  sheets = []

  # シートオブジェクトを保存
  sheet_names.each do |s_name|
    sheet = Sheet.new(name: s_name, sheet_id: sheet_id)
    sheet.get_data
    sheets << sheet
  end 

  # それぞれのモデルに保存
  sheets.each do |sheet|
    sheet.save_data
  end 
end 

# --- Sheet.rb ---
class Sheet
  def initialize(args)
    @name = argsi[:name]
    @sheet_id = args[:sheet_id]
    @model = # @nameからモデルを取得
  end 

  # シートのデータを取得
  def get_data
    data = # ... データ取得の処理 ...
      @data = data
  end 

  def save_data
    # Sheetクラスはモデルの情報を知っていてはいけない。メソッドが存在することだけ知っている。
    # なぜならスプレッドシートの仕様の方が変わりにくいから
    @model.create_or_update_data(self)
 
en  --- Model.rb ---
c ass Model
  # Modelは割とSheetの情報を知っていてもいい。かわらないから。

  def self.create_or_update_data(sheet)
    # ... 色々保存の処理
  end 
end 
