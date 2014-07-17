module Api
  module V1
    class RecoveriesController < ApplicationController
      skip_before_filter  :verify_authenticity_token
      before_filter :verify_key
      respond_to :json

      def create
        bi_response = bike_index_response(params[:api_url])
        new_bike = Bike.create do |b|
          b.bi_url = params[:api_url]
          b.bi_id = bi_response[:id]
          b.year = bi_response[:year]
          b.manufacturer = bi_response[:manufacturer_name]
          b.model = bi_response[:frame_model]
          b.serial = bi_response[:serial]
          b.color = bi_response[:frame_colors].to_sentence
          b.description = bi_response[:description]
          b.date_stolen = Date.parse(params[:theft_information][:date_stolen])
          b.stolen_location = params[:theft_information][:location]
          b.date_recovered = Date.parse(params[:recovery_information][:date_recovered])
          b.recovery_story = params[:recovery_information][:recovery_story]
        end
        render json: new_bike.id
      end

      def bike_index_response(bike_index_api_url)
        bike_response = Net::HTTP.get_response(URI.parse(bike_index_api_url)).body
        bike_response = JSON.parse(bike_response)
        HashWithIndifferentAccess.new(bike_response['bikes'])
      end

      private

      def verify_key
        unless params[:key].present? && params[:key] == ENV['INCOMING_REQUEST_KEY']
          render json: "Not authorized", status: :unauthorized and return
        end
      end

    end
  end
end
