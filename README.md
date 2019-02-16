# Auther
Protect content behind NGINX by using basic authentication. Usernames and passwords can be specified in an environment variable named `USERNAMES`. Each entry is separated by a `;`, and each entry's username and password is separated by a `:`. For example:

```sh
USERNAMES="ted:alpine;susan:debian"
```
