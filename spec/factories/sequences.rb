FactoryGirl.define do
  sequence :image, aliases: [:photo, :logo, :avatar] do
    file_path = Rails.root.join('spec', 'fixtures', 'image.jpg')
    content_type = "image/jpeg"
    Rack::Test::UploadedFile.new file_path, content_type
  end
end
