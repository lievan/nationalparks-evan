

module Parks
    class Search
      def self.by_activity(name)
        Faraday.get 'https://developer.nps.gov/api/v1/activities/parks?q=' + name + '&api_key=' + ENV['API_KEY']
      end
      def self.by_park(park)
        Faraday.get 'https://developer.nps.gov/api/v1/parks?parkCode=' + park + '&api_key=' + ENV['API_KEY']
      end
      def self.by_image(park)
        Faraday.get 'https://developer.nps.gov/api/v1/webcams?q=' + park + '&api_key=' + ENV['API_KEY']
      end
    end
  end