import Foundation


enum Verify: String{
    case SpecialChar = "[$&+,:;=?@#|'<>.^*()%!-]"//Tout les caractères spéciaux
    case DoubleNumber = "[0-9].*[0-9]"//Size min de 6 avec 1 Maj et 2 chiffres et 1 caractère spécial
    case Maj = "[A-Z]"
    case Mail = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"//Contenir soit yahoo ou gmail
}

func matchesPassword(pass: String) -> Bool{
    
    if pass.count >= 6 {
        if matches(regex: .DoubleNumber, text: pass){
            if matches(regex: .Maj, text: pass){
                if matches(regex: .SpecialChar, text: pass){
                    return true
                }
            }
        }
    }
    return false
}

func matches(regex: Verify,text: String) -> Bool{
    
    let regex = try! NSRegularExpression(pattern: regex.rawValue)
    let size = NSRange(location: 0, length: text.count)
    let result = regex.matches(in: text,range: size)
    
    return result.count >= 1 ? true : false

}

