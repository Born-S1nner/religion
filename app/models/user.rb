class User < ApplicationRecord
  validates :username, presence: :true, uniqueness: { case_sensitive: false }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :peers 
  has_many :messages
  
  after_create :notify_pusher

  def notify_pusher
    Pusher.trigger('activity', 'login', self.as_json)
  end
   
  def as_json(options={}) # add this method
    super(
      only: [:id, :email, :username, :religion]
    )
  end
end
