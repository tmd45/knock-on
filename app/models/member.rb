class Member < ActiveRecord::Base
  belongs_to :group

  validates_presence_of :provider, :uid, :email
  validates_uniqueness_of :uid, scope: :provider
  validates_uniqueness_of :email

  default_scope { order(:family_name_kana, :family_name, :email) }

  # Member find or create from OmniAuth::AuthHash
  #
  # @param auth_hash [OmniAuth::AuthHash] user infomation
  # @return [Members] member
  def self.find_or_create_from_auth_hash(auth_hash)
    provider    = auth_hash[:provider]
    uid         = auth_hash[:uid]
    email       = auth_hash[:info][:email]
    given_name  = auth_hash[:info][:first_name]
    family_name = auth_hash[:info][:last_name]
    image_url   = auth_hash[:info][:image]

    Member.find_or_create_by(provider: provider, uid: uid) do |member|
      member.email       = email
      member.given_name  = given_name
      member.family_name = family_name
      member.image_url   = image_url
    end
  end
end
