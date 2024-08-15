class HomeController < ApplicationController
  def index
    @iframe = File.read(Rails.root.join('public', 'documentation.html'))

    render html: @iframe.html_safe
  end
end
