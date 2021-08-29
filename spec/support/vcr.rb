VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
  c.ignore_localhost = true
  c.ignore_hosts "chromedriver.storage.googleapis.com"
  c.filter_sensitive_data('<BOOK_KEY>') { 'AIzaSyA2pg4G1iDnNU0qxOvhl8hi3ZJBjjc_yJw'}
end
