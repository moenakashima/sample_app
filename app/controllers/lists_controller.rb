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
    redirect_to list_path(list.id)
  end



  def index
    @lists=List.all
  end

  def show
    @list=List.find(params[:id])
  end

  def edit
    @list=List.find(params[:id])
    
  end
  
  def update
    list= List.find(params[:id])
    list.update(list_params)
    redirect_to list_path(list.id)
  end
  
  def destroy
    list =List.find(params[:id]) #データを1件取得
    list.destroy #データを削除
    redirect_to'/lists' #投稿一覧画面へリダイレクト
  end 

  private
  def list_params
    params.require(:list).permit(:title,:body,:image)
  end
end
