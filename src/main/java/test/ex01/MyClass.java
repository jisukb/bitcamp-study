package test.ex01;

public class MyClass {
  // 클래스 로딩?
  // - 클래스를 사용하기 위해 외부 저장 장치에서 읽어와서
  //   내부 메모리에 배치하는 것.
  // 클래스가 로딩 될 때 생성된다.
  static int a = 1; // 스태틱 필드 클래스가 로딩 된 후 자동으로 이 명령은 수행된다.

  int b = 10; // 인스턴스 필드 new 명령을 실행할 때 이 명령은 수행된다.

  static void m() {
    int c = 100; // 로컬 변수 메서드가 호출될 때 이 명령은 실행된다.
    System.out.println(c);
  }
}
