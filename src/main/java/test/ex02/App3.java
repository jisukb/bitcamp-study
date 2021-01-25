package test.ex02;

public class App3 {
  public static void main(String[] args) {

    MyClass v1 = new MyClass();
    v1.b = 300;
    System.out.println(v1.b);

    v1 = new MyClass();
    System.out.println(v1.b);

  }
}
