class Article < ApplicationRecord

  #before_create :greeting_message
   # def greeting_message
    #  puts "Hi there, running before object creation"
    #end

    # == before_create can be used as
    #before_create do
    #  puts "Hi there, running before object creation"
    #Send
  has_many :comments, inverse_of: :article
  #dependent: :destroy
  validates_associated :comments
  validates :title , confirmation: false
  #validates :title_confirmation , presence: true

  validates :title,
   presence: {strict: true} , on: :create ,allow_blank: true
   #unless: Proc.new { |a| a.title.blank?}
  #if: :correct_length ,

  #validates :title , uniqueness: {message: -> (object,data) do
  #  "This #{object.title} , #{data[:value]} is taken already . Try again #{Time.now}"
  #end
  #}
  #uniqueness: {scope: :title , message: "It must be unique"},
  #presence: true ,
   #length: { minimum: 5 , message: "%{count} too large"}
  #validates : title , exclusion: {in: %w{www us ca jp}}
  #numericality: true ,
  #absence: true
  #validates_with MyValidator
  #validates :email , presence: true , email: true
  #validates :text , inclusion: {in: %w{Small medium large}, message: "%{value} is not a valid size" }, allow_nill: true

  #with_options if: :create do |c|
    #c.validates :title , length: {minimum: 5}
    #c.validates :text , presence: true
  #length: { is: 5 } , alllow_blank: true
  #validates :integerz , numericality: true

  validates_each :title , :text do |record , attr, value|
      record.errors.add(attr, "Must start with uppercase") if value =~ /\A[[:lower:]]/
   end
   #validates :title , length: {maximum: 120}
   # validates :title , length: {in: 6..30}
    # validates :title , length: {is: 4}

    #def correct_length
     # validates :title , length: {mimimum: 4}
    #end

  validates :terms , acceptance: true
def article_validation
  errors.add(:title , "can not contain @#!")

end

end
