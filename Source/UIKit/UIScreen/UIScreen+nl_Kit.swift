//
//  UIScreen+nl_Kit.swift
//  forums
//
//  Created by nathan@hoomic.com on 16/9/7.
//  Copyright © 2016年 hoomic. All rights reserved.
//

import UIKit

extension UIScreen {
  var nl_width : CGFloat {return self.bounds.width}
  var nl_height: CGFloat {return self.bounds.height}
  
  static var nl_width : CGFloat {return self.main.nl_width}
  static var nl_height: CGFloat {return self.main.nl_height}
}
