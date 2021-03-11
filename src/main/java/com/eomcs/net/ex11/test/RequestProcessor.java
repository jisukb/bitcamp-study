package com.eomcs.net.ex11.test;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.net.Socket;

public class RequestProcessor {
  Socket socket;

  public RequestProcessor(Socket socket) {
    this.socket = socket;
  }

  public void service() throws Exception {
    try (Socket socket = this.socket;
        BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
        PrintStream out = new PrintStream(socket.getOutputStream());) {

      sendIntroMessage(out);

      while (true) {
        String request = in.readLine();
        if (request.equalsIgnoreCase("quit")) {
          sendResponse(out, "안녕히 가세요!");
          break;
        }

        String message = compute(request);
        sendResponse(out, message);
      }
    }
  }

  static String compute(String request) {
    try {
      String[] values = request.split(" ");

      int a = Integer.parseInt(values[0]);
      String op = values[1];
      int b = Integer.parseInt(values[2]);
      int result = 0;

      switch (op) {
        case "+": result = a + b; break;
        case "-": result = a - b; break;
        case "*": result = a * b; break;
        case "/": result = a / b; break;
        default:
          return String.format("%s 연산자를 지원하지 않습니다.", op);
      }
      return String.format("결과는 %d %s %d = %d 입니다.", a, op, b, result);

    } catch (Exception e) {
      return String.format("계산 중 오류 발생! - %s", e.getMessage());
    }
  }

  static void sendResponse(PrintStream out, String message) {
    out.println(message);
    out.println();
    out.flush();
  }

  static void sendIntroMessage(PrintStream out) throws Exception {
    out.println("[비트캠프 계산기]");
    out.println("계산기 서버에 오신 걸 환영합니다!");
    out.println("계산식을 입력하세요!");
    out.println("예) 23 + 7");
    out.println();
    out.flush();
  }
}
