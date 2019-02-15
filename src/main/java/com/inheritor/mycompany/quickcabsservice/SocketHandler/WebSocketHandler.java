package com.inheritor.mycompany.quickcabsservice.SocketHandler;

import com.inheritor.mycompany.quickcabsservice.NotifiactionService.NotificationThread;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

/**
 * Created by chathura on 8/31/2018.
 */
public class WebSocketHandler extends TextWebSocketHandler {
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        System.out.println("ClientConnected = " + session);
        NotificationThread instance = NotificationThread.getInstance();
        instance.setSession(session);
        if (!instance.isAlive()) {
            instance.start();
        }else{
            System.out.println("Notification service is alrady started...!");
        }

    }

    @Override
    public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
        System.out.println("disconnected = " + session);
    }
}
