import UIKit

class Shoes {
    private let id: String
    public let image: UIImage
    public let shoesBrand: String
    public let shoesDescription: String
    public let price: Int
    public var quantity: Int
    public var isAdded: Bool
    
    init(image: UIImage, shoesBrand: String, shoesDescription: String, price: Int) {
        self.id = UUID().uuidString
        self.image = image
        self.shoesBrand = shoesBrand
        self.shoesDescription = shoesDescription
        self.price = price
        self.quantity = 0
        self.isAdded = false
    }
    
    public func equals(_ shoes: Shoes) -> Bool {
        return self.id == shoes.id
    }
}
