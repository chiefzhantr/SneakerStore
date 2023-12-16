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
        if shoes.isAdded {
            return "1 • $\(shoes.price)"
        }
        
        return "$\(shoes.price)"
    }
    
    var actionButtonTitle: String {
        if shoes.isAdded {
            return "Remove"
        }
        
        return "Add to cart"
    }
    
    let shoes: Shoes
    
    init(shoes: Shoes) {
        self.shoes = shoes
    }
}
