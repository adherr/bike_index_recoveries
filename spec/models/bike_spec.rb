require 'rails_helper'

describe Bike, type: :model do
  it {should validate_presence_of :bi_id}
  it {should validate_presence_of :bi_url}
  it {should validate_presence_of :bi_api_url}
  it {should validate_presence_of :stolen_record_id}
  it {should validate_uniqueness_of :stolen_record_id}
end
