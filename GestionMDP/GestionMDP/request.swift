import Foundation

//Faire une meilleur classe avec moins de code

class Request{

    init() {

    }

    func preparePostRequest(url:String,parameters:[String:String]) -> URL{
        var finalUrl = url
        for (index,value) in parameters.enumerated(){
            if index == 0{
                finalUrl += "?\(value.key)=\(value.value)"
            }
            else{
                finalUrl += "&\(value.key)=\(value.value)"

            }

        }
        return URL(string:finalUrl)!
    }

    public func getuserid(pseudo:String) -> Int {
            
        let url = Path.getuserid+pseudo
        var request = URLRequest(url:URL(string: url)!)
        let semaphore = DispatchSemaphore(value: 0)
        var mydata : Userid?
            
       request.httpMethod = "GET"
            
         let task = URLSession.shared.dataTask(with: request){ (data, error, response) in
            
            let responseString = String(data: data!, encoding: .utf8)!.data(using: .utf8)!
            mydata = try! JSONDecoder().decode(Userid.self, from: responseString)
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return mydata!.id
    }

     public func check(parameters:[String:String]) -> Bool{

        let url = self.preparePostRequest(url: Path.check, parameters: parameters)

        var request = URLRequest(url:url)
        let semaphore = DispatchSemaphore(value: 0)
        var mydata : Valid?

        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request){ (data, error, response) in
            //print(String(data: data!, encoding: .utf8)!)

            let responseString = String(data: data!, encoding: .utf8)!.data(using: .utf8)!
            mydata = try! JSONDecoder().decode(Valid.self, from: responseString)
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        return mydata!.info

    }
    
    public func comb(parameters : [String:String]) -> Bool{
        
        let url = self.preparePostRequest(url: Path.combi, parameters: parameters)

        var request = URLRequest(url:url)
        let semaphore = DispatchSemaphore(value: 0)
        var mydata : Valid?

        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request){ (data, error, response) in
            //print(String(data: data!, encoding: .utf8)!)

            let responseString = String(data: data!, encoding: .utf8)!.data(using: .utf8)!
            mydata = try! JSONDecoder().decode(Valid.self, from: responseString)
            semaphore.signal()
        }

        task.resume()
        semaphore.wait()
        return mydata!.info
        
    }

    public func datauser(userid:String) -> Array<Datauser>{

        let url = Path.datauser+userid
        var request = URLRequest(url:URL(string: url)!)
        let semaphore = DispatchSemaphore(value: 0)
        var mydata : Array<DatauserList> = []

        request.httpMethod = "GET"

        let task = URLSession.shared.dataTask(with: request){ (data, error, response) in
            //print(String(data: data!, encoding: .utf8)!)
            let responseString = String(data: data!, encoding: .utf8)!.data(using: .utf8)!
            let json = try! JSONDecoder().decode([DatauserList].self, from: responseString)

            for i in 0 ..< json.count{
                mydata.append(json[i])
            }
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return convertdatauser(datauser: mydata)
    }
    
    private func convertdatauser(datauser:Array<DatauserList>) -> Array<Datauser>{
        var finalList = [Datauser]()
        var tempostruct : Datauser
        
        var website : String,identifiant : String,password : String
        
        
        for i in 0 ..< datauser.count{
            website = datauser[i].Website
            identifiant = datauser[i].Identifiant
            password = datauser[i].Password
            tempostruct = Datauser(Website:website,Identifiant:identifiant,Password:password)
            
            finalList.append(tempostruct)
        }
        
        return finalList
    }


    public func addTodatabase(parameters:[String:String],status:Int) -> Bool{

        let url = (status == 0) ? Path.adduser : Path.addpassword
        let semaphore = DispatchSemaphore(value: 0)
        let newurl = self.preparePostRequest(url: url, parameters: parameters)

        var request = URLRequest(url:newurl)
        var mydata : Valid?

        request.httpMethod = "POST"

        let task = URLSession.shared.dataTask(with: request){ (data, error, response) in
            let responseString = String(data: data!, encoding: .utf8)!.data(using: .utf8)!
            mydata = try! JSONDecoder().decode(Valid.self, from: responseString)
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return mydata!.info


    }


    public func dellTodatabase(parameters:[String:String],status:Int) -> Bool{ //Status 0 -> user 1 -> password

        let url = (status == 0) ? Path.deluser : Path.delpassword
        let semaphore = DispatchSemaphore(value: 0)
        let newurl = self.preparePostRequest(url: url, parameters: parameters)

        var request = URLRequest(url:newurl)
        var mydata : Valid?

        request.httpMethod = "DELETE"

        let task = URLSession.shared.dataTask(with: request){ (data, error, response) in
            let responseString = String(data: data!, encoding: .utf8)!.data(using: .utf8)!
            mydata = try! JSONDecoder().decode(Valid.self, from: responseString)
            semaphore.signal()
        }
        task.resume()
        semaphore.wait()
        return mydata!.info
    }



}

