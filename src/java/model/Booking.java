package model;

public class Booking {
    private int bookingId;
    private int customerId;
    private String pickupLocation;
    private String dropoffLocation;
    private String bookingDate; // ✅ Store date as String
    private String status;
    private String vehicleType;
    private double price;

    // Constructor
    public Booking(int bookingId, int customerId, String pickupLocation, String dropoffLocation, String bookingDate, String status, String vehicleType, double price) {
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
        this.bookingDate = bookingDate;
        this.status = status;
        this.vehicleType = vehicleType;
        this.price = price;
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }

    public String getDropoffLocation() { return dropoffLocation; }
    public void setDropoffLocation(String dropoffLocation) { this.dropoffLocation = dropoffLocation; }

    public String getBookingDate() { return bookingDate; }  // ✅ Ensure String type
    public void setBookingDate(String bookingDate) { this.bookingDate = bookingDate; }  

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public String getVehicleType() { return vehicleType; }
    public void setVehicleType(String vehicleType) { this.vehicleType = vehicleType; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }
}
