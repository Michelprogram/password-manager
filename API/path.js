const mainpath = "/GestionnaireMDP/API"

const Path = {
  check:`${mainpath}/check/`,
  datauser:`${mainpath}/datauser/:userid`,
  delluser:`${mainpath}/deluser/`,
  adduser:`${mainpath}/adduser/`,
  addpassword:`${mainpath}/addpassword/`,
  dellpassword:`${mainpath}/delpassword/`,
  userid:`${mainpath}/userid/:pseudo`,
  comb:`${mainpath}/comb/`

}

exports.Path = Path
