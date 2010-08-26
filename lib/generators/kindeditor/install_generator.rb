
module Kindeditor
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)
    desc "Copies all kindeditor files  to your Rails.root/public/kindeditor."

    def copy_kindeditor
      src_dir = File.join(self.class.source_root, 'kindeditor')
      dst_dir="#{Rails.root}/public/javascripts/kindeditor"
      directory src_dir, dst_dir
    end

    def copy_app_files
      template 'app/controllers/kindeditor_controller.rb',"app/controllers/kindeditor_controller.rb"
      template 'app/models/kindeditor_image.rb',"app/models/kindeditor_image.rb"
    end

    def copy_migration
      migration_template "create_kindeditor_images.rb", "db/migrate/create_kindeditor_images.rb"
    end


    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

  end
end