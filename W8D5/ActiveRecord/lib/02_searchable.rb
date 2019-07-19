require_relative 'db_connection'
require_relative '01_sql_object'

module Searchable
  def where(params)
    
    where_line = params.keys.map {|keys| " #{keys} = ? "}.join("AND")

    var = DBConnection.execute(<<-SQL, *(params.values))
    SELECT 
      #{self.table_name}.*
    FROM 
      #{self.table_name}
    WHERE
      #{where_line}
    SQL
    self.parse_all(var)
  end
end

class SQLObject
  # Mixin Searchable here...
  extend Searchable
end
