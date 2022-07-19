class FilmsController < ApplicationController
    
    def index
        @client = StarWarsApi::Client.new

        @films = @client.get_films["results"]
    end


end