# == Schema Information
#
# Table name: addresses
#
#  id        :integer          not null, primary key
#  name      :string
#  latitude  :float
#  longitude :float
#  elevation :float
#

require 'net/http'

class Address < ApplicationRecord


	def get_details(address_name)
		self.latitude, self.longitude = get_geocoding(address_name)
		self.elevation = get_elevation(self.latitude, self.longitude)
		self.save!
		
	end

	def get_geocoding(address_name)
		
		@BASE_URI = 'https://maps.googleapis.com/maps/api/geocode/json?'
		geocode_apikey = ENV['GEOCODE_APIKEY']
		geocode_uri = URI(@BASE_URI + "address=#{address_name}&key=" + geocode_apikey)
		puts geocode_uri
		res = Net::HTTP.get_response(geocode_uri)	
		res_obj = JSON.parse(res.body)
		if (res_obj["status"] == "OK")
			location = res_obj["results"][0]["geometry"]["location"]
			return location["lat"], location["lng"]
		end
		return 0,0
	end

	def get_elevation(lat,lng)

		@BASE_URI = 'https://maps.googleapis.com/maps/api/elevation/json?'
		geoelevation_apikey = ENV['GEOELEVATION_APIKEY']
		geoelevation_uri = URI(@BASE_URI + "locations=#{lat},#{lng}&key=" + geoelevation_apikey)
		puts geoelevation_uri
		res = Net::HTTP.get_response(geoelevation_uri)	
		res_obj = JSON.parse(res.body)

		return res_obj["results"][0]["elevation"] if res_obj["status"] == "OK"
		return 0

	end
end
