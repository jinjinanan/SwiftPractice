//
//  BookShelfVM.swift
//  Practice
//
//  Created by admin on 2020/10/12.
//

import Foundation
import RealmSwift
import RxSwift
import RxCocoa


class bookSelfVM: Object {
  

    let savedbook = BehaviorSubject<[Book]>(value: [])
    var disposeBag = DisposeBag()
    
    func requestBookInShelf() {
        provider.rx.request(.test(path:Api_bookStore_free , param: ["":""])).asObservable().mapHandyJsonModel(BasicTypes.self).subscribe {[unowned self] (event) in
            switch event {
            case .next(let element):
                DLog("OK")
                self.savedbook.onNext(element.data ?? [])
            case .error(_):
                DLog("error")
            case .completed:
                DLog("complete")
            }
        }
    }
    
    func testObservable() {
        let number : Observable<Int> = Observable.create { (observer) -> Disposable in
            observer.onNext(0)
            observer.onNext(1)
            observer.onNext(2)
//            一个序列如果发出了 error 或者 completed 事件，那么所有内部资源都会被释放，不需要我们手动释放。
//            当执行销毁时，销毁的是序列和观察者之间的响应关系，不是序列和观察者对象本身
//            如果是加入到disposeBag，是在disposeBag对象销毁时，依次销毁里面存储的东西
//            observer.onCompleted()
            return Disposables.create {
                DLog("销毁释放了")
            }
        }
        
        number.subscribe { (a) in
            DLog(a)
        } onError: { (error) in
            DLog(error)
        } onCompleted: {
            DLog("完成")
        } onDisposed: {
            DLog("销毁回掉")
        }.disposed(by: disposeBag)
    }
}








func testSubject() {
   testBehaviorSubject()
}

func testAsyncSubject() {
    let disposeBag = DisposeBag()
    let subject = AsyncSubject<String>()
    subject
      .subscribe { print("Subscription: 1 Event:", $0) }
      .disposed(by: disposeBag)

    subject.onNext("🐶")
    subject.onNext("🐱")
    subject.onNext("🐹")
    subject.onCompleted()
}

func testBehaviorSubject()
{
    let disposeBag = DisposeBag()
    let subject = BehaviorSubject(value: "🔴")

    subject
      .subscribe { print("Subscription: 1 Event:", $0) }
      .disposed(by: disposeBag)

    subject.onNext("🐶")
    subject.onNext("🐱")

    subject
      .subscribe { print("Subscription: 2 Event:", $0) }
      .disposed(by: disposeBag)

    subject.onNext("🅰️")
    subject.onNext("🅱️")

    subject
      .subscribe { print("Subscription: 3 Event:", $0) }
      .disposed(by: disposeBag)

    subject.onNext("🍐")
    subject.onNext("🍊")
}



