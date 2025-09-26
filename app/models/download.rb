class Download < ApplicationRecord
  belongs_to :episode
  belongs_to :user, optional: true
  before_create :extract_domain_and_path

  private

  def extract_domain_and_path
    return unless referrer

    parsed_url = Addressable::URI.parse(referrer)
    self.domain = parsed_url.domain
    self.path = parsed_url.path
  end
end
