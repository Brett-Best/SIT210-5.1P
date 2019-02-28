import Foundation
import SwiftyGPIO

let gp: GPIO = {
  let gpios = SwiftyGPIO.GPIOs(for: .RaspberryPi3)
  
  guard let gp = gpios[.P4] else {
    fatalError()
  }
  
  return gp
}()

signal(SIGINT) { _ in
  gp.value = 0
  print("Blinker Finished")
  exit(0)
}

gp.direction = .OUT


import SwiftGtk

let app = Application(applicationId: "com.example.application")
app.run { window in
  window.title = "Hello World"
  window.defaultSize = Size(width: 400, height: 400)
  window.resizable = true
  
  let button = Button(label: "Press Me")
  button.clicked = { _ in
    let newWindow = Window(windowType: .topLevel)
    newWindow.title = "Just a window"
    newWindow.defaultSize = Size(width: 200, height: 200)
    let labelPressed = Label(text: "Oh, you pressed the button.")
    newWindow.add(labelPressed)
    
    newWindow.showAll()
  }
  
  window.add(button)
}

repeat {
  gp.value = (gp.value == 0) ? 1 : 0
  Thread.sleep(forTimeInterval: 0.25)
} while (true)
