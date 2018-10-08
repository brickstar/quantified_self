class Api::V1::FavoriteFoodsController < ApplicationController
  def index
    render json: FavoriteFoodsPresenter.new.favorites
  end
end
