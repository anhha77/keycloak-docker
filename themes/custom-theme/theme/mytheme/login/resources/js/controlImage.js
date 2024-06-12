window.addEventListener("DOMContentLoaded", () => {
  document.getElementById("kc-login").addEventListener("submit", () => {
    const imgPassword = document.getElementById("img-password");
    console.log(imgPassword);
    imgPassword.style.display = "none";
  });
});
