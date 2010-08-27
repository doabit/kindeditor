require 'spec_helper'
require 'generators/kindeditor/install_generator'

describe Kindeditor::InstallGenerator do
  before do
    @generator = Kindeditor::InstallGenerator.new([], {}, {})
  end

end