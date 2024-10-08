# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

[Attempt, Answer, Question, Test, User, Category].map(&:delete_all)

RUBY_CATEGORY_NAME = "Ruby"
ROR_CATEGORY_NAME = "RoR"
HTTP_CATEGORY_NAME = "HTTP"
SYSTEM_DESIGN_CATEGORY_NAME = "System Design"

categories = Category.create!([
                                { title: RUBY_CATEGORY_NAME },
                                { title: ROR_CATEGORY_NAME },
                                { title: HTTP_CATEGORY_NAME },
                                { title: SYSTEM_DESIGN_CATEGORY_NAME },
                              ])

http_test = Test.create!(title: "Коды HTTP запросов", level: 1, category: categories[2])

http_request_question = Question.create!(body: "Какой код ответа у успешного запроса?", test: http_test)
http_request_question.answers.create!(body: "403", correct: false)
http_request_question.answers.create!(body: "200")
http_request_question.answers.create!(body: "404", correct: false)
http_request_question.answers.create!(body: "503", correct: false)


users = %w[john alex elon].map do |name|
  User.create!({ nickname: name, email: "example@example.com" })
end

10.times { |n| Test.create!(title: "Test#{n}", level: rand(0..3), category: categories.sample, author: users.sample) }

# Users and attempts creation
tests = Test.all
users.each do |user|
  rand(5..10).times { |_| Attempt.create!(user:, test: tests.sample, in_progress: [false, true].sample) }
end
