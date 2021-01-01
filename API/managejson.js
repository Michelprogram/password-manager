const valid = {
  "info": true
}

const unvalid = {
  "info": false
}

const datauser = {

}

const databasefail = (status) =>{
  const json = {
    "error" : ""
  }
  switch(status)
  {
    case 1:
    json.error = "Problème syntax"
      break
    case 5:
    json.error = "Sqlite est occupé"
      break
    case 19:
    json.error = "Essaie de mettre une valeur unique dans la base"
  }
  return json
}


exports.valid = valid
exports.unvalid = unvalid
exports.databasefail = databasefail
