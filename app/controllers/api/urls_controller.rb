class Api::UrlsController < ApplicationController
  def show
    @url = Url.find_by(short_url: params[:token])
    if @url
      render json: {original_url: @url.long_url}.to_json
    else
      render json: "Wrong Token"
    end
  end
end