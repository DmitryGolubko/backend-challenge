RSpec.shared_examples 'response with Success status' do
  it { expect(response).to have_http_status(200) }
end

RSpec.shared_examples 'response with Not Found status' do
  it { expect(response).to have_http_status(404) }
end

RSpec.shared_examples 'response with Redirect status' do
  it { expect(response).to have_http_status(302) }
end
