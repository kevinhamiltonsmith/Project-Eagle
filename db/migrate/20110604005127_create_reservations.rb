class CreateReservations < ActiveRecord::Migration
  def self.up
    create_table :reservations do |t|
      t.date :date
      t.boolean :availability, :default => "true"
      t.string :0630
      t.string :0637
      t.string :0645
      t.string :0652
      t.string :0700
      t.string :0707
      t.string :0715
      t.string :0723
      t.string :0730
      t.string :0737
      t.string :0745
      t.string :0752
      t.string :0800
      t.string :0807
      t.string :0815
      t.string :0823
      t.string :0830
      t.string :0837
      t.string :0845
      t.string :0852
      t.string :0900
      t.string :0907
      t.string :0915
      t.string :0923
      t.string :0930
      t.string :0937
      t.string :0945
      t.string :0952
      t.string :1000
      t.string :1007
      t.string :1015
      t.string :1023
      t.string :1030
      t.string :1037
      t.string :1045
      t.string :1052
      t.string :1100
      t.string :1107
      t.string :1115
      t.string :1123
      t.string :1130
      t.string :1137
      t.string :1145
      t.string :1152
      t.string :1200
      t.string :1207
      t.string :1215
      t.string :1223
      t.string :1230
      t.string :1237
      t.string :1245
      t.string :1252
      t.string :1300
      t.string :1307
      t.string :1315
      t.string :1323
      t.string :1330
      t.string :1337
      t.string :1345
      t.string :1352
      t.string :1400
      t.string :1407
      t.string :1415
      t.string :1423
      t.string :1430
      t.string :1437
      t.string :1445
      t.string :1452
      t.string :1500
      t.string :1507
      t.string :1515
      t.string :1523
      t.string :1530
      t.string :1537
      t.string :1545
      t.string :1552
      t.string :1600
      t.timestamps
    end
  end

  def self.down
    drop_table :reservations
  end
end
