iOS自定义转子动画—OC&Swift[复制链接]
来自：
JmoVxia
连接
iOS精品博客 http://www.code4app.com/thread-31901-1-1.html
 

项目介绍：
前言开发中经常需要加载数据，这时候就需要一个加载动画，最近写了2个加载动画，希望对大家有所帮助。文章末尾有提供OC和Swift双语的CLDemo下载，代码比较简单，就不详细解析了，Demo中已经进行封装，可以直接使用，这里贴出核心代码。
1.第一个
核心代码
private func initLayer() -> Void {
  let origin_x: CGFloat = frame.size.width * 0.5
  let origin_y: CGFloat = frame.size.height * 0.5
  for item in 0 ..< defaultConfigure.number {            //创建layer 
  let scale: CGFloat = CGFloat(defaultConfigure.number + 1 - item) / CGFloat(defaultConfigure.number + 1)
  let layer: CALayer = CALayer()
  layer.backgroundColor = defaultConfigure.backgroundColor.cgColor
  layer.frame = CGRect.init(x: -5000, y: -5000, width: scale * defaultConfigure.diameter, height: scale * defaultConfigure.diameter)
  layer.cornerRadius = scale * defaultConfigure.diameter * 0.5;            //运动路径
  let pathAnimation: CAKeyframeAnimation = CAKeyframeAnimation.init(keyPath: "position")
  pathAnimation.calculationMode = .paced;
  pathAnimation.fillMode = .forwards;
  pathAnimation.isRemovedOnCompletion = false;
  pathAnimation.duration = (defaultConfigure.duration) - Double((defaultConfigure.intervalDuration) * Double(defaultConfigure.number));
  pathAnimation.beginTime = Double(item) * defaultConfigure.intervalDuration;
  pathAnimation.timingFunction = CAMediaTimingFunction.init(name: .easeInEaseOut)
  pathAnimation.path = UIBezierPath(arcCenter: CGPoint.init(x: origin_x, y: origin_y), radius: (self.frame.size.width - self.defaultConfigure.diameter) * 0.5, startAngle: defaultConfigure.startAngle, endAngle: defaultConfigure.endAngle, clockwise: true).cgPath
  //动画组，动画组时间长于单个动画时间，会有停留效果
  let group: CAAnimationGroup = CAAnimationGroup()
  group.animations = [pathAnimation]
  group.duration = defaultConfigure.duration
  group.isRemovedOnCompletion = false
  group.fillMode = .forwards
  group.repeatCount = MAXFLOAT
  layer.add(group, forKey: "RotateAnimation")
  layerArray.append(layer)
  }    }
复制代码


2.第二个
核心代码
override init(frame: CGRect) {
super.init(frame: frame)
width = frame.size.width 
height = frame.size.height
layer.backgroundColor = configure.outBackgroundColor.cgColor
layer.mask = shapeLayer(lineWidth: configure.outLineWidth, start: 0, end: 1)
animationLayer.frame = layer.bounds
animationLayer.backgroundColor = configure.inBackgroundColor.cgColor
animationLayer.mask = shapeLayer(lineWidth: configure.inLineWidth, start: configure.strokeStart, end: configure.strokeEnd)
layer.addSublayer(animationLayer)
rotationAnimation.fromValue = 0 
rotationAnimation.toValue = Double.pi * 2 
rotationAnimation.repeatCount = MAXFLOAT
rotationAnimation.duration = configure.duration
rotationAnimation.isRemovedOnCompletion = false 
rotationAnimation.fillMode = .forwards
rotationAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
}
复制代码


3.总结核心代码已经贴出，完整代码请查看Demo，为了方便大家学习，这里提供了OC和Swift两种语言分别实现的----->>>CLDemo，如果对你有所帮助，欢迎Star。
