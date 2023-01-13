require 'rails_helper'
describe RegistersController, type: :request do

  before do
    @register = FactoryBot.create(:register)
  end

  describe "GET /registers" do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのタイトルが存在する' do
    end
    it 'indexアクションにリクエストするとレスポンスに投稿済みのコメントが存在する' do
    end
    it 'ndexアクションにリクエストするとレスポンスに投稿済みの画像が存在する' do
    end
  end
end
