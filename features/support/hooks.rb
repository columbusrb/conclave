Before do
  OmniAuth.config.test_mode = true

  OmniAuth.config.mock_auth[:twitter] = {
    "provider"    => 'twitter',
    "uid"         => '123545',
    "name"        => "Twitter User",
    "credentials" => {"token" => "token"},
    "info"        => {
      "nickname" => "Twitter User",
      "image"    => "twitter_avatar_url"
    }
  }
end
