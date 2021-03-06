# == Schema Information
#
# Table name: users
#
#  id                 :integer          not null, primary key
#  username           :string           not null
#  password_digest    :string           not null
#  session_token      :string           not null
#  f_name             :string           not null
#  l_name             :string           not null
#  zip_code           :string
#  created_at         :datetime         not null
#  updated_at         :datetime         not null
#  image_file_name    :string
#  image_content_type :string
#  image_file_size    :integer
#  image_updated_at   :datetime
#

class User < ApplicationRecord
  validates :username, :password_digest, :session_token, :f_name, :l_name, presence: true
  validates :username, uniqueness: true
  validates :password, length: { minimum: 6, allow_nil: true }

  before_validation :ensure_session_token

  attr_reader :password

  has_attached_file :image, default_url: "https://s3.us-east-2.amazonaws.com/gandalp-pro/users/images/guest_profile.jpeg"
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  has_many :businesses,
    primary_key: :id,
    foreign_key: :owner_id,
    class_name: :Business

  has_many :reviews

  def self.find_by_credentials(username, password)
    @user = User.find_by(username: username)

    @user && @user.is_password?(password) ? @user : nil
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64
    self.save!
    self.session_token
  end

  private

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64
  end
end
