#git #tech 

---
# [How to Write a Git Commit Message](https://cbea.ms/git-commit/)

1. [Separate subject from body with a blank line](https://cbea.ms/git-commit/#separate)
2. [Limit the subject line to 50 characters](https://cbea.ms/git-commit/#limit-50)
3. [Capitalize the subject line](https://cbea.ms/git-commit/#capitalize)
4. [Do not end the subject line with a period](https://cbea.ms/git-commit/#end)
5. [Use the imperative mood in the subject line](https://cbea.ms/git-commit/#imperative)
6. [Wrap the body at 72 characters](https://cbea.ms/git-commit/#wrap-72)
7. [Use the body to explain _what_ and _why_ vs. _how_](https://cbea.ms/git-commit/#why-not-how)

# Example
```bash
Summarize changes in around 50 characters or less

More detailed explanatory text, if necessary. Wrap it to about 72
characters or so. In some contexts, the first line is treated as the
subject of the commit and the rest of the text as the body. The
blank line separating the summary from the body is critical (unless
you omit the body entirely); various tools like `log`, `shortlog`
and `rebase` can get confused if you run the two together.

Explain the problem that this commit is solving. Focus on why you
are making this change as opposed to how (the code explains that).
Are there side effects or other unintuitive consequences of this
change? Here's the place to explain them.

Further paragraphs come after blank lines.

 - Bullet points are okay, too

 - Typically a hyphen or asterisk is used for the bullet, preceded
   by a single space, with blank lines in between, but conventions
   vary here

If you use an issue tracker, put references to them at the bottom,
like this:

Resolves: #123
See also: #456, #789
```


---

[[Convention commit in git]]