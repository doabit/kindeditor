# Kindeditor
include ActionView
module ActionView::Helpers::AssetTagHelper
  
  def kindeditor_javacript_include_tag
    javascript_include_tag( "kindeditor/kindeditor-min","kindeditor/kindeditor_config" )
  end
end