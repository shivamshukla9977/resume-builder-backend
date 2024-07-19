# db/seeds.rb

# Create Users
users = User.create([
  {
    first_name: 'John',
    middle_name: 'A',
    last_name: 'Doe',
    email: 'john.doe@example.com',
    city: 'New York',
    state: 'NY',
    country: 'USA'
  },
  {
    first_name: 'Jane',
    middle_name: 'B',
    last_name: 'Smith',
    email: 'jane.smith@example.com',
    city: 'Los Angeles',
    state: 'CA',
    country: 'USA'
  },
  {
    first_name: 'Alice',
    middle_name: 'C',
    last_name: 'Johnson',
    email: 'alice.johnson@example.com',
    city: 'Chicago',
    state: 'IL',
    country: 'USA'
  },
  {
    first_name: 'Bob',
    middle_name: 'D',
    last_name: 'Brown',
    email: 'bob.brown@example.com',
    city: 'Houston',
    state: 'TX',
    country: 'USA'
  },
  {
    first_name: 'Charlie',
    middle_name: 'E',
    last_name: 'Davis',
    email: 'charlie.davis@example.com',
    city: 'Phoenix',
    state: 'AZ',
    country: 'USA'
  }
])

# Create Educations
users.each do |user|
  user.educations.create([
    { title: 'B.Sc. Computer Science', organisation: 'University A', start_year: 2010, finish_year: 2014 },
    { title: 'M.Sc. Computer Science', organisation: 'University B', start_year: 2015, finish_year: 2017 }
  ])
end

# Create Skills
users.each do |user|
  user.skills.create([
    { title: 'Ruby on Rails' },
    { title: 'JavaScript' },
    { title: 'HTML/CSS' }
  ])
end

# Create Links
users.each do |user|
  user.links.create([
    { title: 'LinkedIn', link: 'https://linkedin.com/in/user' },
    { title: 'GitHub', link: 'https://github.com/user' }
  ])
end

# Create Projects
users.each do |user|
  user.projects.create([
    { title: 'Project A', description: 'Description for project A', duration: '6 months' },
    { title: 'Project B', description: 'Description for project B', duration: '1 year' }
  ])
end

# Create Overviews
users.each do |user|
  user.overviews.create([
    { title: 'Professional Summary', summary: 'Experienced software developer with expertise in Ruby on Rails.' }
  ])
end

# Create Jobs
users.each do |user|
  user.jobs.create([
    { title: 'Software Developer', company_name: 'Company X', start_from: '2018-01-01', leave_on: '2020-01-01', job_type: 'on-site' },
    { title: 'Senior Software Developer', company_name: 'Company Y', start_from: '2020-02-01', leave_on: nil, job_type: 'remote' }
  ])
end

puts 'Seed data created successfully!'
