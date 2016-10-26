class User < ActiveRecord::Base
  has_secure_password
  has_many :comments, foreign_key: :commenter_id
  has_many :proposals, foreign_key: :proposer_id
  has_many :experiments, foreign_key: :experimenter_id

  validates_presence_of :email, :fullname, :password

  validates_uniqueness_of :email

  validate :edu_or_gov_email

  def edu_or_gov_email
    unless /[\S]*@[\w]*.(gov|edu)/ =~ self.email || /[\S]*@[\w]*.(gov|edu)/ =~ self.email
      errors.add(:email,  "must register with .edu or .gov email")
    end
  end


end
