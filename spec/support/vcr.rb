require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = Rails.root.join("spec", "cassettes")
  c.hook_into :webmock
  c.default_cassette_options = { record: :none, serialize_with: :json }
end
