# Checkpoint2 Submission

- **COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Soufiane Berni**
- **STUDENT'S NUMBER: 108170218**
- **GITHUB USER_ID: 108170218-myseneca** 
- **TEACHER’S NAME: Atoosa Nasiri**

  
### Table of Contents
- [Part A - Adding Files - Local Repo Workflow](#Part-A---Adding-Files---Local-Repo-Workflow)
- [Part B - Inspecting - Local Repo](#Part-B---Inspecting-Local-Repo)
- [Part C - Creating - Merging Branches](#Part-C---Creating---Merging-Branches)
- [Part D - Git Branching Strategy Review Question](#Part-D---Git-Branching-Strategy-Review-Question)


### Part A - Adding Files - Local Repo Workflow

```bash
$ git add .
$ git status
$ git commit -m "add comment in here"
```
### Part B - Inspecting Local Repo 

`git status` is used to check the status of files in the working directory, which can show all the changes that have been made to the files.
`git log` is used to commit the history of the repository, including details of the author, date, and commit number.

### Part C - Creating Merging Branches 

All the results afer running the command below:

`git log -n 5`

```bash
commit ab2e31fe5ac20b7aded0620d09b2dfef977f06c2 (HEAD -> main)
Author: 108170218-myseneca <sberni@myseneca.ca>
Date:   Fri May 19 19:51:56 2023 -0400

    README.md

commit d1e8b337a13a8c3057390459c992684aa0653ea6 (feat-emojis) 
Author: 108170218-myseneca <sberni@myseneca.ca>
Date:   Fri May 19 18:04:03 2023 -0400

    adds emojis to feat-emojis branch

commit 74cc2d6dea72227fa53c6bd04ff2bfbd833a2378 (origin/main, origin/HEAD)
Author: 108170218-myseneca <sberni@myseneca.ca>
Date:   Fri May 19 11:07:31 2023 -0400

    updated README.md


commit b463e4063968fe7224e68f1568a283cbc405dd60
Author: 108170218-myseneca <sberni@myseneca.ca>
Date:   Fri May 19 09:09:32 2023 -0400

    updates README.md

commit 142f20cca65bdf6f0f66a5e88126b184e45cc29a
Author: soufiane <sberni@myseneca.ca>
Date:   Fri May 19 01:17:16 2023 -0400

    adds footnotes folder
```

### Part D - Git Branching Strategy Review Question 

1
* `The main branch (master)` is a version of the code that is being used by the user. However, can forward automatically all commits that have been made.
* `The develop branch` is used to test and develop the new features before being directed and merging back to the main branch.
  
2
* `Feature/Bugfix branches` which can be used to test and develop the feature before merging it to the main branch.
* `Hotfix branches` The main role of this branch is to fix issues on the main branch, and passing waiting for the next release, and tackle any problems that appear on the main branch.
* `Release branches` is to prepare the release and complete the feature before it is merged into the main branch.
  
3
* `The best practices in working with release branches` Create a separate branch for each release, and test them before merging them to the main branch, also, avoid direct commits and focus on fixing bugs before the release. And merge them back to the main and develop, however, tagging the release a version number to mark a release point.



