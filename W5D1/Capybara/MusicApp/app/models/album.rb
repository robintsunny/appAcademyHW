# == Schema Information
#
# Table name: albums
#
#  id      :bigint(8)        not null, primary key
#  band_id :integer          not null
#  year    :integer          not null
#  title   :string           not null
#  type    :string           default("Studio"), not null
#

class Album < ApplicationRecord
  validates :year, :title, :type, presence: true

  belongs_to :band, {
    primary_key: :id,
    foreign_key: :band_id,
    class_name: :Band
  }

end
