let port=null;

async function ConnectPort(baudRate) {
    if ("serial" in navigator) {
        if (port != null) {
            DisconnectPort();
        }
        port  = await navigator.serial.requestPort()
        await port.open({ baudRate: baudRate });
        console.log("port open");
        if (!("TextEncoder" in window))
          alert("Sorry, this browser does not support TextEncoder...");
    } else {
        alert("No COM available");
    }
}

async function DisconnectPort() {
    if (port != null && "serial" in navigator) {
        await port.close();
        await port.forget();
        port=null
        console.log("port closed");
        if (!("TextEncoder" in window))
          alert("Sorry, this browser does not support TextEncoder...");
    } else {
        alert("No COM available");
    }
}

async function SendCommand(command) {
    if (port != null && "serial" in navigator) {
        const writer = port.writable.getWriter();
        if (!("TextEncoder" in window))
          alert("Sorry, this browser does not support TextEncoder...");

        var enc = new TextEncoder(); // always utf-8
        //let commandString = command;
        console.log(command);
        console.log(enc.encode("command"));
        const data = enc.encode(command);
        await writer.write(data);
            writer.releaseLock();

//         const textDecoder = new TextDecoderStream();
//         const readableStreamClosed = port.readable.pipeTo(textDecoder.writable);
//         const reader = textDecoder.readable.getReader();
        
//         var start = Date.now();
//         var actual = Date.now();
//         var timeout = 10000;
//         var message = "";
//         var keepReading = true;
//         console.log("start reading")

// //        await sleep(1000);
//         let { done, value } = reader.read();
//         if (value) {
//             message += value.result;
//             console.log(value)
//             console.log(value.valueOf())
//         }

//         if (!message.endsWith("\r\n")) {
//             do {
//                 done, value = reader.read();
//                 if (value) {
//                     message += value.result;
//                     console.log(value)
//                     console.log(value.result)
//                 }
//                 else if (message.length > 0) {
//                     keepReading = false;
//                 }
//                 if (message.endsWith("\r\n")) {
//                     keepReading = false;
//                 }
//                 await sleep(100);
//                 actual = Date.now() - start;
//             } while (keepReading && actual < timeout)
//         }

//         if (actual >= timeout) {
//             console.log("timed out")
//             reader.cancel();
//         }

//         reader.releaseLock();

//         if (message) {
//             console.log(message);
//         }

            readUntilClosed();
    } else {
        alert("No COM available");
    }
    console.log("send finsihed")
}

async function readUntilClosed() {
    let keepReading = true;
    let message = [];

    while (port.readable && keepReading) {
      reader = port.readable.getReader();
      try {
        while (true) {
          const { value, done } = await reader.read();
          if (done) {
            // reader.cancel() has been called.
            break;
          }
          // value is a Uint8Array.
          console.log(value);
          for (let i = 0; i < value.length; i++) {
            message.push(value[i]);
          }
          if (value.includes(10)) {
            keepReading = false;
            break;
          }
        }
      } catch (error) {
        // Handle error...
      } finally {
        // Allow the serial port to be closed later.
        console.log(message);
        var sliced = message.slice(0, message.length-3)
        console.log(sliced);
        var decoded = new TextDecoder().decode(new Uint8Array(sliced));
        console.log(decoded);
        reader.cancel();
        reader.releaseLock();
      }
    }
  }

function sleep(ms) {
    return new Promise(resolve => setTimeout(resolve, ms));
}