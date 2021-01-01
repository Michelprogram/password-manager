const express = require("express")
const app = express()

const database = require("./BDD").Database
const sqlite3 = require("sqlite3")
const path = require("./path").Path
const json = require("./managejson")

app.listen(3000,()=>{
  console.log("Le serveur écoute sur le port 3000")
})


//Check mail et pseudo
app.post(path.check, (req,res)=>{



  let flag = req.query.user ? true : false
  let info = null

  if (flag){
    database.request = "SELECT id FROM Users WHERE Pseudo = ?"
    info = req.query.user
    console.log("Check pseudo")
  }
  else{
    database.request = "SELECT id FROM Users WHERE Mail = ?"
    info = req.query.mail
    console.log("Check Mail")
  }

  database.db.all(database.request,[info],(err,rows)=>{
    if (err){
      res.send(json.databasefail(err.errno))
    }
    else {
      Object(rows[0]).id == undefined ? res.send(json.valid) : res.send(json.unvalid)
    }
  })
})

//Vérifie si le mdp correspond au pseudo
app.post(path.comb,(req,res)=>{

  console.log("Combinaison")

  let pseudo = req.query.pseudo
  let password = req.query.password
  database.request = "SELECT id FROM Users WHERE Pseudo = ? AND Password = ?"

  database.db.all(database.request,[pseudo,password],(err,rows)=>{
    if (err)
    {
      res.json(databasefail(err.erno))
    }
    else{
      rows.length >= 1 ? res.json(json.valid) : res.json(json.unvalid)
    }
  })

})

//Get userid
app.get(path.userid,(req, res)=>{

  console.log("User id")

  let pseudo = req.params.pseudo
  database.request = "SELECT id FROM Users WHERE Pseudo = ?"
  database.db.all(database.request,[pseudo],(err,rows)=>{
    err ? res.json(json.databasefail(err.errno)): res.json(Object(rows[0]))
  })
})

//Récupère tout les password d'un utilisateur
app.get(path.datauser,(req,res)=>{

  console.log("Data user")

  let userid = req.params.userid

  database.request = "SELECT Website,Identifiant,Password FROM Passwords WHERE Userid = ?"

  database.db.all(database.request,[userid],(err,rows)=>{
    err ? res.json(json.databasefail(err.errno)) : res.json(rows)
  })
})

//Ajout un utilisateur
app.post(path.adduser,(req,res)=>{

  console.log("Add user")

  let pseudo = req.query.user
  let password = req.query.password
  let mail = req.query.mail

  database.request = "INSERT INTO Users (Pseudo,Password,Mail) VALUES (?,?,?)"
  database.db.run(database.request,[pseudo,password,mail],(err)=>{
    err ? res.json(json.databasefail(err.errno)) : res.json(json.valid)
  })
})

//Ajout d'un password
app.post(path.addpassword,(req,res)=>{

  console.log("Add password")
  console.log(req.query)

  let userid = req.query.userid
  let website = req.query.website
  let identifiant = req.query.identifiant
  let password = req.query.password

  database.request = "INSERT INTO Passwords (Userid,Website,Identifiant,Password) VALUES (?,?,?,?)"

  database.db.run(database.request,[userid,website,identifiant,password],(err)=>{
    err ? res.json(json.databasefail(err.errno)) : res.json(json.valid)
  })
})

//Supprime un utilisateur
app.delete(path.delluser,(req,res)=>{

  console.log("Del user")

  let userid = req.query.userid

  database.request = "DELETE FROM Users WHERE id = ?"

  database.db.run(database.request,[userid],(err)=>{
    if (err){
      res.json(json.databasefail(err.errno))
    }
  })

  database.request = "DELETE FROM Passwords WHERE userid = ?"
  database.db.run(database.request,[userid],(err)=>{
    err ? res.json(json.databasefail(err.errno)) : res.json(json.valid)
  })

})

//Supprimer un MDP
app.delete(path.dellpassword,(req,res)=>{

  console.log("Dell password")

  let userid = req.query.userid
  let website = req.query.website
  let password = req.query.password

  database.request = "DELETE FROM Passwords WHERE userid = ? and Website = ? and Password = ?"

  database.db.run(database.request,[userid,website,password],(err)=>{
    err ? res.json(json.databasefail(err.errno)) : res.json(json.valid)
  })
})
