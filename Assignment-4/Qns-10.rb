require 'colorize'
print "Enter the number of contact data  want to add:"
n=gets.chomp.to_i
contact_data=[]
contacts={}
n.times do |i|
  print "Enter the contact #{i+1}".yellow
  print "\nEnter the name: "
  name=gets.chomp
  contacts[name]={}
  print "Enter the email: "
  email=gets.chomp
  print "Enter the Address: "
  address=gets.chomp
  print "Enter the phone: "
  phone=gets.chomp
  contact_data << [email,address,phone]
    
end 

i=0
 contacts.each do |name,info|
     info["email"]=contact_data[i][0]
     info["address"]=contact_data[i][1]
     info["phone"]=contact_data[i][2]
     i+=1
 end

 puts contacts
