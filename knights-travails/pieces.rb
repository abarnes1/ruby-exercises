class Pieces
  self::KING_SOLID = "\u265A".freeze
  self::QUEEN_SOLID = "\u265B".freeze
  self::ROOK_SOLID = "\u265C".freeze
  self::BISHOP_SOLID = "\u265D".freeze
  self::KNIGHT_SOLID = "\u265E".freeze
  self::PAWN_SOLID = "\u265F".freeze

  self::KING_OUTLINE = "\u2654".freeze
  self::QUEEN_OUTLINE = "\u2655".freeze
  self::ROOK_OUTLINE = "\u2656".freeze
  self::BISHOP_OUTLINE = "\u2657".freeze
  self::KNIGHT_OUTLINE = "\u2658".freeze
  self::PAWN_OUTLINE = "\u2659".freeze

  # def self.code(text_code)
  #   case text_code
  #   when 'white king'
  #     "\u2654 "
  #   when 'white queen'
  #     "\u2655 "
  #   when 'white rook'
  #     "\u2656 "
  #   when 'white bishop'
  #     "\u2657 "
  #   when 'white knight'
  #     "\u2658 "
  #   when 'white pawn'
  #     "\u2659 "
  #   when 'black king'
  #     "\u265A "
  #   when 'black queen'
  #     "\u265B "
  #   when 'black rook'
  #     "\u265C "
  #   when 'black bishop'
  #     "\u265D "
  #   when 'black knight'
  #     "\u265E "
  #   when 'black pawn'
  #     "\u265F "
  #   else nil
  #   end
  # end
end