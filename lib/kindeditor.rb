# Kindeditor
module Kindeditor
  include ActionView
  module ActionView::Helpers::AssetTagHelper
    def kindeditor_javacript_include_tag(*args)
      options=args.extract_options!
      if args.empty?
         javascript_include_tag("kindeditor/kindeditor-min","kindeditor/kindeditor_config",options)
      else
         javascript_include_tag(args.insert(0,"kindeditor/kindeditor-min"),options)
      end
    end
  end
end
