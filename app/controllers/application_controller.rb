class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  
  before_action :set_locale

  def set_locale
    locale = params[:locale].to_s.strip.to_sym
    I18n.locale = I18n.available_locales.include?(locale) ? locale 
                                                          : I18n.default_locale
  end

  def default_url_options
    {locale: I18n.locale}
  end

  def hello
    render html: "hello, world!"
  end
end
