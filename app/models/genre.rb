class Genre < ActiveHash::Base
  include ActiveHash::Associations
  has_many :shops

  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '和食' },
    { id: 3, name: '洋食' },
    { id: 4, name: '居酒屋' },
    { id: 5, name: 'カレー' },
    { id: 6, name: 'イタリアン' },
    { id: 7, name: 'フレンチ' },
    { id: 8, name: '中華' },
    { id: 9, name: '韓国' },
    { id: 10, name: 'アジアン・エスニック' },
    { id: 11, name: '各国料理' },
    { id: 12, name: '麺類' },
    { id: 13, name: 'スイーツ' }
  ]
end
