public class sleep { 
  public static void main(String[] args) {
    try {
      Thread.sleep(Integer.parseInt(args[0]) * 1000);
    }
    catch (Exception e) {
      System.err.println("Usage: sleep <seconds>");
    }
  }
}

