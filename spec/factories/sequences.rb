FactoryGirl.define do
  sequence :image, aliases: [:photo, :logo, :avatar] do
    Rack::Test::UploadedFile.new Rails.root.join('spec', 'fixtures', 'image.jpg')
  end
end
