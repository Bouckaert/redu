class CreateBoxroom < ActiveRecord::Migration
  def self.up
    create_table 'folders', :force => true do |t|
      t.column 'name', :string
      t.column 'date_modified', :datetime
      t.column 'user_id', :integer
      t.column 'parent_id', :integer
      t.column 'school_id', :integer
     # t.column 'is_root', :boolean, :default => false
    end
#    add_index :folders, :name
#    add_index :folders, :date_modified
#    add_index :folders, :user_id
#    add_index :folders, :parent_id
#    add_index :folders, :is_root

    create_table 'group_permissions', :force => true do |t|
      t.column 'folder_id', :integer
      t.column 'group_id', :integer
      t.column 'school_id', :integer
      t.column 'can_create', :boolean, :default => false
      t.column 'can_read', :boolean, :default => false
      t.column 'can_update', :boolean, :default => false
      t.column 'can_delete', :boolean, :default => false
    end
#    add_index :group_permissions, :folder_id
#    add_index :group_permissions, :school_id
#    add_index :group_permissions, :group_id
#    add_index :group_permissions, :can_create
#    add_index :group_permissions, :can_read
#    add_index :group_permissions, :can_update
#    add_index :group_permissions, :can_delete

    create_table 'groups', :force => true do |t|
      t.column 'name', :string
      t.column 'is_the_administrators_group', :boolean, :default => false
    end
#    add_index :groups, :name
#    add_index :groups, :is_the_administrators_group

    create_table 'groups_users', :id => false, :force => true do |t|
      t.column 'group_id', :integer
      t.column 'user_id', :integer
    end
#    add_index :groups_users, [:group_id, :user_id]

    create_table 'myfiles', :force => true do |t|
      t.column 'filename', :string
      t.column 'filesize', :integer
      t.column 'date_modified', :datetime
      t.column 'folder_id', :integer
      t.column 'user_id', :integer
    end
#    add_index :myfiles, :filename
#    add_index :myfiles, :filesize
#    add_index :myfiles, :date_modified
#    add_index :myfiles, :folder_id
#    add_index :myfiles, :user_id

#    create_table 'usages', :force => true do |t|
#      t.column 'download_date_time', :datetime
#      t.column 'myfile_id', :integer
#      t.column 'user_id', :integer
#    end
#    add_index :usages, :download_date_time
#    add_index :usages, :myfile_id
#    add_index :usages, :user_id

  end

  def self.down
    drop_table 'folders'
    drop_table 'groups'
    drop_table 'groups_users'
    drop_table 'myfiles'
    drop_table 'usages'
  end
end