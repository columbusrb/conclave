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

  Rank.create(name: 'Initiate', comment_threshold: 0)
  Rank.create(name: 'Padawan', comment_threshold: 10)
  Rank.create(name: 'Jedi Knight', comment_threshold: 50)
  Rank.create(name: 'Jedi Master', comment_threshold: 100)

end

