class HomeController < ApplicationController
    def index
        @client = Covid19PhApi::Client.new

        @summary = @client.get_summary["data"]
    end
end