require 'net/http'
class Charity < ActiveRecord::Base
    validates :name, presence: true
    validates :ein, presence: true
    validates :homepage_link,
            presence: true,
            format: { with: URI.regexp(%w(http https)), message: "cannot be found" }
    validates :donation_link,
            presence: true,
            format: { with: URI.regexp(%w(http https)), message: "cannot be found" }

    validate :remote_image_exists
    
    def remote_image_exists
      if !image_link || image_link == ""
        return true
      end
      url = URI.parse(image_link)
      http = Net::HTTP.new(url.host, url.port)
      http.use_ssl = (url.scheme == "https")
      begin
          http.start do |http|
            if not http.head(url.request_uri)['Content-Type'].start_with? 'image'
                errors.add(:image_link, "is not a valid image URL!")
                return false
            end
          end
      rescue
        errors.add(:image_link, "is not a valid image URL")
        return false
      end
      return true
    end
    
    def generate_error_message()
      totalMessage = ""
        self.errors.messages.each do |key, message|
          totalMessage += "#{key.to_s().tr('_', ' ').capitalize} #{message.join(" and ")}. "
        end
      return totalMessage
    end
end