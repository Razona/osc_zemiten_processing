import oscP5.*;
import netP5.*;

OscP5 oscP5;
NetAddress myRemoteLocation;

//ポートは10000で
int receivePort = 10000;


//ipアドレスは現場で確認
String sendIP = "127.0.0.1";
int sendPort = 9000;

void setup() {
  size(400,400);
  frameRate(25);
  /* start oscP5, listening for incoming messages at port 12000 */
  oscP5 = new OscP5(this,receivePort);

  /* myRemoteLocation is a NetAddress. a NetAddress takes 2 parameters,
   * an ip address and a port number. myRemoteLocation is used as parameter in
   * oscP5.send() when sending osc packets to another computer, device,
   * application. usage see below. for testing purposes the listening port
   * and the port of the remote location address are the same, hence you will
   * send messages back to this sketch.
   */
  myRemoteLocation = new NetAddress(sendIP,sendPort);
}


void draw() {
  background(0);
  text(theOscMessage,100,100);
}


/* incoming osc message are forwarded to the oscEvent method. */
void oscEvent(OscMessage theOscMessage) {
  /* print the address pattern and the typetag of the received OscMessage */
  print("### received an osc message.");
  print(" addrpattern: "+theOscMessage.addrPattern());
  println(" typetag: "+theOscMessage.typetag());

  theOscMessage.print();
}
