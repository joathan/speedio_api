module Api
  module V1
    class ShortUrlsController < ApplicationController
      before_action :load_short_url, only: %i[visit]
      skip_before_action :authorize_request

      def index
        @short_urls = if params[:top].present?
                        ShortUrl.top(params[:top])
                      else
                        ShortUrl.all
                      end
      end

      def create
        @short_url = UrlShortener.shorten(short_url_params[:long_url])
      end

      def visit
        @short_url.hits += 1
        @short_url.save
      end

      private

      def short_url_params
        params.permit(:long_url)
      end

      def load_short_url
        @short_url = ShortUrl.find(params[:id])
      end
    end
  end
end
