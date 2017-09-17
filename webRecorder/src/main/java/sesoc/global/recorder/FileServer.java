package sesoc.global.recorder;

import java.net.ServerSocket;
import java.net.Socket;
import java.io.*;

public class FileServer implements Runnable{
    private final int PORT = 25573;

    public static void main(String[] args) {
        new Thread(new FileServer() ).start();
    }

    public void run() {
        ServerSocket s = null;
        try {
            s = new ServerSocket(PORT);
        }
        catch (IOException e) {
            e.printStackTrace();
        }

        while (s != null) {
            try {
            	System.out.println("클라이언트 대기중...");
                Socket client = s.accept();
                System.out.println("접속한 client는 " + client.getInetAddress());
                new Thread(new FileServerClient(client) ).start();
            }
            catch (IOException e) {
                e.printStackTrace();
            }
        }
    }

    static class FileServerClient implements Runnable {
        private Socket socket;

        FileServerClient( Socket s) {
            socket = s;
        }

        public void run() {
            try {
                BufferedOutputStream out = new BufferedOutputStream( socket.getOutputStream() );
                FileInputStream fileIn = new FileInputStream( "C:/170821/test111.txt");
                byte[] buffer = new byte[8192];
                int bytesRead =0;
                while ((bytesRead = fileIn.read(buffer)) > 0) {
                    out.write(buffer, 0, bytesRead);
                }
                out.flush();
                out.close();
                fileIn.close();

            }
            catch (IOException e) {
                e.printStackTrace();
            }
            finally {
                try {
                    socket.close();
                }
                catch (IOException e) {
                    e.printStackTrace();
                }
            }

        }
    }
}

