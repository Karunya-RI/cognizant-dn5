const postList = document.getElementById("post-list");

fetch("https://jsonplaceholder.typicode.com/posts?_limit=5")
  .then(response => response.json())
  .then(posts => {
    posts.forEach(post => {
      const li = document.createElement("li");
      li.textContent = post.title;
      postList.appendChild(li);
    });
  })
  .catch(error => console.error("Error fetching posts:", error));
