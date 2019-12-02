
#  dd/mm/yyyy
user = User.create(name: "Angela", email: "angela@sgm.com", password: "Angela")
user.tasks.create(date_worked: "01/11/2019", task: "Puttying", project_title: "Holy Name School", hrs_worked: 2.50)
user.tasks.create(date_worked: "01/11/2019", task: "Whiting", project_title: "Holy Name School", hrs_worked: 1.00)
user.tasks.create(date_worked: "01/11/2019", task: "Picking", project_title: "Holy Name School", hrs_worked: 3.00)
user.tasks.create(date_worked: "04/11/2019", task: "Puttying", project_title: "Sharla Bush", hrs_worked: 4.00)
user.tasks.create(date_worked: "05/11/2019", task: "Whiting", project_title: "Sharla Bush", hrs_worked: 2.00)
user.tasks.create(date_worked: "06/11/2019", task: "Picking", project_title: "Sharla Bush", hrs_worked: 3.00)

user2 = User.create(name: "Sally", email: "sally@sgm.com", password: "Sally")
user2.tasks.create(date_worked: "02/11/2019", task: "Scrubbing", project_title: "Holy Name School", hrs_worked: 3.00)
user2.tasks.create(date_worked: "03/11/2019", task: "Polishing", project_title: "Holy Name School", hrs_worked: 3.00)
user2.tasks.create(date_worked: "07/11/2019", task: "Scrubbing", project_title: "Sharla Bush", hrs_worked: 5.00)
user2.tasks.create(date_worked: "08/11/2019", task: "Polishing", project_title: "Sharla Bush", hrs_worked: 6.00)
