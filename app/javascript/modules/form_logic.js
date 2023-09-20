document.addEventListener("DOMContentLoaded", function() {
    // 今日の日付を取得
    let today = new Date();
    let formattedDate = `${today.getFullYear()}年${today.getMonth() + 1}月${today.getDate()}日`;

    // 日付をヘッダーにセット
    document.getElementById("currentDate").textContent = formattedDate;

   let closeButton = document.getElementById("closeButton");
closeButton.addEventListener("click", function() {
document.querySelector("form").style.display = "none"; // ".centered-container"から"form"に変更
});
});