# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


Application.destroy_all
Employee.destroy_all
Company.destroy_all
User.destroy_all

Job.destroy_all



u1= User.create(username: "tor", password_digest: 1111, email: "no@no.com",name: "tor", phone_number: 6787902697)
u2= User.create(username: "francis", password_digest: 1111, email: "no@no.com",name: "francis", phone_number: 6787902697)

c1 = Company.create(name: "Google", headquarters: "San Fransisco, California")

e1= Employee.create(user_id: e1.id, company_id: c1.id)

js1= Job.create(description:Faker::Lorem.paragraphs, is_hourly: null, hourly: null, is_salary: true, salary: Faker::Number.decimal(l_digits: 5, r_digits: 2), location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code)
js2= Job.create(description:Faker::Lorem.paragraphs, is_hourly: null, hourly: null, is_salary: true, salary: Faker::Number.decimal(l_digits: 5, r_digits: 2), location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code)
js3= Job.create(description:Faker::Lorem.paragraphs, is_hourly: null, hourly: null, is_salary: true, salary: Faker::Number.decimal(l_digits: 5, r_digits: 2), location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code)

jh1= Job.create(description:Faker::Lorem.paragraphs, is_hourly: true, hourly:Faker::Number.decimal(l_digits: 2, r_digits: 2), is_salary: null, salary: null, location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code)
jh2= Job.create(description:Faker::Lorem.paragraphs, is_hourly: true, hourly: Faker::Number.decimal(l_digits: 2, r_digits: 2), is_salary: null, salary: null, location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code)
jh3= Job.create(description:Faker::Lorem.paragraphs, is_hourly: true, hourly: Faker::Number.decimal(l_digits: 2, r_digits: 2), is_salary: null, salary: null, location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code)

Application.create(avaliability: Faker::Date.between(from: '2023-02-10', to: '2023-02-17'), sponsorship: Faker::Boolean.boolean, work_authorization: Faker::Boolean.boolean, user_id: u1.id, job_id: j1.id)

Skill.create(javascript: Faker::Boolean.boolean, ruby: Faker::Boolean.boolean,react: Faker::Boolean.boolean, rails: Faker::Boolean.boolean, frontend: Faker::Boolean.boolean, backend: Faker::Boolean.boolean, job_id: js1.id)
Skill.create(javascript: Faker::Boolean.boolean, ruby: Faker::Boolean.boolean,react: Faker::Boolean.boolean, rails: Faker::Boolean.boolean, frontend: Faker::Boolean.boolean, backend: Faker::Boolean.boolean, job_id: js2.id)
Skill.create(javascript: Faker::Boolean.boolean, ruby: Faker::Boolean.boolean,react: Faker::Boolean.boolean, rails: Faker::Boolean.boolean, frontend: Faker::Boolean.boolean, backend: Faker::Boolean.boolean, job_id: js3.id)
Skill.create(javascript: Faker::Boolean.boolean, ruby: Faker::Boolean.boolean,react: Faker::Boolean.boolean, rails: Faker::Boolean.boolean, frontend: Faker::Boolean.boolean, backend: Faker::Boolean.boolean, job_id: jh1.id)
Skill.create(javascript: Faker::Boolean.boolean, ruby: Faker::Boolean.boolean,react: Faker::Boolean.boolean, rails: Faker::Boolean.boolean, frontend: Faker::Boolean.boolean, backend: Faker::Boolean.boolean, job_id: jh1.id)
Skill.create(javascript: Faker::Boolean.boolean, ruby: Faker::Boolean.boolean,react: Faker::Boolean.boolean, rails: Faker::Boolean.boolean, frontend: Faker::Boolean.boolean, backend: Faker::Boolean.boolean, job_id: jh2.id)
Skill.create(javascript: Faker::Boolean.boolean, ruby: Faker::Boolean.boolean,react: Faker::Boolean.boolean, rails: Faker::Boolean.boolean, frontend: Faker::Boolean.boolean, backend: Faker::Boolean.boolean, job_id: jh2.id)