# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


JobApplication.destroy_all
Employee.destroy_all
User.destroy_all
Company.destroy_all
Skill.destroy_all
Job.destroy_all
 

puts "seed users" 
u1= User.create(username: "tor", password: "1111", email: "beastyboy447@gmail.com", name: "Tor", is_employer: false)
u2= User.create(username: "user", password: "1111", email: "torfrancis447@gmail.com", name: "Francis", is_employer: false)
u3= User.create(username: "francis", password: "1111", email: "no@no.com", name: "John", is_employer: true)
u4= User.create(username: "user1", password: "1111", email: "no@no.com", name: "Lacey", is_employer: true)
u5= User.create(username: "user3", password: "1111", email: "no@no.com", name: "Rose", is_employer: true)
u6= User.create(username: "user4", password: "1111", email: "no@no.com", name: "Alena", is_employer: true)

puts "seeding company"
c1 = Company.create(name: "Google", headquarters: "San Fransisco, California")
c2 = Company.create(name: "Netflix", headquarters: "San Fransisco, California")
c3 = Company.create(name: "Gsk", headquarters: "Atlanta, Georgia")
c4 = Company.create(name: "Facebook", headquarters: "Salt-Lake city, Utah")

puts "seed employee"
e1= Employee.create(user_id: u3.id, company_id: c1.id)
e2= Employee.create(user_id: u4.id, company_id: c1.id)
e3= Employee.create(user_id: u5.id, company_id: c2.id)
e4= Employee.create(user_id: u6.id, company_id: c3.id)



puts "seeding jobs hrly/salary"
js1= Job.create(description:Faker::Lorem.paragraph(sentence_count: 12, supplemental: false, random_sentences_to_add: 15), compensation_type:"Salary", compensation:Faker::Number.decimal(l_digits: 5, r_digits: 2), location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code, employment_type: ["full-time","part-time","contract"].sample, title: "Front-end Developer", company_id: c1.id)
js2= Job.create(description:Faker::Lorem.paragraph(sentence_count: 12, supplemental: false, random_sentences_to_add: 15), compensation_type:"Salary", compensation:Faker::Number.decimal(l_digits: 5, r_digits: 2), location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code, employment_type: ["full-time","part-time","contract"].sample, title: "Back-end Developer", company_id: c2.id)
js3= Job.create(description:Faker::Lorem.paragraph(sentence_count: 12, supplemental: false, random_sentences_to_add: 15), compensation_type:"Salary", compensation:Faker::Number.decimal(l_digits: 5, r_digits: 2), location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code, employment_type: ["full-time","part-time","contract"].sample, title: "Senior Developer", company_id: c1.id)

jh1= Job.create(description:Faker::Lorem.paragraph(sentence_count: 12, supplemental: false, random_sentences_to_add: 15) , compensation_type:"Hourly", compensation:Faker::Number.decimal(l_digits: 2, r_digits: 2), location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code, employment_type: ["full-time","part-time","contract"].sample, title: "Jr. Developer", company_id: c1.id)
jh2= Job.create(description:Faker::Lorem.paragraph(sentence_count: 11, supplemental: false, random_sentences_to_add: 15) , compensation_type:"Hourly", compensation:Faker::Number.decimal(l_digits: 2, r_digits: 2), location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code, employment_type: ["full-time","part-time","contract"].sample, title: "Web Developer", company_id: c2.id)
jh3= Job.create(description:Faker::Lorem.paragraph(sentence_count: 10, supplemental: false, random_sentences_to_add: 15) , compensation_type:"Hourly", compensation:Faker::Number.decimal(l_digits: 2, r_digits: 2), location_type: ["remote", "on-site", "hybrid"].sample, location: Faker::Address.zip_code, employment_type: ["full-time","part-time","contract"].sample, title: "Assocciate Developer", company_id: c2.id)

puts "seeding application"
j1= JobApplication.create(avaliability: Faker::Date.between(from: '2023-02-10', to: '2023-02-17'), sponsorship: Faker::Boolean.boolean, work_authorization: Faker::Boolean.boolean, user_id: u1.id, job_id: js1.id)
j2= JobApplication.create(avaliability: Faker::Date.between(from: '2023-02-10', to: '2023-02-17'), sponsorship: Faker::Boolean.boolean, work_authorization: Faker::Boolean.boolean, user_id: u1.id, job_id: js1.id)
j3= JobApplication.create(avaliability: Faker::Date.between(from: '2023-02-10', to: '2023-02-17'), sponsorship: Faker::Boolean.boolean, work_authorization: Faker::Boolean.boolean, user_id: u2.id, job_id: jh1.id)
JobApplication.create(avaliability: Faker::Date.between(from: '2023-02-10', to: '2023-02-17'), sponsorship: Faker::Boolean.boolean, work_authorization: Faker::Boolean.boolean, user_id: u2.id, job_id: jh2.id)
JobApplication.create(avaliability: Faker::Date.between(from: '2023-02-10', to: '2023-02-17'), sponsorship: Faker::Boolean.boolean, work_authorization: Faker::Boolean.boolean, user_id: u2.id, job_id: jh2.id)
JobApplication.create(avaliability: Faker::Date.between(from: '2023-02-10', to: '2023-02-17'), sponsorship: Faker::Boolean.boolean, work_authorization: Faker::Boolean.boolean, user_id: u2.id, job_id: js3.id)
JobApplication.create(avaliability: Faker::Date.between(from: '2023-02-10', to: '2023-02-17'), sponsorship: Faker::Boolean.boolean, work_authorization: Faker::Boolean.boolean, user_id: u1.id, job_id: jh3.id)
JobApplication.create(avaliability: Faker::Date.between(from: '2023-02-10', to: '2023-02-17'), sponsorship: Faker::Boolean.boolean, work_authorization: Faker::Boolean.boolean, user_id: u1.id, job_id: js3.id)

puts "seeding skills"
Skill.create(name: "javascript")
Skill.create(name: "MySQL" )
Skill.create(name: "java")
Skill.create(name: "aws")
Skill.create(name: "python")
Skill.create(name: "react")
Skill.create(name: "react")
Skill.create(name: "javascript")
Skill.create(name: "MySQL")
Skill.create(name: "java")
Skill.create(name: "aws")
Skill.create(name: "python")
Skill.create(name: "react")
Skill.create(name: "react")
