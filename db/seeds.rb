# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

users = User.create([{first_name: "Mary", last_name: "Wallace", email: "mwallaca@westingroup.com", company: "Westin Hotels", address1: "54 Luca Ave", address2: "Suite 504", zip: "14467", city: "Springfield", state_long: "Missouri", state: "MO", phone: "844-836-1082"},
  {first_name: "Jennifer", last_name: "Frey", email: "manyhats@googlw.com", company: "Mink Growers Cp.", address1: "223 Main st", address2: "#7", zip: "02373", city: "Milford", state_long: "Vermont", state: "VT", phone: "223-449-0292"},
  {first_name: "Jennifre", last_name: "Frey", email: "manyhats@google.com", company: "Mink Growers Co.", address1: "233 Main st", address2: "#7", zip: "02373", city: "Milford", state_long: "Vermont", state: "VM", phone: "223-449-0292"},
  {first_name: "Chris", last_name: "Ward", email: "cward@TCIS.edu", company: "Thailand College of International Studies", address1: "7 Yorktown Street", address2: "apt 1", zip: "02132", city: "Boston", state_long: "Massachusetts", state: "MA", phone: "857-669-1581"},
  {first_name: "Chris", last_name: "Ward", email: "chillguy@gmail.com", company: "Thailand College of Int'l Studies", address1: "7 Yorktown st", address2: "", zip: "02132", city: "West Roxbury", state_long: "Massachusetts", state: "MA", phone: "617-469-3396"}])
