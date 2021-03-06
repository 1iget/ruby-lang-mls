require_relative "helper"
require_relative "../lib/mls/logcleaner"


describe MLS::LogCleaner do

  before do
    setup_database
    @logcleaner = MLS::LogCleaner.new
  end

  after do
    teardown_database
  end

  it "can clean up logs" do
    Log.all.size.must_equal 6
    capture_io do
      @logcleaner.cleanup_all
    end

    Log.all.size.must_equal 2
    Log.all.map(&:to_string).grep(/Success/).must_be_empty
  end
end
