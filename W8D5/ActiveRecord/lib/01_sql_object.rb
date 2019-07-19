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
    var = DBConnection.execute(<<-SQL)
    SELECT 
      #{self.table_name}.* 
    FROM 
      #{self.table_name}
    SQL
    self.parse_all(var)
  end
  
  def self.parse_all(results)
    # ...
    # debugger
    arr = []
    results.each do |hash|
      arr << self.new(hash)
    end
    arr
  end

  def self.find(id)
    # ...
    var = DBConnection.execute(<<-SQL, id)
    SELECT 
      #{self.table_name}.*
    FROM 
      #{self.table_name}
    WHERE
      id = ?
    SQL

    if var.empty?
      return nil
    else
      self.parse_all(var).first
    end
  end

  def initialize(params = {})
    # ...
    params.each do |attr_name, val|
        
        if self.class.columns.include?(attr_name.to_sym)
          self.send("#{attr_name.to_sym}=", val)
        else
          raise "unknown attribute '#{attr_name}'" 
        end
    end

  end

  def attributes
    @attributes ||= {}
  end

  def attribute_values
    # ...
    self.class.columns.map {|col| self.send(col)} 
  end
  
  def insert
    all_columns = (self.class.columns).drop(1)
    col_names = all_columns.join(", ")
    attribute_array = attribute_values.drop(1)
    question_marks = (["?"] * attribute_array.length).join(", ")
# debugger
   DBConnection.execute(<<-SQL, *attribute_array)
    INSERT INTO 
      #{self.class.table_name} (#{col_names})
    VALUES
      (#{question_marks})
    SQL
# debugger
    self.id = DBConnection.last_insert_row_id
    
  end

  def update
    attr_name = self.class.columns.map { |col| "#{col} = ?" }.join(', ')
    attribute_arr = attribute_values
# debugger
    DBConnection.execute(<<-SQL, *attribute_arr, self.id)
    UPDATE
      #{self.class.table_name} 
    SET
      #{attr_name}  
    WHERE
      #{self.class.table_name}.id = ?   
    SQL
  end

  # SET
  #   col1 = ?, col2 = ?, col3 = ?

  def save
    self.id.nil? ? insert : update
  end
  
end


# {("count > ?"), titles.length}