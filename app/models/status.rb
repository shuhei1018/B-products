class Status < ActiveHash::Base
  self.data = [
    { id: 0, name: '0:--' },
    { id: 1, name: '1:正規品レベル　　　　　(少量ゆえに販売できていない製品)' },
    { id: 2, name: '2:正規品に近いレベル　　(品位が若干規格外の製品)' },
    { id: 3, name: '3:傷や汚れが分かるレベル(品位が規格外の製品)' }
  ]
  include ActiveHash::Associations
  has_many :products
end
