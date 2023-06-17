class CreateTableTestexecs < ActiveRecord::Migration[6.1]
  def change
    #create_table :testexecs do |t|
    #  t.references :onetest, null: false, foreign_key: true
    #  t.datetime :datestart
    #  t.datetime :datefinish
    #  t.references :user, null: false, foreign_key: true
    #  t.integer :ordernum
    #  t.integer :timelimit
    #  t.boolean :enskipstep
    #  t.integer :assessment
    #  t.integer :ratio
    #  t.references  :teacher_user, null: true , foreign_key: false
    #  t.integer :responseall
    #  t.integer :responseok
    #  t.integer :responseerror
    #  t.integer :responseskip
    #  t.integer :notexec
    #  t.integer :timeleft
  
    #  t.timestamps
    #end
  
    #add_foreign_key :testexecs, :users, column: :teacheruser_id, primary_key: :id
  
    #create_table :testexecsteps do |t|
    #  t.references :testexec, null: false, foreign_key: true
    #  t.datetime :datestart
    #  t.datetime :datefinish
    #  t.references :itemtest, null: false, foreign_key: true
    #  t.string :response
    #  t.integer :ratio
    #  t.integer :duration
    #  t.integer :ordernum
    #  t.integer :countexec
    #  t.datetime :laststart
      
    #  t.timestamps
    #end
  end
end
