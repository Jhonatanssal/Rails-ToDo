class Task < ApplicationRecord
  belongs_to :project

  validates :status, inclusion: { in: ['incomplete', 'complete'] }
  validates :priority, inclusion: { in: ['high-priority', 'mid-priority', 'low-priority']}

  STATUS_OPTIONS = [['Incomplete', 'incomplete'], ['Complete', 'complete']]

  PRIORITY_OPTIONS = [
    ['High Priority', 'high-priority'],
    ['Mid Priority', 'mid-priority'],
    ['Low Priority', 'low-priority']
  ]

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
