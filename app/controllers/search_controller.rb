#this file calls functions from ../services/parks.rb (which makes the api calls)
#to fetch data about national parks. in then saves that data in variables that are accessible
#from the HTML views

class SearchController < ApplicationController
  def index
    #this method searches different activities based on the input paramater of "name"
    if params['name']
      @activities = Parks::Search.by_activity(params[:name])
      @activities = JSON.parse(@activities.body)['data'][0]
      if @activities
        @parks = @activities['parks']
        @name = @activities['name']
      end
    end
  end
  def image
    #this method searches web cam photos by park
    if params['park']
      @photos = Parks::Search.by_image(params[:park])
      @photos = JSON.parse(@photos.body)['data']
    end
  end
  def park
    #this method searches for park information 
    if params['park']
      @park = Parks::Search.by_park(params[:park])
      @park = JSON.parse(@park.body)['data'][0]

      #after getting the JSON data, we do some processing
      #to seperate the data into name, activities, addresses, etc.. 
      @name = @park['fullName']
      @activities = @park['activities']
      @addresses = @park['addresses']
      @contacts_phone = @park['contacts']['phoneNumbers']
      @contacts_email = @park['contacts']['emailAddresses']
      @description = @park['description']
      @directions = @park['directionsInfo']
      @entrance = @park['entranceFees'] + @park['entrancePasses']
      @images = @park['images']
      @hours = @park['operatingHours']
      @weather = @park['weatherInfo']
    end
  end
end
