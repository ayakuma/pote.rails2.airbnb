class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  protect_from_forgery with: :exception



  # deviseコントローラーにストロングパラメータを追加する          
  before_action :configure_permitted_parameters, if: :devise_controller?

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, :img])
  end

  before_action :set_search

  def set_search
    #@search = Article.search(params[:q])
    @search = Room.ransack(params[:q]) #ransackメソッド推奨
    @search_articles = @search.result
end

  
end
