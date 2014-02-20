require_relative 'db_connection'
require_relative '01_mass_object'
require 'active_support/inflector'

class MassObject
  def self.parse_all(results)
    results.map do |result|
      self.new(result)
    end

    # objs = []
    # results.each_with_index do |hash, index|
    #   objs << self.new
    #   hash.each do |k,v|
    #     define_method("#{k}") { instance_variable_get("@#{k}")}
    #     define_method("#{k}=") { |param| instance_variable_set("@#{k}", param)}
    #     objs[index].send("#{k}=", v)
    #   end
    # end
    # objs
  end
end

class SQLObject < MassObject
  def self.columns
    return @columns unless @columns.nil?

    columns = DBConnection
          .execute2("SELECT * FROM #{self.table_name} LIMIT 1")
          .first.map(&:to_sym)

    columns.each do |column|
      define_method(column) { attributes[column] }
      define_method("#{column}=") { |param| attributes[column] = param }
    end

    @columns = columns
  end

  def self.table_name=(table_name)
    @table_name = table_name
  end

  def self.table_name
    @table_name ||= self.to_s.underscore.pluralize
  end

  def self.all
    results = DBConnection.execute(<<-SQL)
      SELECT
      *
      FROM
      #{self.table_name}
      SQL

    parse_all(results)
  end

  def self.find(id)
    results = DBConnection.execute(<<-SQL, id)
    SELECT
    *
    FROM
    #{self.table_name}
    WHERE
    #{self.table_name}.id = ?
    LIMIT 1
    SQL

    parse_all(results).first
  end

  def attributes
    @attributes ||= {}
  end

  def insert
    # question_marks = (["?"] * attributes.length).join(", ")
    question_marks = ("?," * attributes.length).chomp(",")
    col_names = @attributes.keys.join(", ")

    query = <<-SQL
    INSERT INTO #{self.class.table_name} (#{col_names})
    VALUES (#{question_marks})
    SQL

    DBConnection.execute(query, *attribute_values)

    self.id = DBConnection.last_insert_row_id
  end

  def initialize(params = {})
    all_columns = self.class.columns
    params.each do |k, v|
      k = k.to_sym
      if !all_columns.include?(k)
        raise "unknown attribute '#{k}'"
      else
        attributes[k] = v
      end
    end
  end

  def save
    # ...
  end

  def update

    set_lines = []
    attributes.each do |k, v|
      next if k == :id
      set_lines << "#{k} = '#{v}'"
    end

    set_line = set_lines.join(', ')


    query = <<-SQL
    UPDATE
    #{self.class.table_name}
    SET
    #{set_line}
    WHERE
    id = ?
    SQL

    DBConnection.execute(query, attributes[:id])

  end

  def attribute_values
    @attributes.values
  end
end

class Cat < SQLObject
end


