class Loan < ActiveRecord::Base


   validates :item, :presence => true
    mount_uploader :picture, PictureUploader
    validates :friend_phone, length: {is: 11}
    validates :held, :presence => true

end

#we need a message to say 'you didn't upload correctly' (i thought that it would just generate back, but it didn't)
