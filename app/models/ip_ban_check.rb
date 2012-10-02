class IPBanCheck

  attr_accessor :ip, :banned_users

  def initialize(ip)
    self.ip           = ip
    self.banned_users = User.banned
  end

  def banned?
    banned_users.pluck(:last_sign_in_ip).compact.uniq.include?(ip)
  end

  def ban_over?
    ban_ends = banned_until
    return true unless ban_ends.present?
    ban_ends < Time.now
  end

  def banned_until
    banned_users.with_ip(ip).first.try(:banned_until)
  end

  def unban!
    banned_users.with_ip(ip).first.unban!
  end

end
