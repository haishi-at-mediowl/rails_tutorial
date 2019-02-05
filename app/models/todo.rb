class Todo < ApplicationRecord
  belongs_to :user

  def self.latest(user)
    Todo.where(user_id: user.id, done: false).order(created_at: :desc).first
  end

  scope :contains, -> (keyword) {
    q = "%#{sanitize_sql_like(keyword)}%"
    where("title LIKE ? OR body LIKE ?", q, q)
  }

end
