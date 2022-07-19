class HomeController < ApplicationController
    
    def index
        @client = TheOneApi::V2::Client.new

        @books = @client.get_all_books["docs"]
    end


end