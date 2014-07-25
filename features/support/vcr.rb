require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = Rails.root.join("spec", "cassettes")
  c.default_cassette_options = { record: :none, serialize_with: :json, preserve_exact_body_bytes: true }
end
