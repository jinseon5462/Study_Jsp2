package websocket;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnError;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

@ServerEndpoint("/ChatingServer")
public class ChatServer {
	//클라이언트의 접속정보를 저장하는 배열
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	
	@OnOpen // 클라이언트 접속 시, 실행
	public void onOpen(Session session) {
		clients.add(session);
		System.out.println("웹 소켓 연결: " + session.getId());
	}
	
	@OnClose //클라이언트와의 연결이 끊어지면 실행
	public void onClose(Session session) {
		clients.remove(session);
		System.out.println("웹소켓 종료 : " + session.getId());
	}
	
	@OnError //에러 발생 시, 실행
	public void onError(Throwable e) {
		System.out.println("에러 발생,,,,,");
		e.printStackTrace();
	}
	
	@OnMessage //메세지를 받으면 실행
	public void onMessage(String message, Session session) throws IOException {
		System.out.println("메세지 전송 : " + session.getId() + ": "+ message);
		synchronized(clients) {
			for(Session client : clients ) {
				if(!client.equals(session)) {
					client.getBasicRemote().sendText(message); // 자신을 제외한 나머지사람에게 메세지를 보냄
				}
			}
		}
	}
}
