/*
 * Server.java - a simple socket echo server.
 * John Neffenger <john@volano.com>
 */

import java.io.*;
import java.net.*;

/**
 * <p>This class accepts socket connections on the specified port and echoes
 * messages sent to it by clients. Invoke this program from the command line
 * with:</p>
 * <pre>
 * java Server [-p <i>port</i>] [-v]
 * </pre>
 * <p>where:</p>
 * <dl>
 * <dt><code>-p <i>port</i></code></dt>
 * <dd>is the port on which the server accepts connections.
 * The default is 8000.</dd>
 * <dt><code>-v</code></dt>
 * <dd>enables verbose output in which the program prints each message received.
 * The default is no verbose output.</dd>
 * </dl>
 *
 * @version 15 Dec 2001
 * @author John Neffenger &lt;john@volano.com&gt;
 * @see Client
 */

public class Server implements Runnable {
    private static final String USAGE = "Usage: Server [-p port] [-v]";

    private static int     port    = 8000;
    private static boolean verbose = false;

    private Socket           socket;
    private DataInputStream  input;
    private DataOutputStream output;

    /**
     * Creates a connection from a socket.
     * @exception java.io.IOException when an error occurs creating the
     *            connection.
     */

    private Server(Socket socket) throws IOException {
        this.socket = socket;
        this.input  = new DataInputStream(new BufferedInputStream(socket.getInputStream()));
        this.output = new DataOutputStream(new BufferedOutputStream(socket.getOutputStream()));
    }

    /**
     * The body of the server test.
     */

    public void run() {
        try {
            System.out.println("Echoing messages from client ...");
            byte   b    = 0;
            String line = null;
            while (true) {
                line = input.readUTF();
                // We need Java 1.4 for this.
                // if (socket.getOOBInline())
                //     b = input.readByte();
                if (verbose) {
                    String message = b == 0 ? line : b + " - " + line;
                    System.out.println(message);
                }
                output.writeUTF(line);
                output.flush();
            }
        }
        catch (EOFException e) {
            System.err.println("Connection closed by client.");
        }
        catch (IOException e) {
            System.err.println("Error in server: " + e);
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
            if (args[index].equals("-p")) {
                if (++index == args.length)
                    throw new Exception("Missing port number.");
                try {
                    port = Integer.parseInt(args[index]);
                }
                catch (NumberFormatException e) {
                    throw new Exception("Invalid port number: " + e);
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
     *            connection to the client.
     */

    public static void main(String args[]) throws IOException {
        try {
            setOptions(args);
        }
        catch (Exception e) {
            System.err.println(e.getMessage());
            System.err.println(USAGE);
            System.exit(1);
        }
        System.out.println("Creating server socket on port " + port + " ...");
        ServerSocket serverSocket = new ServerSocket(port);
        System.out.println("Accepting connections ...");
        while (true) {
            Socket socket = serverSocket.accept();
            // We need Java 1.4 for this.
            // socket.setOOBInline(true);
            InetAddress address = socket.getInetAddress();
            System.out.println("Connection is from " +
                address.getHostAddress() + " (" + address.getHostName() + ").");
            Server server = new Server(socket);
            Thread thread = new Thread(server);
            thread.start();
        }
    }
}
