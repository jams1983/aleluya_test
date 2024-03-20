class DataArray < ApplicationRecord
  attr_accessor :longest_range

  validates :amount, numericality: { only_integer: true, greater_than_or_equal_to: 10 }

  before_create :generate_array
  after_initialize :calculate_largest_range, unless: Proc.new { data.blank? }

  private

  def calculate_largest_range
    sorted_data = data.sort
    self.longest_range = current_range = [sorted_data[0], sorted_data[0]]

    sorted_data[1..-1].each do |value|
      if value == current_range[1] + 1
        current_range[1] = value
      else
        set_longest_range(current_range)
        current_range = [value, value]
      end
    end

    set_longest_range(current_range)
  end

  def generate_array
    self.data = rand_n(amount, 30)
  end

  def rand_n(n, max)
    randoms = Set.new
    loop do
      randoms << rand(max)
      return randoms.to_a if randoms.size >= n
    end
  end

  def set_longest_range(current_range)
    return unless current_range[1] - current_range[0] > longest_range[1] - longest_range[0]

    self.longest_range = current_range.dup
  end
end
