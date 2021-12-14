class Post < ApplicationRecord

  validates :title, presence: true
  validates :content, length: { minimum: 250 }
  validates :summary, length: { maximum: 250 }
  validates :category, inclusion: { in: ['Fiction', 'Non-Fiction'] }
  validate :clickbait

  def clickbait
    if title.include("Won't Believe") == false &&
      title.include("Secret") == false &&
      title.include("Top [number]") == false &&
      title.include("Guess") == false
      errors.add(:title, "needs clickbaity title")
    end
  end

end
