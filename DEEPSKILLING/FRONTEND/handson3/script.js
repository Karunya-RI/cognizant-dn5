// ES6 features: let/const, arrow functions, template literals
const studentList = document.getElementById("student-list");
const input = document.getElementById("student-input");
const addBtn = document.getElementById("add-btn");

addBtn.addEventListener("click", () => {
  const name = input.value.trim();
  if (name) {
    const li = document.createElement("li");
    li.textContent = `${name}`;
    studentList.appendChild(li);
    input.value = "";
  }
});
