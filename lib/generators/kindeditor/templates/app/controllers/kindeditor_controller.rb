class KindeditorController < ApplicationController
  protect_from_forgery :except => :upload  

    def upload  
      @image = KindEditorImage.new(:data => params[:imgFile])  
      if @image.save  
        render :text => {"error" => 0, "url" => @image.data.url}.to_json  
      else  
        render  :text => {"error" => 1}  
      end  
    end  

    def images_list 
      
      @images = KindEditorImage.order(order_param)
      @json = []  
      for image in @images  
        temp =  %Q/{"filesize" : #{image.data.size},  
                   "filename" : "#{image.data_file_name}",  
                   "dir_path" : "#{image.data.url}",  
                   "datetime" : "#{image.created_at}"}/  
        @json << temp     
      end     
        render :text => ("{\"file_list\":[" << @json.join(", ") << "]}")  
    end
    
    def order_param
     params[:order] || "data_file_name"
    end
end