class UsersController < ApplicationController
  before_action :set_user
  def show
    @sampleuser = User.where(id: 12).first
    @reason = Expultion.all
    if @sampleuser.expulsion.blank?
      @count = 1
    else
      @count = @sampleuser.expulsion + 1
    end

    @user = User.new
  end

  def update
    # 現在は特定のユーザーを指定、後のクリックしたユーザーとなる
    @sampleuser = User.where(id: 12).first
    # 理由をフォームから収集、Expultionテーブルに代入
    @reason = Expultion.create(user_id:@sampleuser.id,reason:room_params[:reason])
    @reasoncount = room_params[:reason].split('').length
    # もし理由が15文字以上なら実行
    if @reasoncount >=15
      # 報告回数をuserテーブルのexpulsionに格納5に達した場合destroy実行それ以外は回数を増やす
      if room_params[:expulsion].to_i === 5
        if @sampleuser.destroy
          redirect_to root_path
        else
          redirect_to root_path
        end
      else
        if @sampleuser.update(room_params)
          redirect_to userexplusion_path
        else
          redirect_to root_path
        end
      end  
    end
    # if params[:expulsion].to_i === 5
    #   redirect_to controller: :users, action: :destroy
    # else
    #   @user.update(room_params)
    # end
  end


  private
  def set_user
    @user = current_user
  end
  def room_params
    params.require(:user).permit(:id, :username,:expulsion,:reason)
  end

end