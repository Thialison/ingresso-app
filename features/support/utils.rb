# frozen_string_literal: true

# Useful and common methods to use all over the project
module Utils
  def app_path
    Dir.glob("#{Dir.pwd}/app/*.apk").last
  end

  def app_available?
    begin
      File.file?(app_path)
    rescue
      false
    end
  end
end
