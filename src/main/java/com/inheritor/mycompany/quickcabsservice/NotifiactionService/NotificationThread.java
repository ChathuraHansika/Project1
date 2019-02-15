package com.inheritor.mycompany.quickcabsservice.NotifiactionService;

import com.inheritor.mycompany.quickcabsservice.dto.NotificationBean;
import com.inheritor.mycompany.quickcabsservice.dto.NotificationDto;
import com.inheritor.mycompany.quickcabsservice.queue.NotificationQueue;
import com.inheritor.mycompany.quickcabsservice.util.JSONParser;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;

import java.util.List;

/**
 * Created by Chathura on 9/23/2018.
 */
public class NotificationThread extends Thread {

    private WebSocketSession session;
    private static NotificationThread thread;

    public synchronized void setSession(WebSocketSession session) {
        this.session = session;
    }

    public synchronized WebSocketSession getSession() {
        return session;
    }

    private NotificationThread() {

    }

    public static NotificationThread getInstance() {
        if (thread == null) {
            thread = new NotificationThread();
        }
        return thread;
    }

    @Override
    public void run() {
        while (true){
            try {
                System.out.println("Waiting for notifications...!");
                int sizeOfHubSessionQueue = NotificationQueue.getSizeOfHubSessionQueue();
                if (sizeOfHubSessionQueue > 0) {
                    List<NotificationDto> queue = NotificationQueue.getQueue();

                    for (NotificationDto bean : queue) {
                        getSession().sendMessage(new TextMessage(JSONParser.parse(bean)));
                        NotificationQueue.remove(bean);
                    }
                } else {
                    System.out.println("detected empty notification queue..!");
                }
                Thread.sleep(2000);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }
}
