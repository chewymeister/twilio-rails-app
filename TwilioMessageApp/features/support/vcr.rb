require 'vcr'

VCR.configure do |c|
  c.hook_into :webmock
  c.cassette_library_dir = 'features/fixtures/cassettes'
  c.ignore_localhost = true
end

VCR.cucumber_tags do |t|
  t.tag '@message_cassette_1'
  t.tag '@message_cassette_2'
end
