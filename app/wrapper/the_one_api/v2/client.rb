module TheOneApi
    module V2
        class Client
            BASE_URL = "https://the-one-api.dev/v2".freeze
            ACCESS_TOKEN = "l770HEZOE1dYHHBKvYwL"

            def get_all_books
                send_get_request("book")
            end

            def get_book(id)
                send_get_request("book/#{id}")
            end

            def get_book_chapters(id)
                send_get_request("book/#{id}/chapter")
            end

            def get_all_characters
                send_get_request("character")
            end

            private

            def send_get_request(endpoint)
                @request = connection.get(endpoint)
                JSON.parse(@request.body)
            end

            def connection
                @connection = Faraday.new( url: BASE_URL, headers: {
                    Authorization: "Bearer #{ACCESS_TOKEN}"
                })
            end
        end
    end
end