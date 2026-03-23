class FruitsController < ApplicationController
  def self.all_colors
    Rails.cache.fetch("all_colors", expires_in: 1.hour) do
      Fruit.pluck(:colors).flat_map { |color| color }.to_set
    end
  end

  def api_index
    results = filtered_fruit

    # if there are no results, return nil
    value = results.size > 0 ? results.as_json(only: [ :name, :in_season, :colors ]) : nil

    render json: { value: }
  end

  def search
    @fruits = filtered_fruit
    respond_to :html
  end

  private

  def filtered_fruit
    fruits = Fruit.all

    if params[:name].present?
      fruits = fruits.where("name ILIKE ?", "%#{params[:name]}%")
    end

    if params[:in_season].present?
      in_season = ActiveModel::Type::Boolean.new.cast(params[:in_season])
      fruits = fruits.where(in_season: in_season)
    end

    if params[:color].present?
      colors = Array(params[:color])
      fruits = fruits.where("colors && ARRAY[?]::varchar[]", colors)
    end

    # return results of db query
    fruits.to_a
  end
end
