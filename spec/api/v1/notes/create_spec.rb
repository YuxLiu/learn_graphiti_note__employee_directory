require 'rails_helper'

RSpec.describe "notes#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/notes", payload
  end

  describe 'basic create' do
    let(:params) do
      attributes_for(:note)
    end
    let(:payload) do
      {
        data: {
          type: 'notes',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(NoteResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Note.count }.by(1)
    end
  end
end
