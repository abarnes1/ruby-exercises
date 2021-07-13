class Pieces
  def self.code(text_code)
    case text_code
    when 'white king'
      "\u2654 "
    when 'white queen'
      "\u2655 "
    when 'white rook'
      "\u2656 "
    when 'white bishop'
      "\u2657 "
    when 'white knight'
      "\u2658 "
    when 'white pawn'
      "\u2659 "
    when 'black king'
      "\u265A "
    when 'black queen'
      "\u265B "
    when 'black rook'
      "\u265C "
    when 'black bishop'
      "\u265D "
    when 'black knight'
      "\u265E "
    when 'black pawn'
      "\u265F "
    else nil
    end
  end
end