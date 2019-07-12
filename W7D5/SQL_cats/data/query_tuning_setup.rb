require 'pg'

def execute(sql)
  conn = PG::Connection.open(:dbname => 'meowtime', password: 'MIkuni0319')
  query_result = conn.exec(sql).values
  conn.close
  
  query_result
end