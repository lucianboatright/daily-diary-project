require_relative '../../lib/diary'

describe Diary do
  it 'add stores title and note body in database' do 
    diary_1 = Diary.add(title: 'Note_1', body: "Hello")
    saved_note = PG.connect(:dbname => 'diary_manager_test').query("SELECT * FROM diary_note WHERE id = #{diary_1.id};")

    expect(diary_1).to be_a Diary
    expect(diary_1.id).to eq saved_note.first['id']
    expect(diary_1.title).to eq 'Note_1'
    expect(diary_1.body).to eq 'Hello'
  end
end

