import UIKit

// MARK: - Queues, порядок определения задачи в очередь
// 1. Определяем очередь, в которую хотим отправить задание
// DispatchQueue.global() / DispatchQueue.main / DispatchQueue()
// 2. Определяем приоритет очереди
// .unspecified .background .utility .default .userInitiated(немного подождать) .userInteractive (немедленно)
// 3. Определяем синхронно или асинхронно добавить задачу
// .sync / .async

/*
Serial Queue, последовательная очередь
Concurrent Queue - согласованная очередь, задачи начинаются последовательно, но выполняться могут параллельно в любом потоке (.high .default .low .background), пока есть задачи выше приоритета - следующие не начнутся
main queue (Serial Queue) - загрузка только пользовательского интерфейса

global queue

*/
// MARK: - QoS определение приоритета очереди
/*
.unspecified .background .utility .default .userInitiated(немного подождать) .userInteractive (немедленно)
*/
// MARK: - sync / async

let queue = DispatchQueue(label: "nameQueue", qos: .utility , attributes: <#T##DispatchQueue.Attributes#>, autoreleaseFrequency: <#T##DispatchQueue.AutoreleaseFrequency#>, target: <#T##DispatchQueue?#>)
