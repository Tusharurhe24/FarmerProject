function updateRoleIcon() {
    var role = document.getElementById("roleSelect").value;
    var icon = document.getElementById("roleIcon");

    if (role === "farmer") {
        icon.className = "fa-solid fa-tractor"; 
    } else if (role === "buyer") {
        icon.className = "fa-solid fa-shopping-cart"; 
    } else if (role === "admin") {
        icon.className = "fa-solid fa-user-shield"; 
    }
}

