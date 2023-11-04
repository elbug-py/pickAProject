# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


# ---------------------------------------------------------------------------------------------------------
Project.destroy_all
User.destroy_all
Area.destroy_all
puts("Clean database")
# ---------------------------------------------------------------------------------------------------------

oc=Area.create(name:"Obras Civiles")
e=Area.create(name:"Eléctrica")
cc=Area.create(name:"Ciencias de la Computación")
i=Area.create(name:"Industrial")
a=Area.create(name:"Ambiental")

puts("Create the Areas")

# ---------------------------------------------------------------------------------------------------------

ca=User.create(name:"Claudio", last_name:"Alvarez", email:"calvarez@uandes.cl", role:"teacher",password:"password", area:cc)
rd=User.create(name:"Rafael", last_name:"Delpiano", email:"rdelpiano@uandes.cl", role:"teacher",password:"password",area:i)
po=User.create(name:"Profe", last_name:"Obras", email:"profeobras@uandes.cl", role:"teacher",password:"password",area:oc)
pe=User.create(name:"Profe", last_name:"Electro", email:"profeelectro@uandes.cl", role:"teacher",password:"password",area:e)
pa=User.create(name:"Profe", last_name:"Ambiental", email:"profeambiental@uandes.cl", role:"teacher",password:"password",area:a)

puts("Create the Teachers")

# ---------------------------------------------------------------------------------------------------------

User.create(name:"Estudiante",last_name:" de prueba", email:"tester@miuandes.cl", role:"student",password:"password",area:cc)

puts("Create the Basic student")

# ---------------------------------------------------------------------------------------------------------

User.create(name:"EL ",last_name:"Administrador", email:"admin@miuandes.cl", role:"admin",password:"password",area:cc)

puts ("Create the admin")

# ---------------------------------------------------------------------------------------------------------
proyect=ca.projects.new(title:"Projecto de ejemplo alvarez",description:"Este es un proyecto de ejemplo nomas", duration:"2 meses",is_payed:true,amount:0,vacancies:12, user_id:ca.id)
proyect.save

proyect1=rd.projects.new(title:"Projecto de ejemplo delpiano ",description:"Este es un proyecto de ejemplo nomas", duration:"1 meses",is_payed:true,amount:2,vacancies:2, user_id:rd.id, status: 0)
proyect1.save

proyect2=po.projects.new(title:"Projecto de ejemplo obras ",description:"Este es un proyecto de ejemplo nomas", duration:"4 meses",is_payed:true,amount:21,vacancies:20, user_id:po.id, status: 1)
proyect2.save

proyect3=pe.projects.new(title:"Projecto de ejemplo electro ",description:"Este es un proyecto de ejemplo nomas", duration:"6 meses",is_payed:true,amount:7,vacancies:9, user_id:pe.id)
proyect3.save

proyect4=pa.projects.new(title:"Projecto de ejemplo ambiental ",description:"Este es un proyecto de ejemplo nomas", duration:"7 meses",is_payed:true,amount:90,vacancies:8, user_id:pa.id)
proyect4.save

proyect5=ca.projects.new(title:"Projecto de ejemplo claudio 2 ",description:"Este es un proyecto de ejemplo nomas", duration:"5 meses",is_payed:true,amount:9,vacancies:7, user_id:ca.id)
proyect5.save

puts("Create a basic proyects")