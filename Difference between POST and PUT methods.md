#tech #note 

---

# [Difference between POST and PUT methods](https://www.theserverside.com/blog/Coffee-Talk-Java-News-Stories-and-Opinions/PUT-vs-POST-Whats-the-difference#:~:text=The%20key%20difference%20between%20PUT,identified%20by%20the%20URL%20provided.)
# [What is the difference between POST and PUT in HTTP](https://stackoverflow.com/questions/630453/what-is-the-difference-between-post-and-put-in-http)

- Name the URL objects you create explicitly, or let the server decide? If you name them then use PUT. If you let the server decide them use POST
- PUT is defined to assume idempotency, so if you PUT and object twice, it should have no additional effect.
- Can update or create a resource with PUT with the same object URLP