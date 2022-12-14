class EndUser < ApplicationRecord
  validates :name, presence: true
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :coffees, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :coffee_comments, dependent: :destroy

  # フォローをした、されたの関係
  has_many :relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :reverse_of_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy

  # 一覧画面で使う
  has_many :followings, through: :relationships, source: :followed
  has_many :followers, through: :reverse_of_relationships, source: :follower

  has_one_attached :end_user_image

  def get_profile_image(width, height)
    unless end_user_image.attached?
     file_path = Rails.root.join('app/assets/images/no_image.jpg')
     end_user_image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpg')
    end
     end_user_image.variant(resize_to_limit: [width, height]).processed
  end

  def self.looks(word)
    @end_user = EndUser.where("name LIKE?","%#{word}%")
  end

  # フォローしたときの処理
  def follow(user_id)
    relationships.create(followed_id: user_id)
  end
  # フォローを外すときの処理
  def unfollow(user_id)
    relationships.find_by(followed_id: user_id).destroy
  end
  # フォローしているか判定
  def following?(user)
    followings.include?(user)
  end

  def active_for_authentication?
    super && (is_deleted == false)
  end
end
