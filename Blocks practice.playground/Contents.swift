import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

// DispatchWorkItem - тот же closure, но с доп функционалом (остановить, отменить, пауза и пр)

let dispatchWorkItem = DispatchWorkItem(qos: .utility, flags: .detached) {
	print("performing workitem")
}

let queue = DispatchQueue(label: "com.motivation4life", qos: .utility, attributes: .concurrent, autoreleaseFrequency: .workItem, target: DispatchQueue.global(qos: .userInitiated))

queue.asyncAfter(deadline: .now() + 3, execute: dispatchWorkItem)

dispatchWorkItem.notify(queue: queue) {
	print("workItem is completed!")
}

dispatchWorkItem.isCancelled
dispatchWorkItem.cancel()
dispatchWorkItem.isCancelled

dispatchWorkItem.wait()
