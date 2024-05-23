# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[7.0].define(version: 2024_05_23_094522) do
  create_table "fight_steps", force: :cascade do |t|
    t.integer "fight_id", null: false
    t.integer "attacker_id", null: false
    t.integer "defender_id", null: false
    t.integer "damage_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["attacker_id"], name: "index_fight_steps_on_attacker_id"
    t.index ["defender_id"], name: "index_fight_steps_on_defender_id"
    t.index ["fight_id"], name: "index_fight_steps_on_fight_id"
  end

  create_table "fighters", force: :cascade do |t|
    t.string "name"
    t.integer "health_points"
    t.integer "attack_points"
    t.integer "maximum_total_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "fights", force: :cascade do |t|
    t.integer "home_fighter_id", null: false
    t.integer "away_fighter_id", null: false
    t.datetime "fight_time"
    t.string "state"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "home_weapon_id"
    t.integer "home_shield_id"
    t.integer "away_weapon_id"
    t.integer "away_shield_id"
    t.index ["away_fighter_id"], name: "index_fights_on_away_fighter_id"
    t.index ["away_shield_id"], name: "index_fights_on_away_shield_id"
    t.index ["away_weapon_id"], name: "index_fights_on_away_weapon_id"
    t.index ["home_fighter_id"], name: "index_fights_on_home_fighter_id"
    t.index ["home_shield_id"], name: "index_fights_on_home_shield_id"
    t.index ["home_weapon_id"], name: "index_fights_on_home_weapon_id"
  end

  create_table "shields", force: :cascade do |t|
    t.string "name"
    t.integer "defense_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weapons", force: :cascade do |t|
    t.string "name"
    t.integer "attack_points"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "fight_steps", "fighters", column: "attacker_id"
  add_foreign_key "fight_steps", "fighters", column: "defender_id"
  add_foreign_key "fight_steps", "fights"
  add_foreign_key "fights", "fighters", column: "away_fighter_id"
  add_foreign_key "fights", "fighters", column: "home_fighter_id"
  add_foreign_key "fights", "shields", column: "away_shield_id"
  add_foreign_key "fights", "shields", column: "home_shield_id"
  add_foreign_key "fights", "weapons", column: "away_weapon_id"
  add_foreign_key "fights", "weapons", column: "home_weapon_id"
end
