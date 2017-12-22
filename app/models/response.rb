# == Schema Information
#
# Table name: responses
#
#  id               :integer          not null, primary key
#  user_id          :integer          not null
#  answer_choice_id :integer          not null
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Response < ApplicationRecord
  # validates_uniqueness_of :user_id, :answer_choice_id
  # validate :cannot_answer_twice, :cannot_answer_own_question
  # def sibling_responses





  belongs_to :respondent,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User

  belongs_to :answer_choice,
    primary_key: :id,
    foreign_key: :answer_choice_id,
    class_name: :AnswerChoice


  has_one :question,
    through: :answer_choice,
    source: :question

  has_one :author,
    through: :question,
    source: :author

  def sibling_responses
    question.responses.where.not(id: @id)
  end

  def respondent_already_answered?
    !sibling_responses.where(user_id: @user_id).nil?
  end

  def cannot_answer_twice
    if respondent_already_answered?
      errors[:respondent] << 'cannot answer twice'
    end
  end

  def cannot_answer_own_question

    if answer_choice.question.poll.author.id == @user_id
      errors[:respondent] << 'cannot be the author'
    end
  end
end
