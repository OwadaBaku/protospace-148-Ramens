class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).order('created_at DESC')
  end

  def new
    @prototype = Prototype.new
  end

  def create
    @prototype = Prototype.new(prototype_params)

    if @prototype.save
      # 保存に成功した場合の処理
      redirect_to root_path
    else
      # 保存に失敗した場合の処理
      render :new
    end
  end

  private

  def prototype_params
    params.require(:prototype).permit(:title, :catch_copy, :concept, :image).merge(user_id: current_user.id)
  end
end
