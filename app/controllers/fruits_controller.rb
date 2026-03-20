class FruitsController < ApplicationController
  def index
    fruits = Fruit.all

    if params[:name].present?
      fruits = fruits.where("name ILIKE ?", "%#{params[:name]}%")
    end

    if params[:in_season].present?
      in_season = ActiveModel::Type::Boolean.new.cast(params[:in_season])
      fruits = fruits.where(in_season: in_season)
    end

    if params[:color].present?
      fruits = fruits.where("colors @> ARRAY[?]::varchar[]", [ params[:color] ])
    end

    render json: fruits
  end
end
