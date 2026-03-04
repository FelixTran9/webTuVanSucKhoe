document.getElementById("consultationForm").addEventListener("submit", function(event) {
    event.preventDefault();
    
    const name = document.getElementById("name").value;
    const email = document.getElementById("email").value;
    const message = document.getElementById("message").value;
    
    if (name && email && message) {
        document.getElementById("responseMessage").textContent = "✅ Yêu cầu tư vấn đã được gửi! Chúng tôi sẽ liên hệ với bạn.";
        this.reset();
    } else {
        document.getElementById("responseMessage").textContent = "⚠️ Vui lòng điền đầy đủ thông tin.";
    }
    
});



