require "rails_helper"

describe "PATCH /api/v1/links" do
  it "updates the read status of a link" do
    link = Link.create(title: "Google", url: "https://google.com")
    expect(link.read).to be_falsey

    params = {read: true}
    patch "/api/v1/links/#{link.id}", params: params

    link = JSON.parse(response.body)

    expect(response).to be_success
    expect(link['read']).to eq(true)
  end
end
