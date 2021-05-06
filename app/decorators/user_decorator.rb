class UserDecorator
  include Rails.application.routes.url_helpers

  def initialize(user)
    @user = user
  end

  def image_url
    if Rails.env.development?
      url_for(user.avatar)
    elsif Rails.env.production?
      user.avatar.attachment.url
    end
  end

  private

  attr_reader :user
end
