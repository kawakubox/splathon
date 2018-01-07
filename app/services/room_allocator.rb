# frozen_string_literal: true

class RoomAllocator
  def initialize(qualifier)
    qualifier.reload
    @matches = qualifier.matches
    @rooms = qualifier.event.rooms
  end

  def allocate
    # 必要な部屋リソースを確保
    # 優先度の高い部屋が多くなるようにしている
    room_stocks = @rooms.order(priority: :desc)
                        .cycle(@matches.count)
                        .to_a
                        .slice(0...@matches.count)
                        .sort { |a, b| a.priority <=> b.priority }
                        .reverse

    # 初戦を除きあとのほうがより強いチームになるので、優先度高い部屋を割り当てるようにする
    # なんか偏る傾向あるので、ここはコメントアウト
    # @matches.last.update!(room: room_stocks.shift)

    # 残りの試合は、優先度高い部屋の利用が少ないチームが割り当てられるようにする
    @matches.where(room: nil).sort { |a, b| a.room_priority <=> b.room_priority }.each do |match|
      match.update!(room: room_stocks.shift)
    end
  end
end
