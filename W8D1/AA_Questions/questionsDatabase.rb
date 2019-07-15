require 'sqlite3'
require 'singleton'
require 'byebug'

# questions_id = QuestionsDatabase.instance.execute(<<-SQL,id)

#         SQL
#     Questions.new(questions_id.first)

class QuestionsDatabase < SQLite3::Database
  include Singleton
  
  def initialize()
    super('questions.db')
    self.type_translation = true
    self.results_as_hash = true
  end

end


class Users
    attr_accessor  :id,:fname,:lname
    
    def self.find_by_id(id)
        user_id = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT 
        *
        FROM
        users
        WHERE 
        id = ?;
        SQL
        Users.new(user_id.first)
    end
    
    def initialize(options)
        @id = options['id']
        @fname = options['fname']
        @lname = options['lname']
    end
end

class Questions 
    attr_accessor  :id,:title,:body,:author_id
    
    def self.find_by_id(id)
        questions_id = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT 
        *
        FROM
        questions
        WHERE 
        id = ?;
        SQL
    Questions.new(questions_id.first)   
    end

  def self.find_by_autor_id(author_id)
    author = QuestionsDatabase.instance.execute(<<-SQL, author_id)
    SELECT
      author_id
    FROM
      questions
    
    SQL
  end

  def initialize(options)
      @id = options['id']
      @title = options['title']
      @body = options['body']
      @author_id = options['author_d']
  end
end


class QuestionFollows 

    attr_accessor  :id,:user_id,:question_id
    
    def self.find_by_id(id)
            questions_follows_id = QuestionsDatabase.instance.execute(<<-SQL,id)
        SELECT 
            *
        FROM
        question_follows
        WHERE 
        id = ?;
        SQL
        QuestionFollows.new(questions_follows_id.first)
    
    end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end


class Replies 
  attr_accessor :id, :parent_reply, :question_id, :parent_user_id
  
  def self.find_by_id(id)
        replies_id = QuestionsDatabase.instance.execute(<<-SQL,id)
    SELECT 
        *
    FROM
    replies
    WHERE 
    id = ?;
    SQL
    Replies.new(replies_id.first)
         
  end

  def initialize(options)
    @id = options['id']
    @parent_reply = options['parent_reply']
    @question_id = options['question_id']
    @parent_user_id = options['parent_user_id']
  end
end


class QuestionLikes
  attr_accessor :id, :user_id, :question_id

  def self.find_by_id(id)
    likes = QuestionsDatabase.instance.execute(<<-SQL,id)
    SELECT 
        *
    FROM
      question_likes
    WHERE 
      id = ?;
    SQL
    QuestionLikes.new(likes.first)
  end

  def initialize(options)
    @id = options['id']
    @user_id = options['user_id']
    @question_id = options['question_id']
  end
end
