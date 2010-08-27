class KindeditorController < ApplicationController
  protect_from_forgery :except => :upload  

  def upload  
    @image = KindeditorImage.new(:data => params[:imgFile])  
    if @image.save  
      render :text => {"error" => 0, "url" => @image.data.url}.to_json  
    else  
      render  :text => {"error" => 1}  
    end  
  end  

  def images_list 
    <%
      case options[:orm].to_s
      when 'active_record'  
        order="@images=KindeditorImage.order(order_param)"
      when 'mongoid'
        order="@images=KindeditorImage.asc(order_param)"
      end
    %>
   <%=order%>
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

  private

  def order_param
    params[:order] || "data_file_name"
  end
end