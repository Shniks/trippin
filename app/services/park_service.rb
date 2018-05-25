class ParkService
  def initialize
    @conn = Faraday.new('https://developer.nps.gov/api/v1')
  end

  def park_search
    get_json('parks')
  end

  private
    attr_reader :conn

    def get_json(url)
      response = conn.get(url, params)
      JSON.parse(response.body, symbolize_names: true)[:data]
    end

    def params
      {
        api_key: ENV['NPS_API_KEY']
      }
    end
end
