require 'pry'
require 'onboardiq'

describe OnboardIQ do


  let(:client) { OnboardIQ.new(token: '[API_TOKEN]') }

  describe 'initialization' do
    it 'saves the api token' do
      expect(client.token).to eq('abcdef')
    end

    it 'sets the version to v1' do
      expect(client.version).to eq(OnboardIQ::DEFAULT_API_VERSION)
    end
  end

  describe '.list_applicants; List: GET /applicants' do
    it 'fetches the correct url' do
      expect(OnboardIQ).to receive(:get).with("/#{client.version}/applicants", {api_token: 'abcdef'})
      client.list_applicants
    end

    it 'returns an array of applicants' do
      applicants = client.list_applicants
      expect(applicants).to be_a(Array)
    end
  end

  describe '.create_applicant; Create: POST /applicants' do

    let(:new_applicant) {
      {
        phone_number: '4389438934',
        email: 'jeff@jeffrwells.com',
        name: 'Jeff Wells',
        availability: "monday, tuesday"
      }
    }

    it 'fetches the correct url' do
      expect(OnboardIQ).to receive(:post).with("/#{client.version}/applicants", an_instance_of(Hash))
      client.create_applicant(new_applicant)
    end

    it 'returns an array of applicants' do
      response = client.create_applicant(new_applicant)
      expect(response).to be_a(Applicant)
    end

    # it 'passes the correct applicant parameters' do
    #   expect(OnboardIQ).to receive(:post).with(an_instance, an_instance_of(Hash))

    #   client.create_applicant(new_applicant)
    # end

  end

  # describe '.update_applicant; Update: PUT /applicants/:id' do
  #   it 'fetches the correct url' do
  #     expect(OnboardIQ).to receive(:get).with("/#{client.version}/applicants", an_instance_of(Hash))
  #     client.list_applicants
  #   end
  # end

  # describe '.get_applicant; Show: GET /applicants/:id' do
  #   it 'fetches the correct url' do
  #     expect(OnboardIQ).to receive(:get).with("/#{client.version}/applicant", an_instance_of(Hash))
  #     client.list_applicants
  #   end
  # end

end
