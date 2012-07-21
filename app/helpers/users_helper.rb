module UsersHelper

  def gravatar_for(user)
    digest = Digest::MD5::hexdigest( user.email.downcase )
    url = "https://secure.gravatar.com/avatar/#{digest}"
    image_tag(url, alt: user.name, class: "gravatar")
  end
end
