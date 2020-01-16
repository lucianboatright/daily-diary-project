require 'pg'


class Diary

  attr_reader :id, :title, :body


  def initialize(id:, title:, body:)
    @id = id
    @title = title
    @body = body 
  end



  def self.add(title:, body:)
    if ENV['DATABASE'] =='test'
      connect = PG.connect(:dbname => 'diary_manager_test')
    else
      connect = PG.connect(:dbname => 'diary_manager')
    end

    result = connect.exec("INSERT INTO diary_note (note_title,note_body) VALUES('#{title}','#{body}') RETURNING id, note_title, note_body;")

    Diary.new(id: result[0]['id'], title: result[0]['note_title'], body: result[0]['note_body'])

  end

end