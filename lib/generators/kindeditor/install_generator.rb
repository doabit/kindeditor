module Kindeditor
  class InstallGenerator < Rails::Generators::Base
    desc "Copies all kindeditor files  to your Rails.root/public/kindeditor."
    source_root File.expand_path('../templates', __FILE__)
    def install
      src_dir = File.join(self.class.source_root, 'kindeditor')
      dst_dir="#{Rails.root}/public/javascripts/kindeditor"
      directory src_dir, dst_dir
    end

  end
end