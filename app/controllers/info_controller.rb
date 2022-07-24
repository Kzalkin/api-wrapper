class InfoController < ApplicationController
    def index
        @client = Covid19PhApi::Client.new
        
        @facility_summary = @client.get_facilities_summary["data"]

        @icu_beds = bar_chart_data("ICU Beds",@facility_summary["beds"]["covid"]["icu_o"], @facility_summary["beds"]["covid"]["icu_v"])
        @isolation_beds = bar_chart_data("Isolation Beds", @facility_summary["beds"]["covid"]["isolbed_o"], @facility_summary["beds"]["covid"]["isolbed_v"])
        @ward_beds = bar_chart_data("Ward Beds", @facility_summary["beds"]["covid"]["beds_ward_o"], @facility_summary["beds"]["covid"]["beds_ward_v"] )
        @ventilators = bar_chart_data("Ventilators", @facility_summary["equipments"]["mechvent_o"], @facility_summary["equipments"]["mechvent_v"])
    end
    
    private

    def bar_chart_data(name, data1, data2)
        [{ name: "Occupied", data: [[name, data1]] }, {name: "Vacant", data: [[name, data2]] }]
    end
end