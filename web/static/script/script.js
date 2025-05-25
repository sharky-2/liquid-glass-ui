// ===============================================================
// Auto resize textarea of chat
const textarea = document.getElementById("message-input")
function autoResize() {
  textarea.style.height = 'auto'; 
  textarea.style.height = (textarea.scrollHeight) + 'px';
}
function resetHeight() {
  textarea.style.height = "auto"
}