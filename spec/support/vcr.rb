require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join("spec", "cassettes")
  c.hook_into :webmock
  c.default_cassette_options = { serialize_with: :json }
end
