/*
 * Client.java - a socket client that sends urgent data to the server.
 * John Neffenger <john@volano.com>
 */

import java.io.*;
import java.net.*;

/**
 * <p><b>Note:</b> This class must be compiled and run with Java version 1.4 or
 * later.</p>
 * <p>This class reproduces a denial of service attack by sending urgent data.
 * It connects to a server on the specified host and port and then exchanges
 * messages with the server, checking that each message returned is identical to
 * the one sent. Each message sent is followed by an urgent data byte. Invoke
 * this program from the command line with:</p>
 * <pre>
 * java Client [-h <i>host</i>] [-p <i>port</i>] [-n <i>number</i>] [-c <i>count</i>] [-v]
 * </pre>
 * <p>where:</p>
 * <dl>
 * <dt><code>-h <i>host</i></code></dt>
 * <dd>is the name of the host where the server is running.
 * The default is <i>localhost</i>.</dd>
 * <dt><code>-p <i>port</i></code></dt>
 * <dd>is the port on which the server accepts connections.
 * The default is 8000.</dd>
 * <dt><code>-n <i>number</i></code></dt>
 * <dd>is the number of simultaneous clients to create.
 * The default is 1.</dd>
 * <dt><code>-c <i>count</i></code></dt>
 * <dd>is the count of messages each client sends.
 * The default is 10.</dd>
 * <dt><code>-v</code></dt>
 * <dd>enables verbose output in which the program prints each message received.
 * The default is no verbose output.</dd>
 * </dl>
 *
 * @version 15 Dec 2001
 * @author John Neffenger &lt;john@volano.com&gt;
 * @see Server
 */

public class Client implements Runnable {
    private static final String USAGE = "Client [-h host] [-p port] [-n numberClients] [-c messageCount] [-v]";
    private static final int INTERVAL = 1000;

    private static String  host    = "localhost";
    private static int     port    = 8000;
    private static int     number  = 1;
    private static int     count   = 10;
    private static boolean verbose = false;

    private int              id;
    private Socket           socket;
    private DataInputStream  input;
    private DataOutputStream output;

    /**
     * Creates a connection given a host name and port number.
     * @exception java.io.IOException when an error occurs creating the
     *            connection.
     */

    private Client(int id) throws IOException {
        this.id = id;
        socket = new Socket(host, port);
        input  = new DataInputStream(new BufferedInputStream(socket.getInputStream()));
        output = new DataOutputStream(new BufferedOutputStream(socket.getOutputStream()));
    }

    /**
     * The body of the client test.
     */

    public void run() {
        String outText;
        String inText;
        try {
            System.out.println(id + ": Sending messages to server ...");
            long start = System.currentTimeMillis();
            for (int i = 1; i <= count; i++) {
                outText = "This is message " + i + " from client " + id + ".";
                output.writeUTF(outText);
                output.flush();
                // We need Java 1.4 to send urgent data.
                socket.sendUrgentData(i);
                inText = input.readUTF();
                if (! inText.equals(outText))
                    throw new Exception(id + ": Error in string returned by server.");
                if (i % INTERVAL == 0)
                    System.out.println(id + ": " + i + " messages so far ...");
                if (verbose)
                    System.out.println(id + ": " + inText);
            }
            long   stop = System.currentTimeMillis();
            double time = (double) (stop - start) / 1000.0d;
            float  msgsPerSecond = (float) (count / time);
            System.out.println(id + ": Count      = " + count + " messages.");
            System.out.println(id + ": Total time = " + time + " seconds.");
            System.out.println(id + ": Throughput = " + msgsPerSecond + " messages per second.");
        }
        catch (Exception e) {
            System.err.println(id + ": " + e);
        }
        finally {
            try {
                input.close();
                output.close();
                socket.close();
            }
            catch (IOException e) {}
        }
    }

    /**
     * Reads the command arguments and sets the static option variables.
     * @param args the command line arguments.
     * @exception java.lang.Exception when an error occurs parsing the options.
     */

    private static void setOptions(String[] args) throws Exception {
        int index = 0;
        while (index < args.length) {
            if (args[index].equals("-h")) {
                if (++index == args.length)
                    throw new Exception("Missing host name.");
                host = args[index];
            }
            else if (args[index].equals("-p")) {
                if (++index == args.length)
                    throw new Exception("Missing port number.");
                try {
                    port = Integer.parseInt(args[index]);
                }
                catch (NumberFormatException e) {
                    throw new Exception("Invalid port number: " + e);
                }
            }
            else if (args[index].equals("-n")) {
                if (++index == args.length)
                    throw new Exception("Missing number of clients.");
                try {
                    number = Integer.parseInt(args[index]);
                }
                catch (NumberFormatException e) {
                    throw new Exception("Invalid number of clients: " + e);
                }
            }
            else if (args[index].equals("-c")) {
                if (++index == args.length)
                    throw new Exception("Missing message count.");
                try {
                    count = Integer.parseInt(args[index]);
                }
                catch (NumberFormatException e) {
                    throw new Exception("Invalid message count: " + e);
                }
            }
            else if (args[index].equals("-v"))
                verbose = true;
            else
                throw new Exception("Unrecognized option: " + args[index]);
            index++;
        }
    }

    /**
     * Reads the command arguments and starts the test.
     * @param args the command line arguments.
     * @exception java.io.IOException when an error occurs creating the
     *            connection to the server.
     */

    public static void main(String[] args) throws IOException {
        try {
            setOptions(args);
        }
        catch (Exception e) {
            System.err.println(e.getMessage());
            System.err.println(USAGE);
            System.exit(1);
        }
        System.out.println("Connecting to server ...");
        for (int i = 1; i <= number; i++) {
            Client client = new Client(i);
            Thread thread = new Thread(client);
            thread.start();
        }
    }
}
