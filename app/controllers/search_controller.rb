class SearchController < ApplicationController
  include SearchEngine

  def search
    query = search_params[:query]


    results = []
    Profile.all.each do |profile|
      matchs = []
      matchs += search_name(profile.profile_name, query)
      matchs += search_name(profile.username, query)
      matchs += search_description(profile.description, query)

      results << [profile.id, matchs] unless matchs.blank?
    end

    render json: results.to_json
  end

  private

    # Only allow a trusted parameter "white list" through.
    def search_params
      params.permit(:query)
    end
end
