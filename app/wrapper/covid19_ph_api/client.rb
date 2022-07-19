module Covid19PhApi
    class Client
        BASE_URL = "https://covid19-api-philippines.herokuapp.com/api".freeze

        def get_summary(params = {})
            send_get_request("summary", params)
        end

        def get_top_regions
            send_get_request("top-regions")
        end

        def get_timeline(params = {})
            send_get_request("timeline", params)
        end

        def get_facilities_summary(params = {})
            send_get_request("facilities/summary", params)
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