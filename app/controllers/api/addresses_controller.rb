class Api::AddressesController < ApplicationController
  before_action :set_address, only: [:show]

  # GET /addresses
  def index
    @addresses = Address.all
    res = {}
    res["status"] = "OK"
    res["addresses"] = @addresses
    render json: res
  end

  # GET /addresses/1
  def show
    res_obj = {}
    if @address 
      res_obj["status"] = "OK"
      res_obj["address"] = @address
    else 
      res_obj["status"] = "INVALID_REQUEST"
    end

    render json: res_obj
  end

  # POST /addresses
  def create
    @address = Address.new(params[:name]

    if @address.save
      render json: @address, status: :created, location: @address
    else
      render json: @address, status: :unprocessable_entity
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_address
      begin
        @address = Address.find(params[:id])
      rescue ActiveRecord::RecordNotFound => e
        @model = nil
      end
    end

end
