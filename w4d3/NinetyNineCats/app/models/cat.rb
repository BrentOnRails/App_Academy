class Cat < ActiveRecord::Base
  COLORS = ["blue", "black", "brown", "white"]

  validates :age, :numericality =>  {:only_integer => true}
  validates :color, inclusion: {in: COLORS, message: "Invalid Color"}
  validates :sex, inclusion: {in: ["M", "F"], message: "Invalid Sex"}
  validates :age, :birth_date, :color, :name, :sex, :presence => true

  has_many :cat_rental_requests, dependent: :destroy


end
