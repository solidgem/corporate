module WithBullet
  extend ActiveSupport::Concern

  included do
    if Bullet.enable?
      before(:each) do
        Bullet.start_request
      end

      after(:each) do
        Bullet.perform_out_of_channel_notifications if Bullet.notification?
        Bullet.end_request
      end
    end
  end
end
