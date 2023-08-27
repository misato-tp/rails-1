class Schedule < ApplicationRecord

    validates :title,:start,:end, presence: true#必須項目が入力できているか
    validates :title, length:{maximum:20} #タイトルは20文字まで
    validates :memo, length:{maximum:500} #スケジュールメモは最大で500文字
    validate :start_end_check

    def start_end_check
        errors.add(:end, "は開始日以降の日付で選択して下さい。")unless
         self.start < self.end
    end

end