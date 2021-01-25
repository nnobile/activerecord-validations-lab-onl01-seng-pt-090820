class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
    validate :clickbate?
    
    def clickbate?
      clickbate_words = [
        /Won't Believe/i,
        /Secret/i,
        /Top \d+/i,
        /Guess/i
      ]
    
      unless clickbate_words.any?{|word| word.match(title)}
        errors.add(:title, "Please include clickbate phrases!")
      end
      
    end
end
