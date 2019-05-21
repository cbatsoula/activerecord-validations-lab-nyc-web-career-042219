class Post < ActiveRecord::Base
    validates :title, presence: true
    validates :content, length: {minimum: 250 }
    validates :summary, length: {maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-fiction), message: "%{value} is not a valid category"}
    validate :click_bait


    def click_bait
    clickbait_title = ["Won't Believe","Secret","Top [0-9]","Guess"]
      if self.title.to_s.include?(clickbait_title[0])
        return self.title.to_s
      elsif self.title.to_s.include?(clickbait_title[1])
        return self.title.to_s
      elsif self.title.to_s.include?(clickbait_title[2])
        return self.title.to_s
      elsif self.title.to_s.include?(clickbait_title[3])
        return self.title.to_s
      else
        errors.add(:title, "Not clickbait-y enough.")
      end
    end


    # def clickbait
    #   if self.title && self.title.match(/(Won't Believe|Secret|Top \d|Guess)/i)
    #     true
    #   else
    #     errors.add(:title, "try again")
    #   end
    # end
end
