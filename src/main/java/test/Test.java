package test;

public class Test {
  static class A {
    int a = 100;
    int b = 200;

    void m1() {
      System.out.println("A.m1()");
    }
    void m2() {
      System.out.println("A.m2()");
    }
  }

  static class B extends A {
    int a = 111;
    int c = 222;

    @Override
    void m1() {
      System.out.println("B.m1()");
    }
    void m3() {
      System.out.println("B.m3()");
    }
  }

  public static void main(String[] args) {
    A obj = new B();
    obj.m1();
    obj.m2();
    // obj.m3(); 오류

    B obj2 = (B) obj;
    System.out.println(obj.a);
    System.out.println(obj2.a);
  }
}
