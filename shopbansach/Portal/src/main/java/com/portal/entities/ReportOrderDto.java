package com.portal.entities;

public class ReportOrderDto {
    long delivered;
    long waiting;
    long cancel;

    public long getDelivered() {
        return delivered;
    }

    public void setDelivered(long delivered) {
        this.delivered = delivered;
    }

    public long getWaiting() {
        return waiting;
    }

    public void setWaiting(long waiting) {
        this.waiting = waiting;
    }

    public long getCancel() {
        return cancel;
    }

    public void setCancel(long cancel) {
        this.cancel = cancel;
    }
}
