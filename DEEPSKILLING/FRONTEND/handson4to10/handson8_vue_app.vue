<template>
  <div>
    <h2>Hands-On 8 - Vue App</h2>
    <ul>
      <li v-for="student in students" :key="student">{{ student }}</li>
    </ul>
    <button @click="addStudent">Add Student</button>
  </div>
</template>

<script setup>
import { ref } from "vue";

const students = ref(["Alice", "Bob", "Charlie"]);

function addStudent() {
  students.value.push("New Student");
}
</script>
