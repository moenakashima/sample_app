class ListsController < ApplicationController
  def new
    # Viewに渡すためのインスタンス変数に空のModelオブジェクトを生成
    @list = List.new
  end

  # 以下を追加
  def create
    # 1.2データを受け取り新規登録するためのインスタンス作成
    list = List.new(list_params)
    # 3データをデータベースに保存するSAVEメソッド実行
    list.save
    # 4トップへリダイレクト
    redirect_to'/top'
  end



  def index
  end

  def show
  end

  def edit
  end

  private
  def list_params
    params.require(:list).permit(:title,:body)
  end
end
