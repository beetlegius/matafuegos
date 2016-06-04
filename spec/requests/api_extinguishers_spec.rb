require 'rails_helper'

RSpec.describe "ApiExtinguishers", :type => :request do
  let!(:sector) { FactoryGirl.create :sector }
  let!(:extinguisher) { FactoryGirl.create :extinguisher, kind: Extinguisher::A, sector: sector }
  let!(:extra_extinguisher) { FactoryGirl.create :extinguisher, kind: Extinguisher::AB }

  context 'listing extinguishers' do
    it "lists globally" do
      get api_extinguishers_url

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body.count).to be(Extinguisher.count)
    end

    it "lists by sector" do
      get api_extinguishers_url(sector_id: sector)

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body.count).to be(sector.extinguishers.count)
    end
  end

  context 'showing an extinguisher' do
    it 'shows an extinguisher normally' do
      get api_extinguisher_url(extinguisher)

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body[:id]).to be(extinguisher.id)
      expect(body[:kind]).to eq(extinguisher.kind)
      expect(body[:expiration_at]).to eq(extinguisher.expiration_at.to_s)
    end

    it 'throws a 404 error when not founding the extinguisher' do
      extinguisher.id = -1
      get api_extinguisher_url(extinguisher)

      expect(response).to have_http_status(404)
      expect(response.content_type).to eq(Mime[:json])
    end
  end

  context 'creating an extinguisher' do
    it 'creates an extinguisher normally' do
      new_extinguisher = FactoryGirl.build(:extinguisher)

      post api_extinguishers_url, params: {
        extinguisher: { kind: new_extinguisher.kind, expiration_at: new_extinguisher.expiration_at, sector_id: new_extinguisher.sector_id }
      }

      expect(response).to have_http_status(201)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body[:kind]).to eq(new_extinguisher.kind)
      expect(body[:expiration_at]).to eq(new_extinguisher.expiration_at.to_s)
    end

    it 'throws a 400 error when creating an invalid extinguisher' do
      new_extinguisher = FactoryGirl.build(:invalid_extinguisher)

      post api_extinguishers_url, params: {
        extinguisher: { kind: new_extinguisher.kind, expiration_at: new_extinguisher.expiration_at, sector_id: new_extinguisher.sector_id }
      }

      expect(response).to have_http_status(400)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body).to have_key(:errors)
    end
  end

  context 'updatating an extinguisher' do
    it 'updates an extinguisher normally' do
      patch api_extinguisher_url(extinguisher), params: {
        extinguisher: { kind: Extinguisher::ABC }
      }

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body[:kind]).to eq(Extinguisher::ABC)
    end

    it 'throws a 400 error when updating an extinguisher with invalid params' do
      patch api_extinguisher_url(extinguisher), params: {
        extinguisher: { kind: "" }
      }

      expect(response).to have_http_status(400)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body).to have_key(:errors)
    end
  end

  it 'deletes an extinguisher normally' do
    delete api_extinguisher_url(extinguisher)

    expect(response).to have_http_status(204)
  end

end
