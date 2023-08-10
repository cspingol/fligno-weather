class HomeController < ApplicationController
 def index
    require 'net/http'
    require 'json'
    if params[:latitude].nil? || params[:latitude].nil?
      @url = "https://api.open-meteo.com/v1/dwd-icon?"+"latitude=52.52&longitude=13.41"+
             "$daily=weathercode,temperature_2m_max,temperature_2m_min,windspeed_10m_max&timezone=GMT"
    else
      @url = "https://api.open-meteo.com/v1/dwd-icon?"+"latitude=#{params[:latitude]}"+"&longitude=#{params[:longitude]}"+
             "&daily=weathercode,temperature_2m_max,temperature_2m_min,windspeed_10m_max&timezone=GMT"
    end
    @uri = URI(@url)
    @response = Net::HTTP.get(@uri)
    @output = JSON.parse(@response)
  end
end
