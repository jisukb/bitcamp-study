package test.ex02;

public class App2 {
  public static void main(String[] args) {

    MyClass v1 = new MyClass();
    System.out.println(v1.b);

    MyClass v2 = v1;

    v2.b = 222;

    System.out.println(v1.b);

    // v1 과 v2는 스택에 저장된 로컬 변수
    // 200 과 222는 힙에 저장된 인스턴스 변수

  }
}
