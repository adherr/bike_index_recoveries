require 'rails_helper'

describe TwitterAccount do
  it { should have_many :tweets }
end
