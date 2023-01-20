class Doctor < ApplicationRecord
  belongs_to :user
  has_one_attached :photo
  has_many :appointments

  def photo_dir
    Rails.application.routes.url_helpers.rails_blob_path(photo, only_path: true)
  end

  # validations
  validates :name, presence: true, length: { in: 3..50 }
  validates :specialization, presence: true, length: { in: 3..50 }
end
