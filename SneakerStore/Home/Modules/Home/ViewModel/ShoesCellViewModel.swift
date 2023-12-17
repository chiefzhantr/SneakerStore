import UIKit

struct ShoesCellViewModel {
    var image: UIImage {
        shoes.image
    }
    
    var title: String {
        shoes.shoesBrand
    }
    
    var subtitle: String {
        shoes.shoesDescription
    }
    
    var price: String {        
        shoes.isAdded ? "1 • $\(shoes.price)" : "$\(shoes.price)"
    }
    
    var actionButtonTitle: String {
        shoes.isAdded ? "Remove" : "Add to cart"
    }
    
    var actionButtonBackgroundColor: UIColor {
        shoes.isAdded ? .black.withAlphaComponent(0.8) : .black
    }
    
    let shoes: Shoes
    
    init(shoes: Shoes) {
        self.shoes = shoes
    }
}
