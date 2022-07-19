module StarWarsApi
    class Client
        BASE_URL = "https://swapi.dev/api".freeze

        def get_films
            send_get_request("films")
        end

        private

        def send_get_request(endpoint, params = {})
            @request = connection.get(endpoint, params)
            JSON.parse(@request.body)
        end

        def connection
            @connection = Faraday.new( url: BASE_URL )
        end
    end
end