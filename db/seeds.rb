User.create name: "Antonio E. Morrison", email: "AntonioEMorrison@jourrapide.com"
User.create name: "Brenda R. Jackson", email: "BrendaRJackson@teleworm.us"
User.create name: "Rodney M. Colwell", email: "RodneyMColwell@jourrapide.com"
User.create name: "Christa R. Rivera", email: "ChristaRRivera@rhyta.com"

MessageTemplate.create body: "Welcome, %{user.name}! Thanks for joining our spam list!", title: "Welcome template"
