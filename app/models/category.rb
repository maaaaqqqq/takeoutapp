class Category < ActiveHash::Base
  include ActiveHash::Associations
  has_many :items

  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: 'お弁当' },
    { id: 3, name: '丼もの' },
    { id: 4, name: 'セットメニュー' },
    { id: 5, name: '単品メニュー' },
    { id: 6, name: 'スイーツ' },
    { id: 7, name: 'お飲み物' }
  ]
end
