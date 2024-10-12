//
//  Extension.swift
//  ChimeiWrapApp
//
//  Created by admin on 2019/11/28.
//  Copyright © 2019 robert. All rights reserved.
//

import Foundation
import UIKit



extension UIImageView {
    func downloaded(from url: URL, contentMode mode: ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    func downloaded(from link: String, contentMode mode: ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}


extension UIButton {
    func setImageAboveTitle(image: UIImage?, title: String, titleColor: UIColor = .black, font: UIFont = .systemFont(ofSize: 14)) {
        self.setImage(image, for: .normal)
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = font
        self.titleLabel?.textAlignment = .center
        
        // 調整圖片和標題的位置
        self.contentVerticalAlignment = .center
        self.contentHorizontalAlignment = .center
        
        // 確保圖片和文字之間有適當的間距
        let spacing: CGFloat = 8.0
        self.titleEdgeInsets = UIEdgeInsets(top: spacing, left: -self.imageView!.frame.size.width, bottom: -self.imageView!.frame.size.height, right: 0)
        self.imageEdgeInsets = UIEdgeInsets(top: -self.titleLabel!.intrinsicContentSize.height - spacing, left: 0, bottom: 0, right: -self.titleLabel!.intrinsicContentSize.width)
    }
}


extension UIColor {
    convenience init(hexString: String) {
        let hex = hexString.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int = UInt64()
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
    }
    
    func UIColorFromRGB(rgbValue: UInt) -> UIColor {
        return UIColor(
            red: CGFloat((rgbValue & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgbValue & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgbValue & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }

}

extension UIView {
    
    //MARK: getter
    func getTop() -> CGFloat {
        return self.frame.origin.y
    }
    
    func getBottom() -> CGFloat {
        return self.frame.size.height + self.frame.origin.y
    }
    
    func getLeft() -> CGFloat {
        return self.frame.origin.x
    }

    func getRight() -> CGFloat {
        return self.frame.origin.x + self.frame.size.width
    }

    func getWidth() -> CGFloat {
        return self.frame.size.width
    }

    func getHeight() -> CGFloat {
        return self.frame.size.height
    }

    //MARK: setter
    func setAlignToTop(offset:CGFloat) {
         self.frame = CGRect(x: self.getLeft(), y: offset, width: self.getWidth(), height: self.getHeight())
    }

    func setAlignToLeft(offset:CGFloat) {
         self.frame = CGRect(x: offset, y: self.getTop(), width: self.getWidth(), height: self.getHeight())
    }

    func setAlignToRight(offset:CGFloat) {
         self.frame = CGRect(x: self.superview!.getWidth() - self.getWidth() - offset, y: self.getTop(), width: self.getWidth(), height: self.getHeight())
    }

    func setAlignToBottom(offset:CGFloat) {
        self.frame = CGRect(x: self.getLeft(), y: self.superview!.getHeight() - self.getHeight() - offset, width: self.getWidth(), height: self.getHeight())
    }

    func setWidth(width:CGFloat) {
        self.frame = CGRect(x: self.getLeft(), y: self.getTop(), width: width, height: self.getHeight())
    }

    func setHeight(hei:CGFloat) {
        self.frame = CGRect(x: self.getLeft(), y: self.getTop(), width: self.getWidth(), height: hei)
    }

    func setTop(top:CGFloat) {
        self.frame = CGRect(x: self.getLeft(), y: top, width: self.getWidth(), height: self.getHeight())
    }
    
    func setLeft(left:CGFloat) {
        self.frame = CGRect(x: left, y: self.getTop(), width: self.getWidth(), height: self.getHeight())
    }

    
    //MARK: margin
    
    func setMarginAll(offset:CGFloat) {
        self.frame = CGRect(x: self.getLeft() + offset, y: self.getTop() + offset, width: self.getWidth() - offset * 2, height: self.getHeight() - offset * 2)
    }

    func setMargin(left:CGFloat , right:CGFloat , top:CGFloat , bottom:CGFloat ) {
        self.frame = CGRect(x: self.getLeft() + left, y: self.getTop() + top, width: self.getWidth() - right * 2 , height: self.getHeight() - top - bottom)
    }

    func setFitSuperView() {
        self.frame = CGRect(x: 0, y: 0, width: superview!.getWidth(), height: superview!.getHeight())
    }
    

    func setFitSuperViewWidth() {
        self.frame = CGRect(x: self.getLeft(), y: self.getTop(), width: superview!.getWidth() - self.getLeft(), height: self.getHeight())
    }

    
    //MARK: Layer
    
    func cornored() {
        self.layer.cornerRadius = 5
    }

    func cornored(radius:CGFloat) {
        self.layer.cornerRadius = radius
    }

    func cornorAndShadow() {
        self.layer.cornerRadius = 5
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }
    
    func cornorAndShadow(radius:CGFloat) {
        self.layer.cornerRadius = radius
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }

    
    func shadow() {
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOpacity = 0.3
        self.layer.shadowRadius = 3
        self.layer.shadowOffset = CGSize(width: 2.0, height: 2.0)
    }

    
    func border(color:UIColor) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = 1.5
    }

    func border(color:UIColor,width:CFloat) {
        self.layer.borderColor = color.cgColor
        self.layer.borderWidth = CGFloat(width)
    }


   
}

extension UITextView {
    func setPartWordBold(text:NSString, words:[String]){
        
        let attributedString = NSMutableAttributedString(string: text as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: 20.0)])
        
        let boldFontAttribute = [NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: 25.0)]
        
        for item in words {
            attributedString.addAttributes(boldFontAttribute, range: text.range(of: item))            
        }
        self.attributedText =  attributedString
    }
}

extension NSString {
    func getColorAttrString(size:CGFloat , color:UIColor , words:[String]) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: size)])
        let attr = [NSAttributedString.Key.foregroundColor:color]
        for item in words {
            attributedString.addAttributes(attr, range: self.range(of: item))            
        }
        return attributedString
    }
    
    func getColorAttrString(size:CGFloat , colors:[UIColor] , words:[String]) -> NSMutableAttributedString {
        let attributedString = NSMutableAttributedString(string: self as String, attributes: [NSAttributedString.Key.font:UIFont.systemFont(ofSize: size)])
//        let attr = [NSAttributedString.Key.foregroundColor:color]
//        for item in words {
//            attributedString.addAttributes(attr, range: self.range(of: item))            
//        }
        for i in 0 ..< words.count {
            let item  = words[i]
            let color  = colors[i]
            let attr = [NSAttributedString.Key.foregroundColor:color]
            attributedString.addAttributes(attr, range: self.range(of: item))            
        }
        return attributedString
    }

}

extension UIImage {
    
    func resizeImage(maxLength:Float) -> UIImage {
        var actualHeight:Float = Float(self.size.height);
        var actualWidth:Float = Float(self.size.width);
        let maxHeight:Float = maxLength;
        let maxWidth:Float = maxLength;
        var imgRatio:Float = actualWidth / actualHeight;
        let maxRatio:Float = maxWidth / maxHeight;
        let compressionQuality:Float = 0.5;//50 percent compression
        
        if (actualHeight > maxHeight || actualWidth > maxWidth)
        {
            if(imgRatio < maxRatio)
            {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight;
                actualWidth = imgRatio * actualWidth;
                actualHeight = maxHeight;
            }
            else if(imgRatio > maxRatio)
            {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth;
                actualHeight = imgRatio * actualHeight;
                actualWidth = maxWidth;
            }
            else
            {
                actualHeight = maxHeight;
                actualWidth = maxWidth;
            }
        }
        
//        let rect  = CGRect(x: 0, y: 0, width: Int(actualWidth), height: Int(actualHeight))

        let rect = CGRect(x: 0, y: 0, width: CGFloat(actualWidth), height: CGFloat(actualHeight))
//        CGRect()
        UIGraphicsBeginImageContext(rect.size);
//        [image drawInRect:rect];
        self.draw(in: rect)
        let img:UIImage = UIGraphicsGetImageFromCurrentImageContext()!;
        let imageData:Data = img.jpegData(compressionQuality: CGFloat(compressionQuality))!;
        UIGraphicsEndImageContext();
        
        let imageSize: Int = imageData.count
        print("resize image is ", Double(imageSize) / 1000.0 , " KB")   
        
        return UIImage.init(data: imageData)!;

    }
    
    func getBase64String() -> String! {
        guard let imageData = self.pngData() else { return "" }
        return imageData.base64EncodedString(options: Data.Base64EncodingOptions.lineLength64Characters)
    }

    func imageWithBackground(color: UIColor, opaque: Bool = true) -> UIImage {
        UIGraphicsBeginImageContextWithOptions(size, opaque, scale)

        guard let ctx = UIGraphicsGetCurrentContext() else { return self }
        defer { UIGraphicsEndImageContext() }

        let rect = CGRect(origin: .zero, size: size)
        ctx.setFillColor(color.cgColor)
        ctx.fill(rect)
        ctx.concatenate(CGAffineTransform(a: 1, b: 0, c: 0, d: -1, tx: 0, ty: size.height))
        ctx.draw(cgImage!, in: rect)

        return UIGraphicsGetImageFromCurrentImageContext() ?? self
    }

}

extension UINavigationController {
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vc, animated: animated)
        }
    }
}

