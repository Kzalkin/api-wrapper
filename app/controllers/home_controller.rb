class HomeController < ApplicationController
    def index
        @client = Covid19PhApi::Client.new

        @summary = @client.get_summary["data"]
        @updated = @client.get_summary["last_update"]

        @timeline = @client.get_timeline["data"]

        @top_regions = @client.get_top_regions["data"]

        @facility_summary = @client.get_facilities_summary
    end
end