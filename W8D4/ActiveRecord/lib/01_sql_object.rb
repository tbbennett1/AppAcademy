require 'byebug'
require_relative 'db_connection'
require 'active_support/inflector'
# NB: the attr_accessor we wrote in phase 0 is NOT used in the rest
# of this project. It was only a warm up.

class SQLObject

  def self.columns
    # ...
  @columns ||= 
   var = DBConnection.execute2(<<-SQL)
      SELECT
        *
      FROM
        #{self.table_name}
      LIMIT
        0
    SQL
    .first.map(&:to_sym)

  end
  
  def self.finalize!
    # new_attr =  self.instance_variable_get(@attributes) 
    columns.each do |column_name|
      define_method(column_name) do
        attributes[column_name] 
      end
    end

    columns.each do |column_name|
      define_method("#{column_name}=") do |val|
        # debugger
        attributes[column_name] = val
      end
    end
    
  end

  def self.table_name=(table_name)
    # ...
    table_name
  end

  def self.table_name
    # ...
    new_name = "#{self}"
    new_name.downcase! 
    new_name += "s"
  end

  def self.all
    # ...
  end

  def self.parse_all(results)
    # ...
  end

  def self.find(id)
    # ...
  end

  def initialize(params = {})
    # ...
    params.each do |attr_name, val|

        if self.class.columns.include?(attr_name)
          self.send("#{attr_name}=", val)
        else
          raise "unknown attribute '#{attr_name}'" 
        end
    end

  end

  def attributes
    # ...
    @attributes ||= Hash.new(0)

  end

  def attribute_values
    # ...
  end

  def insert
    # ...
  end

  def update
    # ...
  end

  def save
    # ...
  end
end
