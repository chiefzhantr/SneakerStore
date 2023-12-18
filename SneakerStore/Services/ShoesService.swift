import UIKit

// MARK: - ShoesService

final class ShoesService {
    static let shared = ShoesService()
    
    var allShoes = [Shoes]()
    var cartItems = [Shoes]()
    var buyHistory = [Shoes]()
    
    init() {
        self.allShoes = getAllShoes()
    }
    
    func getAllShoes() -> [Shoes] {
        return [
            Shoes(
                image: UIImage(named: "shoes-1")!,
                shoesBrand: "Balenciaga",
                shoesDescription: "Кроссовки Balenciaga\nPhantom",
                price: 1820
            ),
            Shoes(
                image: UIImage(named: "shoes-2")!,
                shoesBrand: "Burberry",
                shoesDescription: "Shoes Burberry",
                price: 551
            ),
            Shoes(
                image: UIImage(named: "shoes-3")!,
                shoesBrand: "Off-White",
                shoesDescription: "Shoes from Virgil Ablo",
                price: 1251
            ),
            Shoes(
                image: UIImage(named: "shoes-4")!,
                shoesBrand: "Adidas Yeezy",
                shoesDescription: "Adidas Yeezy from Kanye West",
                price: 399
            ),
            Shoes(
                image: UIImage(named: "shoes-5")!,
                shoesBrand: "Givenchy",
                shoesDescription: "Shoes from France",
                price: 499
            ),
            Shoes(
                image: UIImage(named: "shoes-6")!,
                shoesBrand: "Nike",
                shoesDescription: "Nike Dunk",
                price: 270
            ),
            Shoes(
                image: UIImage(named: "shoes-7")!,
                shoesBrand: "Nike",
                shoesDescription: "Nike Jordan",
                price: 370
            )
        ]
    }
    
    func addShoesToCart(_ item: Shoes) {
        if let allShoesIndex = allShoes.firstIndex(where: { $0.equals(item) }) {
            allShoes[allShoesIndex].isAdded = true
        }
        
        if let existingItemIndex = cartItems.firstIndex(where: { $0.equals(item) }) {
            cartItems[existingItemIndex].quantity += 1
        } else {
            item.quantity = 1
            cartItems.append(item)
        }
    }
    
    func removeShoesFromCart(_ item: Shoes) {
        guard
            let itemIndex = cartItems.firstIndex(where: { $0.equals(item) }),
            let allShoesIndex = allShoes.firstIndex(where: { $0.equals(item) })
        else {
            return
        }
        
        if cartItems[itemIndex].quantity > 1 {
            cartItems[itemIndex].quantity -= 1
        } else {
            allShoes[allShoesIndex].isAdded = false
            cartItems.remove(at: itemIndex)
        }
    }
}
