# Checkpoint5 Submission

- **COURSE INFORMATION: CSN400-2234**
- **STUDENT’S NAME: Soufiane Berni**
- **STUDENT'S NUMBER: 108170218**
- **GITHUB USER ID: 108170218-myseneca**
- **TEACHER’S NAME: Atoosa Nasiri**

### Table of Contents
- [Part A - Containerize an application](#Part-A---Containerize-an-application)
- [Part B - Share the application](#Part-B---Share-the-application)
- [Part C - Persist the DB](#Part-C---Persist-the-DB)
- [Part D - Multi container apps](#Part-D---Multi-container-apps)


### Part A - Containerize an application
- **Question1:** 
Why the build time will be different from first time?

🐳 The build time for the command `docker build -t getting-started .` can differ when executed again due to docker's layer-based architecture. Each instruction in the `Dockerfile` creates a separate layer. If the image is rebuilt without modifying the instructions, `Docker` can reuse the existing layers from the previous build. 

Why the number of steps are also different?

🐳 When rebuilding the image without any changes, `Docker` optimizes the process by reusing the previously built layers. As a result, the number of steps executed is reduced, This optimization speeds up the process, resulting in a faster build time during subsequent image creation.

- **Question2:**
What does `-t ` flag do? 

🐳 The `-t` Stands for "tag" and is used to assign a tag, because when you are building `Docker image`, which provides a unique tag to identify the image that we are creating. However, not using `-t` while creating an image without specefiying the tag the `Docker` will indicate it missing. Here is an example of the error message

```bash
$ docker build getting-started .

ERROR: "docker buildx build" requires exactly 1 argument.
See 'docker buildx build --help'.

Usage:  docker buildx build [OPTIONS] PATH | URL | -     

Start a build
```

- **Question3:**
why still one image listed even we ran the command multiple time?

🐳 Even if we run the command `docker build -t getting-started .` multiple times it still shows only one image listed when running `docker image ls`. This tells us that when building a `Docker Image`, each instruction in the `Dockerfile` creates a new layer. However, `Docker` optimizes the build process by caching intermediate layers that have not changed because we were building image without modifying the instructionsin `Dockefile`.

- **Question4:**
What are the `-d` and `-p` flags?

🐳 The `-d` stands for "detached" mode, which it runs the `Container` in the background and returns the command immediately and allowing to use the terminal for other tasks, However, in this task I have noticed that the `Container` was runing in `Ducker desktop` while i was not able to use the terminal.

🐳 The `-p` flag serves the purpose of specifying port mapping, enabling the establishment of a connection between the ports of a `Container` and those on the host machine. This functionality empowers you to create and configure the necessary communication channels between the `Container` and the host environment, facilitating seamless interaction between the two entities.
 
```bash
$ docker run -p 1000:3000 getting-started

Using sqlite database at /etc/todos/todo.db
Listening on port 3000
...
````

- **Question5:**
Which port in `localhost` must be used to reach it?

🐳 The `Port 1000` is set for accessing the `Container` on `localhost`, because this port has been specifically mapped to the `Container`, which is a direct pathway for communication port. However, the data transmitted to `Port 1000` on the host machine is redirected to the port of the `Container`

- **Question6:** 
What the difference between the `Containers` listed?

🐳 The following `Containers` have been created and mapping to different `Ports` and allow the `Containers` to be accessed using different ports:
- The first `Container` is mapped from the `Port 1000` of the host machine to `Port 3000` of the `Container`
- The second `Container` is mapped from the `Port 3000` of the host machine to `Port 3000` of the `Container`

```bash
$ docker ps

CONTAINER ID   IMAGE             COMMAND                  CREATED          STATUS          PORTS                    NAMES
851b72a88bf3   getting-started   "docker-entrypoint.s…"   2 minutes ago    Up 2 minutes    0.0.0.0:1000->3000/tcp   eloquent_lehmann
5ca4bee41f9c   getting-started   "docker-entrypoint.s…"   50 minutes ago   Up 50 minutes   0.0.0.0:3000->3000/tcp   magical_dubinsky
```

- **Question7:**
How long did it take to create the image after you updated the code?

🐳 Creating the image after updating the code will depend on various factors such as the complexity of the changes, the performance of the `host machine`, and the size of the image. However, the speed of building an image will vary when reusing the existing layers but will not be too long than the initial build.

- **Question8:**
What is the error message you get when you try to run the app container?

🐳 After runing the command `docker run -dp 3000:3000 getting-started` which is attempting an error. However, the error message indicates that the port 3000 is already in use by another `Container` on the host machine.

```bash
$ docker run -dp 3000:3000 getting-started

d764f5f53c7bde09e1c9290be70c948e4eba266c0e14b0aa7c8568857fb00868
docker: Error response from daemon: driver failed programming external connectivity on endpoint silly_montalcini (b80ee2207da7ec15fdaa3534c8c519c5cad8aa8a80e3ff62099d4504dba94df6): Bind for 0.0.0.0:3000 failed: port is already allocated.
```

- **Question9:**
The output of `Todo app` showing the listed items:
- [./Images/Todoapp.JPG](./Images/Todoapp.JPG)
![Todo app](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint5/Images/Todoapp.JPG)

### Part B - Share the application

- [./Images/repopush.JPG](./Images/repopush.JPG)
![Repo push](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint5/Images/repopush.JPG)

- [./Images/Newinstance.JPG](./Images/Newinstance.JPG)
![Image in new Instance](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint5/Images/Newinstance.JPG)

### Part C - Persist the DB
The output of `docker volume inspect todo-db`

```json
$ docker volume inspect todo-db
[
    {
        "CreatedAt": "2023-06-09T15:38:28Z",
        "Driver": "local",
        "Labels":  {},
        "Mountpoint": "/var/lib/docker/volumes/todo-db/_data",
        "Name": "todo-db",
        "Options":  {},
        "Scope": "local"
    }
]
```

### Part D - Multi container apps

The output of `SHOW DATABASES;`
![Show Database](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint5/Images/showdatabase.JPG)

The output of `dig mysql`

```bash
 200655efeaa7  ~  dig mysql

; <<>> DiG 9.18.13 <<>> mysql
;; global options: +cmd
;; Got answer:
;; ->>HEADER<<- opcode: QUERY, status: NOERROR, id: 47651
;; flags: qr rd ra; QUERY: 1, ANSWER: 1, AUTHORITY: 0, ADDITIONAL: 0

;; QUESTION SECTION:
;mysql.                         IN      A

;; ANSWER SECTION:
mysql.                  600     IN      A       172.18.0.2

;; Query time: 0 msec
;; SERVER: 127.0.0.11#53(127.0.0.11) (UDP)
;; WHEN: Fri Jun 09 17:13:29 UTC 2023
;; MSG SIZE  rcvd: 44

 200655efeaa7  ~ 
```

The output of `SELECT * from todo_items;`
![SELECT from Todo](https://github.com/108170218-myseneca/CSN400-Capstone/blob/main/Checkpoint5/Images/selectfromtodo.JPG)





