require 'rails_helper'

RSpec.describe "ApiSectors", :type => :request do
  let!(:sector1) { FactoryGirl.create :sector, name: 'First' }
  let!(:sector2) { FactoryGirl.create :sector, name: 'Second' }

  it "lists sectors" do
    get api_sectors_url

    expect(response).to have_http_status(200)
    expect(response.content_type).to eq(Mime[:json])

    body = json(response.body)
    expect(body.count).to be(Sector.count)
  end

  context 'showing a sector' do
    it 'shows a sector normally' do
      get api_sector_url(sector1)

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body[:id]).to be(sector1.id)
      expect(body[:name]).to eq(sector1.name)
      expect(body[:latitude]).to eq(sector1.latitude)
      expect(body[:longitude]).to eq(sector1.longitude)
    end

    it 'throws a 404 error when not founding the sector' do
      sector1.id = -1
      get api_sector_url(sector1)

      expect(response).to have_http_status(404)
      expect(response.content_type).to eq(Mime[:json])
    end
  end

  context 'creating a sector' do
    it 'creates a sector normally' do
      new_sector = FactoryGirl.build(:sector)

      post api_sectors_url, params: {
        sector: { name: new_sector.name, latitude: new_sector.latitude, longitude: new_sector.longitude }
      }

      expect(response).to have_http_status(201)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body[:name]).to eq(new_sector.name)
      expect(body[:latitude]).to eq(new_sector.latitude)
      expect(body[:longitude]).to eq(new_sector.longitude)
    end

    it 'throws a 400 error when creating an invalid sector' do
      new_sector = FactoryGirl.build(:invalid_sector)

      post api_sectors_url, params: {
        sector: { name: new_sector.name, latitude: new_sector.latitude, longitude: new_sector.longitude }
      }

      expect(response).to have_http_status(400)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body).to have_key(:errors)
    end
  end

  context 'updatating a sector' do
    it 'updates a sector normally' do
      patch api_sector_url(sector1), params: {
        sector: { name: "testing" }
      }

      expect(response).to have_http_status(200)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body[:name]).to eq("testing")
    end

    it 'throws a 400 error when updating a sector with invalid params' do
      patch api_sector_url(sector1), params: {
        sector: { name: "" }
      }

      expect(response).to have_http_status(400)
      expect(response.content_type).to eq(Mime[:json])

      body = json(response.body)
      expect(body).to have_key(:errors)
    end
  end

  it 'deletes a sector normally' do
    delete api_sector_url(sector1)

    expect(response).to have_http_status(204)
  end

end
