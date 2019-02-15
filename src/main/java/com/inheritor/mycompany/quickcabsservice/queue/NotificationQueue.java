package com.inheritor.mycompany.quickcabsservice.queue;

import com.inheritor.mycompany.quickcabsservice.dto.NotificationBean;
import com.inheritor.mycompany.quickcabsservice.dto.NotificationDto;

import java.util.Collections;
import java.util.LinkedList;
import java.util.List;

/**
 * Created by Chathura on 9/23/2018.
 */
public class NotificationQueue {

    private static List<NotificationDto> queue = Collections.synchronizedList(new LinkedList<NotificationDto>());

    public static List<NotificationDto> getQueue() throws Exception {
        synchronized (queue) {
            return queue;
        }
    }

    public static void addNotification(NotificationDto bean) throws Exception {
        synchronized (queue) {
            if (queue.size() == 0) {
                queue.add(bean);
                System.out.println("Add key  queue (NotificationBean) size : " + queue.size());
            } else {
                boolean check = true;
                for (NotificationDto s : queue) {
                    if (s.getOrderid().equals(bean. getOrderid())) {
                        check = false;
                        break;
                    } else {
                        check = true;
                    }
                }
                if (check) {
                    queue.add(bean);
                    System.out.println("Add new key  queue (NotificationBean) size : " + queue.size());
                } else {
                    System.out.println("This Notification is already exist in the queue > notifiation id > " + bean.getOrderid());
                }
            }
        }

    }

    public static void remove(NotificationDto bean) throws Exception {
        synchronized (queue) {
            queue.remove(bean);
        }
    }

    public synchronized static int getSizeOfHubSessionQueue() throws Exception {
        synchronized (queue) {
            return queue.size();
        }
    }
}
