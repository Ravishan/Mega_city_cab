// Function to validate booking form
function validateBookingForm() {
    let pickupLocation = document.getElementById("pickupLocation").value;
    let dropoffLocation = document.getElementById("dropoffLocation").value;

    if (pickupLocation.trim() === "" || dropoffLocation.trim() === "") {
        alert("Pickup and Dropoff locations are required!");
        return false;
    }

    if (pickupLocation === dropoffLocation) {
        alert("Pickup and Dropoff locations cannot be the same!");
        return false;
    }

    return true;
}

// Attach event listener to the booking form
document.addEventListener("DOMContentLoaded", function () {
    let bookingForm = document.getElementById("bookingForm");
    if (bookingForm) {
        bookingForm.addEventListener("submit", function (event) {
            if (!validateBookingForm()) {
                event.preventDefault(); // Prevent form submission if validation fails
            }
        });
    }
});
