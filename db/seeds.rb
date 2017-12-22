# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.create(name: 'Jim')
User.create(name: 'Bob')
User.create(name: 'Mary')
User.create(name: 'Hermelindo')

Poll.create(title: 'Dog', author_id: 1)
Poll.create(title: 'Age', author_id: 2)
Poll.create(title: 'Color', author_id: 3)
Poll.create(title: 'Salary', author_id: 4)

Question.create(text: 'Do you own a dog?', poll_id: 1)
Question.create(text: 'What is your dogs age?', poll_id: 2)
Question.create(text: 'What is your dogs color?', poll_id: 3)
Question.create(text: 'How much lower is your salary than mine?', poll_id: 4)

AnswerChoice.create(text: 'No', question_id: 1)
AnswerChoice.create(text: 'Yes', question_id: 1)
AnswerChoice.create(text: '10', question_id: 2)
AnswerChoice.create(text: 'Sunset Yellow', question_id: 3)
AnswerChoice.create(text: 'Infinity', question_id: 4)

Response.create(user_id: 4, answer_choice_id: 1)
Response.create(user_id: 1, answer_choice_id: 4)
Response.create(user_id: 2, answer_choice_id: 3)
Response.create(user_id: 3, answer_choice_id: 2)
