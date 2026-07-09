require 'httparty'

class OnboardIQ
  include HTTParty
  base_uri 'https://www.onboardiq.com/api'

  DEFAULT_API_VERSION = 'v1'

  attr_accessor :token, :version

  def initialize(hash)
    @token = hash[:token]
    raise ArgumentError, 'token is required' unless @token
    @version = DEFAULT_API_VERSION
    self.class.default_params api_token: @token
  end

  def list_applicants
    response = self.class.get("/#{@version}/applicants")
    return JSON.parse(response.body)

    rescue StandardError => e
      nil
  end

  def create_applicant(attrs)
    response = self.class.post("/#{@version}/applicants", body: attrs)
    return JSON.parse(response.body)
    rescue StandardError => e
      nil
  end

  def update_applicant(applicant_key, attrs)
    response = self.class.put("/#{@version}/applicants/#{applicant_key}", body: attrs)
    return JSON.parse(response.body)
    rescue StandardError => e
      nil
  end

  def get_applicant(applicant_key)
    response = self.class.get("/#{@version}/applicants/#{applicant_key}")
    return JSON.parse(response.body)
    rescue StandardError => e
      nil
  end


end