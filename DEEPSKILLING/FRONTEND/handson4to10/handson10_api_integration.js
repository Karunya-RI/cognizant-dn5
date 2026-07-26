async function fetchStudents() {
  try {
    const response = await fetch("https://jsonplaceholder.typicode.com/users");
    const students = await response.json();
    console.log("Fetched Students:", students.map(s => s.name));
  } catch (error) {
    console.error("Error fetching students:", error);
  }
}

fetchStudents();
