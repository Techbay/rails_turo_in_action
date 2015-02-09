module UsersHelper
  def gravatar_for(user, options = {})
    gravatar_id = Digest::MD5::hexdigest(user.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    size = options[:size].to_s
    image_tag(gravatar_url, alt: user.name, size: size, class: "gravatar")
  end
end
