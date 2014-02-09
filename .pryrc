# Vim as default editor
Pry.config.editor = "vim"

# Prompt with ruby version
Pry.prompt = [proc { |obj, nest_level| "pry[#{RUBY_VERSION}] (#{obj}):#{nest_level} > " }, proc { |obj, nest_level| "#{RUBY_VERSION} (#{obj}):#{nest_level} * " }]

begin
  require 'awesome_print' 
  Pry.config.print = proc { |output, value| Pry::Helpers::BaseHelpers.stagger_output("=> #{value.ai}", output) }
rescue LoadError => err
  puts "no awesome_print :("
end

class Array
  def self.toy(n=10, &block)
    block_given? ? Array.new(n,&block) : Array.new(n) {|i| i+1}
  end
end

class Hash
  def self.toy(n=10)
    Hash[Array.toy(n).zip(Array.toy(n){|c| (96+(c+1)).chr})]
  end
end

if defined?(ActiveRecord::Base)
  class ActiveRecord::Base
    class << self
      def [](id)
        find_by_identifier(id)
      end
    end
  end
end

class Object
  def local_methods
    (methods - Object.instance_methods).sort
  end
end
