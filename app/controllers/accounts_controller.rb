class AccountsController < ApplicationController
  before_action :authenticate_account!
  before_action :set_account, only: [:profile]

  def index
    @posts=Post.active
    
    following_ids = Follower.where(follower_id: current_account.id).map(&:following_id)
    following_ids << current_account.id
    @follower_suggestions = Account.where.not(id: following_ids)
    respond_to do |format|
      # Просто рендерит содержимое БД в виде XML.
      # Вообще говоря, НИКТО И НИКОГДА НЕ ОТДАЕТ ВСЮ БД, потому что там может ненормально огромное количество записей,
      # на считывание которого не хватит ни памяти, ни других ресурсов. Поэтому здесь это просто учебная задача.
      format.xml { render xml: Account.all.to_xml } #format.xml { render xml: Post.active.to_xml }
      # Обычно отдают по страницам.
      format.html {}
    end
  end

  def profile
    if @account.present?
      @posts = @account.posts.active
    else
      redirect_to dashboard_url
    end
  end

  def follow_account
    follower_id = params[:follow_id]
    if Follower.create!(follower_id: current_account.id, following_id: follower_id)
      flash[:success] = "Новая подписка" 
    else
      flash[:danger] = "Проблемы с созданием новой подписки"
    end
    redirect_to dashboard_url
  end

  private
  def set_account
    @account=Account.find_by_username(params[:username])
  end
end
