# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Api::V1::ShortUrls', type: :request do
  let(:user) { create(:user) }
  let!(:short_urls) { create_list(:short_urls, 10, created_by: user.id) }
  let(:short_url_id) { short_urls.first.id }
  let(:headers) { valid_headers }

  describe 'GET /api/v1/short_urls' do
    before { get '/api/v1/short_urls', params: {}, headers: headers }
  end
end

describe 'POST /api/v1/short_urls' do
  let(:valid_attributes) do
    {
      long_url: 'https://www.uol.com.br/esporte/futebol/ultimas-noticias/2021/12/07/real-madrid-x-inter-de-milao.htm',
    }.to_json
  end

  context 'when request is valid' do
    before { post '/api/v1/short_urls', params: valid_attributes, headers: headers }
  end

  context 'when the request is invalid' do
    let(:invalid_attributes) { { long_url: nil }.to_json }
    before { post '/api/v1/short_urls', params: invalid_attributes, headers: headers }

    xit 'returns status code 422' do
      expect(response).to have_http_status(422)
    end

    xit 'returns a validation failure message' do
      expect(json['message'])
        .to match(/Validation failed: Title can't be blank/)
    end
  end

  describe 'PUT /api/v1/short_urls/:id' do
    let(:valid_attributes) { { long_url: 'http://www.uol.com.br' }.to_json }

    context 'when the record exists' do
      before { put "/api/v1/short_urls/#{short_url_id}", params: valid_attributes, headers: headers }
    end
  end

  describe 'DELETE /api/v1/short_urls/:id' do
    before { delete "/api/v1/short_urls/#{short_url_id}", params: {}, headers: headers }
  end
end
