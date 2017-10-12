class Card
attr_accessor :face, :suit,:possible_suits, :possible_faces



  def initialize(face,suit)
    @face = face
    @suit = suit


  end

  def self.possible_faces
    [:A,:K,:Q,:J,10,9,8,7,6,5,4,3,2]
  end


  def self.possible_suits
    [:spade,:heart,:diamond,:club]
  end
end
