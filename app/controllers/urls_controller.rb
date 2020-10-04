class UrlsController < ApplicationController

  def new
    @url = Url.new
  end

  def create
    @url = Url.find_or_create_by(url_params)
    @url.ip_address = request.remote_ip
    if @url.save
      redirect_to url_info_path(@url.short_url)
    else
      flash[:errors] = @url.errors.messages.values.flatten
      render 'new'
    end
  end

  def shorten_url
    @url = Url.find_by(short_url: params[:token])
    render 'not_found.html.erb' if @url.nil?
    @url&.update_attributes(number_of_visits: @url.number_of_visits + 1)
    redirect_to @url.long_url if @url
  end

  def url_info
    @url = Url.find_by(short_url: params[:token])
    # render 'url_info.html.erb'
  end

  def url_params
    params.require(:url).permit(:long_url, :short_url, :number_of_visit, :ip_address)
  end

end