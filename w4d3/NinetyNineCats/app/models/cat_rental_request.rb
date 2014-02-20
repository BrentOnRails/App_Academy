class CatRentalRequest < ActiveRecord::Base
  STATUSES = ["PENDING", "APPROVED", "DENIED"]

  before_validation(on: :create) do
    self.status ||= "PENDING"
  end

  validates :cat_id, :start_date, :end_date, :status, :presence => true
  validates :status, inclusion: {in: STATUSES, message: "Invalid Status"}
  validate  :overlapping_approved_requests

  belongs_to :cat


  def overlapping_requests
    overlaps = self.cat.cat_rental_requests
           .where("cat_id = ? AND ((start_date BETWEEN ? AND ?)
                   OR  (end_date BETWEEN ? AND ?))", self.cat_id, self.start_date,
                   self.end_date, self.start_date, self.end_date)
  end

  def overlapping_approved_requests
    if !overlapping_requests.where("status = ?", "APPROVED").empty?
      errors.add(:request, "date not available")
    end
  end

  def approve!
    ActiveRecord::Base.transaction do
      self.status = "APPROVED" unless overlapping_approved_requests
      self.save!
    end
  end

  def deny!
    ActiveRecord::Base.transaction do
      self.status = "DENIED"
      self.save!
    end
  end

end



