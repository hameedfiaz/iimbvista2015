class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :full_name, :phone, :email, :password, :password_confirmation, :remember_me, :college_id

  has_one :cart
  has_many :orders
  belongs_to :college
  has_and_belongs_to_many :roles
  has_and_belongs_to_many :event_categories
  has_and_belongs_to_many :events
  has_and_belongs_to_many :teams

  validates :phone, length: { minimum: 10 }

  after_create :send_welcome_mail

  def self.valid_users
    User.includes(:roles, :college).select{|user| user.roles==[]}.reject{|user| user.college.try(:name).blank?}
  end

  def send_welcome_mail
    if full_name!=email
      MyMailer.delay.thank_you(self)
    else
      MyMailer.delay.referral_mail(self)
    end
  end

  def role?(role)
  	return !!self.roles.find_by_name(role.to_s.camelize)
  end

  def is_super_admin?
  	roles.include?(Role.find_by_name("SuperAdmin"))
  end

  def is_category_admin?
    roles.include?(Role.find_by_name("CategoryAdmin"))
  end

  def is_bulletin_admin?
    roles.include?(Role.find_by_name("BulletinAdmin"))
  end

  def category
    
  end
end
