const sqlite3 = require("sqlite3")

const Database = new class  {
  constructor() {
    this.db
    this.request = ""
    this.connectBDD()
  }
  connectBDD(){
    this.db = new sqlite3.Database("./database.sqlite",(err) =>{
     if (err){
       console.log(`Erreur lors de la connection : ${err}`)
     }else{
       console.log("Connection résussie")
     }
   })
  }
}

exports.Database = Database
