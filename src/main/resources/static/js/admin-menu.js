"use strict";
const notice = document.getElementById("notice");
document.getElementById("close-notice").addEventListener("click", () => notice.close());
function inform(title) {
  document.getElementById("notice-title").textContent = title;
  document.getElementById("notice-text").textContent = title === "会員管理" || title === "会員"
    ? "会員一覧（画面ID：7-1-1-4）への接続先です。会員一覧画面は今後実装予定です。"
    : "この機能は今後実装予定です。";
  notice.showModal();
}
document.querySelectorAll(".menu-item").forEach(button => {
  button.addEventListener("click", () => inform(button.querySelector(".mi-label").textContent));
});
document.querySelectorAll('.bottom-nav a[href="#"]').forEach(link => {
  link.addEventListener("click", event => {event.preventDefault(); inform(link.lastChild.textContent.trim());});
});
