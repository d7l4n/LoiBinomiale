//Méthodes
//afficheParametre(), affiche les paramètres n et p
//afficheParametre(parametre: Parametre), prend une énumération en paramètre soit .n ou .p
//binom(), retourne un dictionnaire de la loi binomiale
//afficheLoiBinomiale(), affiche la loi binomiale
//esperance(), retourne l'éspérance de la loi
//variance(), retourne la variance de la loi
//ecarttype(), retourne l'écart-type de la loi
//afficheEsperance(), affiche l'éspérance
//afficheVariance(), affiche la variance
//afficheEcartType(), affiche l'écart-type

/*
Exemple:

let loi1 = LoiBinomiale(n: 7, p: 0.4)
loi1.afficheLoiBinomiale()
let esperance = loi1.esperance()
loi1.afficheParametres(.n)

*/

import Foundation

func factorielle(n: Int) -> Int{
    var fac: Int = 1
    if n != 0{
        for i in 1...n{
            fac = fac*i
        }
    }else if n == 0{
        fac = 1
    }
    return fac
}

func combinaison(n: Int, k: Int) -> Int{
    let facn = factorielle(n)
    let fack = factorielle(k)
    let facnmoinsk = factorielle((n-k))
    return facn/(fack*facnmoinsk)
}

enum Parametre {
    case n
    case p
}

class LoiBinomiale {
    
    var n: Int
    var p: Double
    
    init(n: Int, p: Double){
        self.n = n
        self.p = p
    }
    
    func afficheParametres(){
        print("n: \(n)")
        print("p: \(p)")
    }
    
    func afficheParametres(parametre: Parametre){
        switch parametre{
            case .n:
                print("n: \(n)")
            case .p:
                print("p: \(p)")
        }
    }
    
    func binom() -> [Int: Double]{
        var loi = [Int: Double]()
        for i in 0...n{
            loi[i] =  Double(combinaison(n, k: i))*pow(p, Double(i))*pow(1-p, Double(n-i))
        }
        return loi
    }
    
    func afficheLoiBinomiale(){
        var c = binom()
        for i in 0...n{
            print("\(i) succès: \(c[i]!)")
        }
    }
    
    func esperance() -> Double {
        return Double(n)*p
    }
    
    func variance() -> Double{
        return Double(n)*p*(1-p)
    }
    
    func ecarttype() -> Double{
        return sqrt(variance())
    }
    
    func afficheEsperance(){
        print("Espérance: \(esperance())")
    }
    
    func afficheVariance(){
        print("Variance: \(variance())")
    }
    
    func afficheEcartType(){
        print("Ecart-type: \(ecarttype())")
    }
    
}
