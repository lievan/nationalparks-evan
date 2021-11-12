class SearchController < ApplicationController
  def index
    @all_activities = Parks::Search.get_activities()
    @all_activities = JSON.parse(@all_activities.body)['data'][0]
    if params['name']
      @activities = Parks::Search.by_activity(params['name'])
      @activities = JSON.parse(@activities.body)['data'][0]
      if @activities
        @parks = @activities['parks']
        @name = @activities['name']
      end
    end
  end
  def image
    if params['park']
      @photos = Parks::Search.by_image(params['park'])
      @photos = JSON.parse(@photos.body)['data']

      puts JSON.pretty_generate(@photos)
    end
  end
  def park
    if params['park']
      @park = Parks::Search.by_park(params['park'])
      @park = JSON.parse(@park.body)['data'][0]
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
