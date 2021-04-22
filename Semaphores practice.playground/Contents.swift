import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

//semaphore.wait(0) - никого не пропускать, пока знач не станет положительным
//semaphore.signal() - даёт +1 поток в даннкю секцию

let queue = DispatchQueue(label: "com.motivation4life", attributes: .concurrent)

let semaphore = DispatchSemaphore(value: 2)

queue.async {
	semaphore.wait(timeout: .distantFuture) //ждем бесконечно, пока не получим сигнал
	Thread.sleep(forTimeInterval: 4)
	print("Block 1")
	semaphore.signal()
}

queue.async {
	semaphore.wait(timeout: .distantFuture) //ждем бесконечно, пока не получим сигнал
	Thread.sleep(forTimeInterval: 2)
	print("Block 2")
	semaphore.signal()
}

queue.async {
	semaphore.wait(timeout: .distantFuture) //ждем бесконечно, пока не получим сигнал
	print("Block 3")
	semaphore.signal()
}

queue.async {
	semaphore.wait(timeout: .distantFuture) //ждем бесконечно, пока не получим сигнал
	print("Block 4")
	semaphore.signal()
}
//так как доступ на 2 потока, то сначался начнут выполняться 1-2, и получится 2,3,4,1
