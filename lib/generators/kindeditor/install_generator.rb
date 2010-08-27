module Kindeditor
  class InstallGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    source_root File.expand_path('../templates', __FILE__)
    desc "Copies all kindeditor files  to your Rails.root/public/kindeditor."
    class_option :orm, :type => :string, :aliases => "-o", :default => "active_record",
    :desc => "Orm for rails,'active_record' or 'mongoid'."

    def copy_kindeditor
      src_dir = File.join(self.class.source_root, 'kindeditor')
      dst_dir="#{Rails.root}/public/javascripts/kindeditor"
      directory src_dir, dst_dir
    end

    def copy_app
      copy_controller
      copy_model
    end
    
    def create_rotes
      route "post 'kindeditor/upload'"
      route "get 'kindeditor/images_list'"
    end
    
    def read_me
      readme "README" if behavior == :invoke
    end

    def self.next_migration_number(dirname)
      if ActiveRecord::Base.timestamped_migrations
        Time.now.utc.strftime("%Y%m%d%H%M%S")
      else
        "%.3d" % (current_migration_number(dirname) + 1)
      end
    end

    protected
    def copy_controller
      template 'app/controllers/kindeditor_controller.rb',"app/controllers/kindeditor_controller.rb"
    end

    def copy_model
      case options[:orm].to_s
      when "active_record"
        template 'app/models/kindeditor_image.rb',"app/models/kindeditor_image.rb"
        copy_migration
      when "mongoid"
        template 'mongoid/kindeditor_image.rb','app/models/kindeditor_image.rb'
      end
    end

    def copy_migration
      migration_template "create_kindeditor_images.rb", "db/migrate/create_kindeditor_images.rb"
    end
  end
end