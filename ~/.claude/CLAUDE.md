# Global Instructions

## Work Process and Tracking

We store the context of what we're doing in files so we can track our progress, stop and start at will, and so we can gather notes as we go to make writing pull requests easier. These files should mainly go in a directory called `rheisler/<branchname>/` at the root of the repository we're working in. Any `<branchname>` directory should have hyphens instead of forward slashes in the name, E.G. `feat-blah` instead of `feat/blah`. Files and where they go include:

- `PLAN.md` - the plan to complete the story for that branch.  **`PLAN.md` should go in the root directory, not `rheisler`**
- `pr-notes.md` - anything we want to record for the pull request as we make changes. Typically things we need to tell reviewers to give them context.
- `PR-review-<PR_NUMBER>.md` - the output of any pull request review I ask you to do. Make sure to put this file in a directory matching the branch the PR is pulling from, even if that branch is not currently checked out.
- analysis files - `rheisler/<branchname>/analysis/<name>.md` where name is a very-short, hyphen-separated description of what you analyzed - These are files I ask you to write analyzing something about what we're working on. If there lots of files generated for a given analysis, they should go in their own subdirectory named for analysis that generated them.
- image files - `rheisler/<branchname>/images/<index>-<name>`. When I paste an image into your prompt, first write it to this file path. `index` is a 2-digit number indicating the order in which I gave you images for this branch. It starts at "01" and increments for each image I provide. `name` is a very short description of the image. Use whatever file extension makes sense to use.

## Tool Use

It takes a lot of effort for me to approve your actions, so I want you to use the actions you are allowed first.

When reading or doing anything that doesn't involve writing or editing, always use purpose-built readonly commands whenever possible, rather than commands that could be used to read _or_ write. Examples include:
- Use your built-in Read tool instead of Bash with `cat`
- When accessing GitHub, use `gh pr list`, `gh issue view`, and other readonly commands, rather than `gh api`

When writing or editing files, always use your built-in Write and Edit tools when possible.

### Running Terminal Commands

When you do want to run a terminal command and you ask for permission to run it, give a brief explanation of what you're doing so it's easy for me to understand.

Do not summarize a command as "Run shell command," explain what the shell command will do.

## Planning

When asked to make a plan:
1. Read the Github issue, if provided
2. Research the codebase as needed to understand the context in which the work will be done
3. Ask the user for any information you need to make the plan
4. Write the plan to the plan file. Plans should have:
- A main heading describing the work to be done and context
- A link to the associated Github issue, if there is one
- A link to the associated Pull Request(s) after they are created
- checkboxes for each step

When planning, consider updating or adding tests to cover **all** functionality you are proposing to create or change.

If you need to understand a dependency of the codebase you're working in, look in `~/development` or https://github.com/dequelabs. I have many of our internal products' repositories in my development folder. The code may be out of date, or I may not have it, in which case you might find what you need in GitHub.

## Execution

When I give you instructions, I usually want you to do something according to our plan for the current branch. Check the plan file and consider how my request relates to it. If it doesn't, take the request at face value.

When you are working on implementing a plan, update the PLAN.md file by checking off the checkboxes of steps you complete as you go.

## Pull Request Review

When I ask you to review a pull request, I want you to generate a document rather than adding comments to a PR on my behalf. Pull request reviews you create should include:
- The first section should be a high-level overview of what the PR does. This should include a step-by-step walkthrough of which files or groups of files I should look at, in which order, to understand the changes.
- A section about what the PR does well that I can use to give positive feedback to the author
- Each of the issues or potential issues you found including specific line numbers for each. Tell me how severe each issue you find is, but don't make recommendations about what should or should not block a merge.
- Any open questions you may have, if you have any

Steps you should follow when writing a PR review:
1. Read the PR itself including the summary and existing comments
2. Read the github issue (usually found in the PR summary)
3. Read and analyze the relevant code files using sub-agents if there are many
4. Generate the initial PR-review file
5. Dispatch a sub-agent to make an editing pass through the PR review file. It should:
    - Consider whether each point is true and relevant and provide evidence for items that are not
    - Check that all cited line numbers are accurate
    - Try to answer open questions
6. Update the PR-review file based on the output of the previous step
7. Ask me for the answers to any remaining questions and update the file based on the answers.

## Code Style

See [./CODE-STYLE.md](./CODE-STYLE.md) for information about:
- General code style
- Testing code style
