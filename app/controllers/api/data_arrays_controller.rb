module Api
  class DataArraysController < ApplicationController
    def index
      data_arrays
    end

    def create
      @data_array = DataArray.create(data_array_params)
    end

    def show
      @data_array ||= data_arrays.find(params[:id])
    end

    private

    def data_arrays
      @data_arrays ||= DataArray.all
    end

    def data_array_params
      params.require(:data_array).permit(:amount)
    end
  end
end
