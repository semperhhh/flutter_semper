date: 2018-10-07 08:09:04
pid: 19012405;
tag: iOS;

---

# iOS-isa指针

### Objective-c中的isa指针

> 在Objective-c中,任何类的定义都是对象.类和类的实例对象没有任何本质区别.任何对象都有isa指针.

isa指针对于消息分发机制和Cocoa对象的动态能力来说是很关键的.

isa指针类型的数据结构可以在Objc.h中看到:<!--more-->
![图片1](http://olnx80yq4.bkt.clouddn.com/iOS-isa%E6%8C%87%E9%92%88-1.png)
![图片2](http://olnx80yq4.bkt.clouddn.com/iOS-isa%E6%8C%87%E9%92%88-2.png)

可以看到isa是一个class类型的指针,它指向对象的类,在这个结构体里还有一个isa指针,又是一重指向.

这里的isa指针指向的是元类对象.它用来存储类的版本,名字,类方法等信息.

所有的元类对都指向NSObject的元类对象,所以最终还是NSObject.

一共有三次指向:类对象->元类对象->NSObject元类对象.

> 注意的是:元类(meteclass)也是类,它也是对象.元类保存了类方法的列表.当类方法被调用时,先会从本身查找类方法的实现,如果没有,元类会向他父类查找该方法.

第二个成员变量"super_class"指向父类的类对象.

**每一个对象本质上都是一个类的实例.其中类定义了成员变量和成员方法的列表.对象通过对象的isa指针指向类**

### isa指针的应用

isa指针常见于runtime的应用:

1.动态创建一个类.

2.动态地为某个类添加属性\方法,修改属性值\方法.(前面学习过的关联对象).

3.遍历一个类的所有成员变量(属性)\所有方法.

### isa指针经典的图片介绍

<img src="https://blog-1256512148.cos.ap-beijing.myqcloud.com/blog-isa01.png" width=600 align=center>



## KVO的原理

kvo是通过``isa-swizzling``技术实现的,当一个对象注册观察者时,这个对象的isa指针被修改指向一个中间类.

kvo的实现依赖于runtime.

当观察a类型的对象时,在运行时会创建一个集成a类的NSKVONotifying_a类,且为其重写观察实行的setter方法,setter方法会负责在调用原setter方法之前和之后,通知所有观察者属性值的更改情况.

#### 手动触发KVO

* 取消自动触发:重写``+(bool)automaticallyNotifiesObserversForKey:(NSString *)key``
* 重写属性的setter方法根据需求判断是否需要调用``willChangeValueForKey:和didChangeValueForKey:``方法