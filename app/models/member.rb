class Member < ActiveRecord::Base
  belongs_to :group

  validates_presence_of :email
  validates_uniqueness_of :uid, scope: :provider, allow_blank: true
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

    member = Member.find_by(email: email)

    unless member
      # 存在しなければ新規登録
      return Member.create do |member|
        member.provider    = provider
        member.uid         = uid
        member.email       = email
        member.given_name  = given_name
        member.family_name = family_name
        member.image_url   = image_url
      end
    end

    unless member.uid
      # 存在してるけど uid を持っていないのは
      # 管理者に作られた Member なので更新しておく
      member.provider    = provider
      member.uid         = uid
      member.given_name  = given_name  unless member.given_name.presence
      member.family_name = family_name unless member.family_name.presence
      member.image_url   = image_url   unless member.image_url.presence
      member.save
    end

    member
  end

  # Members search
  #
  # @param options [Hash] the options to search members.
  # @option options [Array] :group_names (nil) The group name strings
  def self.search(options = {})
    if options[:group_names]
      Group.where(name: options[:group_names]).map(&:members).flatten
    else
      Member.all
    end
  end
end
