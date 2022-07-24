class CasesController < ApplicationController
    def index
        @client = Covid19PhApi::Client.new

        @summary = @client.get_summary["data"]

        @cases = get_data("cases")
        @recovered = get_data("recovered")
        @died = get_data("died")
        
        @top_regions = @client.get_top_regions["data"]

        @transformed_regions_data = @top_regions.map { |d| {region: d["region"], data: top_region_data(d["region"], d["deaths"], d["recovered"], d["cases"])}}
        
    end
    
    private
    
    def get_data(data)
        @timeline = @client.get_timeline["data"]
        @timeline.map { |d| [d.values_at(data, "date")].to_h.invert.to_a}.flatten(1)
    end
    
    def top_region_data(name, data1, data2, data3)
        [{ name: "Deaths", data: [[name, data1]] }, {name: "Recovered", data: [[name, data2]] }, {name: "Cases", data: [[name, data3]] }]
    end

end