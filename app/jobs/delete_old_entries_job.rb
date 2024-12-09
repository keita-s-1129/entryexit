class DeleteOldEntriesJob < ApplicationJob
  queue_as :default

  def perform(*args)
    # 日付が変わった（0:00）で削除したい入退場記録を消す
    UserHome.where("created_at < ?", Time.zone.now.beginning_of_day).delete_all
  end
end
