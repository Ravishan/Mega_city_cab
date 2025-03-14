package model;

public class Bill {
    private int billId;
    private int bookingId;
    private double amount;
    private String status;  // Ensure this field exists

    // Constructor
    public Bill(int billId, int bookingId, double amount, String status) {
        this.billId = billId;
        this.bookingId = bookingId;
        this.amount = amount;
        this.status = status;
    }

    // Getters
    public int getBillId() {
        return billId;
    }

    public int getBookingId() {
        return bookingId;
    }

    public double getAmount() {
        return amount;
    }

    public String getStatus() {  // Ensure this method exists
        return status;
    }

    // Setters (if needed)
    public void setStatus(String status) {
        this.status = status;
    }
}

