module ApplicationHelper

  def gravatar_for(user, options={size: 80})
    email = user.email.downcase
    size = options[:size]
    hash = Digest::MD5.hexdigest(email)
    gravatar_url = "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
    image_tag(gravatar_url, alt: user.username, class: %w(rounded mx-auto d-block))
  end
  
end
