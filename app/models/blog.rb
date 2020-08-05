class Blog < ApplicationRecord
    belongs_to :user
    has_many :comments, dependent: :destroy
    
    validates :title, presence: true # タイトルが空じゃ無い
    validates :title, length: { minimum:3, maximum:30 } # 3文字以上30以下
    validates :title, uniqueness: true # 一意性
    validates :content, presence: true # 本文が空じゃ無い

    
end
