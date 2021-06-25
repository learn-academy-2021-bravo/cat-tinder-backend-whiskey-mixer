require 'rails_helper'

RSpec.describe "Whiskeys", type: :request do
  describe "GET /index" do
    it "gets a list of whiskeys" do
      Whiskey.create name: 'Jeffersons 17 year Presidential Select', age: '17 years', country:'US', notes: 'Coconut, roasted nuts, nougat'
    
        get '/whiskeys'

        whiskey = JSON.parse(response.body)
        expect(response).to have_http_status(200)
        expect(whiskey.length).to eq 1
    end
  end
  describe "POST /create" do
    it "creates a whiskey" do
      whiskey_params = {
        whiskey:{
          name: 'Blantons Original Single Barrel',
          age: '8 years',
          country:'US',
          notes:'Fruits and Cinnamon, Vanilla and Caramel'
        }
      }

      post '/whiskeys', params: whiskey_params
      expect(response).to have_http_status(200)
      whiskey = Whiskey.first
      expect(whiskey.name).to eq 'Blantons Original Single Barrel'
    end
  end
describe "PATCH /update" do
  it 'updates a whiskey' do
    whiskey_params ={
      whiskey: {
        name: 'Blantons Original Single Barrel',
        age: '8 years',
        country: 'US',
        notes: 'Fruits and Cinnamon, Vanilla and Caramel'
      }
    }
    post '/whiskeys', params: whiskey_params

    new_whiskey_params = {
      whiskey: {
        name: 'Blantons Original Single Barrel',
        age: '7 years',
        country: 'US',
        notes: 'Fruits and Cinnamon, Vanilla and Caramel'
      }
    }
    whiskey = Whiskey.first
    patch "/whiskeys/#{whiskey.id}", params: new_whiskey_params
    whiskey = Whiskey.find whiskey.id
    expect(response).to have_http_status(200)
    expect(whiskey.age).to eq "7 years"
    end
  end
  
  describe "DELETE /destroy" do
    it 'deletes a whiskey' do
      whiskey_params = {
        whiskey: {
          name: 'Blantons Original Single Barrel',
          age: '8 years',
          country: 'US',
          notes: 'Fruits and Cinnamon, Vanilla and Caramel'
        }
      }
      post '/whiskeys', params: whiskey_params
      whiskey = Whiskey.first
      delete "/whiskeys/#{whiskey.id}"
      expect(response).to have_http_status(200)
      whiskeys = Whiskey.all
      expect(whiskeys).to be_empty
    end
  end
  describe "meaningful status codes for create" do
    it "does not create a whiskey without a name" do
      whiskey_params={
        whiskey:{
          age: "8 years",
          country: "US",
          notes: "Fruits and Cinnamon, Vanilla and Caramel"
        }
      }
      post '/whiskeys', params: whiskey_params
      expect(response.status).to eq 422
      whiskey = JSON.parse(response.body)
      expect(whiskey['name']).to include "can't be blank"
    end
    it "does not create a whiskey without a age" do
      whiskey_params={
        whiskey:{
          name: "Blantons Original Single Barrel",
          country: "US",
          notes: "Fruits and Cinnamon, Vanilla and Caramel"
        }
      }
      post '/whiskeys', params: whiskey_params
      expect(response.status).to eq 422
      whiskey = JSON.parse(response.body)
      expect(whiskey['age']).to include "can't be blank"
    end
     it "does not create a whiskey without a country" do
      whiskey_params={
        whiskey:{
          name: "Blantons Original Single Barrel",
          age: "8 years",
          notes: "Fruits and Cinnamon, Vanilla and Caramel"
        }
      }
      post '/whiskeys', params: whiskey_params
      expect(response.status).to eq 422
      whiskey = JSON.parse(response.body)
      expect(whiskey['country']).to include "can't be blank"
    end
    it "does not create a whiskey without notes" do
      whiskey_params={
        whiskey:{
          name: "Blantons Original Single Barrel",
          age: "8 years",
          country: "US"
        }
      }
      post '/whiskeys', params: whiskey_params
      expect(response.status).to eq 422
      whiskey = JSON.parse(response.body)
      expect(whiskey['notes']).to include "can't be blank"
    end
  end
end
