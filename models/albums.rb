require_relative("../db/sql_runner")

class Album

attr_accessor :title, :genre
attr_reader :id, :artist_id

  def initialize(options)

    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @genre = options["genre"]
    @artist_id = options["artist_id"].to_i

  end


  def save()
    sql = "INSERT INTO albums (title, genre, artist_id) VALUES ($1, $2, $3) RETURNING id"
    values = [@title, @genre, @artist_id]
    result = SqlRunner.run(sql, values)
    @id = result[0]["id"].to_i
  end

  def self.all()
    sql = "SELECT * FROM albums"
    result = SqlRunner.run(sql)
    return result.map{|result_hash| Album.new(result_hash)}
  end

  def list_artist()
    sql = "SELECT * FROM artists WHERE id = $1"
    values = [@artist_id]
    result = SqlRunner.run(sql, values)
    return result.map{|result_hash| Artist.new(result_hash)}

  end

  def update_album()
    sql = "UPDATE albums SET (title, genre, artist_id) = ($1, $2, $3) WHERE id = $4"
    values = [@title, @genre, @artist_id, @id]
    SqlRunner.run(sql, values)
  end

  def delete_album()
    sql = "DELETE FROM albums WHERE id = $1"
    values = [@id]
    SqlRunner.run(sql, values)
  end

  def self.find_album(id)
    sql = "SELECT * FROM albums WHERE id = $1"
    values = [id]
    result = SqlRunner.run(sql, values)
    return result.map {|result_hash| Album.new(result_hash)}

  end


end
