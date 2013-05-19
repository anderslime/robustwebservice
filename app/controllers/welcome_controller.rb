class WelcomeController < ApplicationController
  respond_to :html, :json
  def index
    render :json => {
      :welcome => true,
      :documentation => "#{request.protocol}#{request.host}/readme.html",
      :source_code => "https://github.com/anderslime/robustwebservice",
      :report => "#{request.protocol}#{request.host}/report.pdf"
    }
  end
end
