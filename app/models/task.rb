class Task < ApplicationRecord
  belongs_to :project

  validates :title, :description, :date, presence: true

  validates :status, inclusion: { in: %w[incomplete complete] }
  validates :priority, inclusion: { in: %w[high-priority mid-priority low-priority] }

  STATUS_OPTIONS = [%w[Incomplete incomplete], %w[Complete complete]].freeze

  PRIORITY_OPTIONS = [
    ['High Priority', 'high-priority'],
    ['Mid Priority', 'mid-priority'],
    ['Low Priority', 'low-priority']
  ].freeze

  def badge_color1
    case priority
    when 'high-priority'
      'danger'
    when 'mid-priority'
      'warning'
    else
      'primary'
    end
  end

  def badge_color2
    case status
    when 'incomplete'
      'warning'
    when 'complete'
      'success'
    else
      'primary'
    end
  end
end
