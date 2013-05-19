class WelcomeController < ApplicationController
  def index
    render :json => {
      :welcome => true,
      :documentation => "link/to/documenation",
      :report => "link/to/report"
    }
  end
end
