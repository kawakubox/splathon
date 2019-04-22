class CreateParticipants < ActiveRecord::Migration[5.1]
  def change
    create_table :participants do |t|
      t.references :event, foreign_key: true
      t.string :slack_username, comment: 'kawakubox 変わる可能性があるが参加登録時のもの'
      t.string :slack_user_id, comment: 'U0XXXXXXX'
      t.string :nickname, comment: 'かわくぼっくす'
      t.string :fullname_kana, comment: 'ヤマダハナコ'
      t.string :company_name
      t.string :raw_password
      t.string :icon_url, comment: 'slack icon image URL'
      t.boolean :is_staff, comment: '0: スタッフでない, 1: スタッフ'
      t.boolean :join_party, comment: '0: 懇親会不参加, 1: 懇親会参加'
      t.boolean :has_companion, comment: '0: 同伴者なし, 1: 同伴者あり'
      t.integer :fee, comment: '合計参加費'
      t.references :team, foreign_key: true
      t.string :rank_splat_zones, comment: 'A+, X (2401~2500)'
      t.string :rank_tower_control, comment: 'A+, X (2401~2500)'
      t.string :rank_rainmaker, comment: 'A+, X (2401~2500)'
      t.string :rank_clam_blitz, comment: 'A+, X (2401~2500)'
      t.string :main_weapon, comment: 'スプラシューター'
      t.string :short_comment, comment: '一言コメント e.g. 今日も一日頑張るぞい!'
      t.timestamps

      t.index [:event_id, :slack_user_id], name: 'idx_participants_1'
      t.index [:event_id, :slack_username], name: 'idx_participants_2'
    end
  end
end
