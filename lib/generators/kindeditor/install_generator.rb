module Kindeditor
  class InstallGenerator < Rails::Generators::Base
    source_root File.expand_path('../templates', __FILE__)
    def install
      src_dir = File.join(self.class.source_root, 'kindeditor')
      dst_dir="#{Rails.root}/public/javascripts/kindeditor"
      directory src_dir, dst_dir
      puts "Install kindeitor in #{dst_dir}"
    end
  end
end