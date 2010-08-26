class KindeditorImage
  include Mongoid::Document
  field :data_file_name
  field :data_content_type
  field :data_file_size
  field :data_updated_at,:type => DateTime
  
  before_create :randomize_file_name
   has_attached_file :data
   
   private
   def randomize_file_name

     unless data_file_name.nil?
       extension = File.extname(data_file_name).downcase
       self.data.instance_write(:file_name, "#{ActiveSupport::SecureRandom.hex(16)}#{extension}")
     end
   end
end