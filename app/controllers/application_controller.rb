class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?
    before_action :set_locale, :check_posts, :check_subscribes
    skip_before_action :verify_authenticity_token
    
    private
    def default_url_options 
    { locale: I18n.locale } 
    end 

    def set_locale 
    I18n.locale = extract_locale || I18n.default_locale 
    end 

    def extract_locale 
    parsed_locale = params[:locale] 
    parsed_locale.to_sym if I18n.available_locales.map(&:to_s).include?(parsed_locale) 
    end 

    def check_posts
      posts=Post.all
      posts.each do |post|
        account=Account.find_by_id(post.account_id)
        if (account.present? == false)
          post.destroy
        end
      end
    end
    def set_account_by_id(id)
      set_account_by_id=Account.find_by_id(id)
    end
    def check_subscribes
      subs = Follower.all
      subs.each do |sub|
        if (set_account_by_id(sub.follower_id).present? == false)||(set_account_by_id(sub.following_id).present? == false)
          sub.destroy
        end
      end
    end
    protected
  
    def configure_permitted_parameters
      devise_parameter_sanitizer.permit(:account_update, keys: [:username, :first_name, :last_name, :email, :image, :image_cache, :description, :website])
      devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :first_name, :last_name, :email, :password])
    end
  end 