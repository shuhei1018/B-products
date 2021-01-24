class Status < ApplicationRecord
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '正規品レベル(少量ゆえに販売できていない製品)' },
    { id: 3, name: '正規品に近いレベル(品位が若干規格外の製品)' },
    { id: 4, name: '傷や汚れが分かるレベル(品位が規格外の製品)' }
  ]
  include ActiveHash::Associations
  has_many :products
end
