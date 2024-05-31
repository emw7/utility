# psql

Runs psql as a docker app allowing to have multiple version on the same machine.

# Copyright

Copyright 2024 Enrico Maschietto &lt;emw7.github.fraying845@simplelogin.com&gt;

## Licensing

psql is licensed under [Apache License 2.0](../LICENSE)

You must consider all files present in https://github.com/emw7/utility/blob/main/psql contains the following text:

<pre>
Copyright 2024 Enrico Maschietto &lt;emw7.github.fraying845@simplelogin.com&gt;

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

    http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
</pre>

# ChangeLog

[CHANGELOG](./CHANGELOG)

# Installation

In this chapter installtion si done for postgresql 16 into `~/bin` target 
directory and supposing the current directory to the one of the repository has 
been cloned.  
`16.3-alpine3.20` is a string that can be retrieved from [postgres
Docker Official Image site](https://hub.docker.com/_/postgres/tags).

```shell
cp psql ~/bin/
chmod a+x ~/bin/psql
ln -sT psql ~/bin/psql16
sed -e 's/@@VERSION@@/16.3-alpine3.20/1' Dockerfile_template.psql >~/bin/Dockerfile16.psql
```

If it is not already in, add target directory to `PATH` environment variable.

Now to run psql version 16 from the terminal run `psql16 <options>`

# Architecture and design

In this chapter are described the internals of psql.

`psql` is a script that runs psql creating a temporary docker container (docker --rm option) starting from a docker image that contains, at least, the 
[psql - PostgreSQL interactive terminal](https://www.postgresql.org/docs/current/app-psql.html).  

Docker image is create by the script itself. It is created only if it does not already exist.

In order to allow working with files (psql -f option) and standard input the files are copied to a temporary directory that is mounted a container volume. The directory is then deleted when the script terminates (`trap`).

postgres version is get from script name:
- psql10 runs postgresql 10.
- psql16 runs postgresql 16.

If script name is psql then `DEFAULT_PSQL_VERSION` is used and version can be overriden by defining PSQL_VERSION: `PSQL_VERSION=11 psql` runs postgresql 11.  
The magic of the version is not done in the script but using `Dockerfile<version>.psql` that must be in the same directory of the script.  
In order to manage version links to master script must be created:
```shell
ls -l .../psql*
  .../psql
  .../psql10 -> psql
  .../psql15 -> psql
  .../psql16 -> psql
```
In the same directory `Dockerfile<version>.psql` must be present:
```shell
ls -l .../*psql*
  .../Dockerfile10.psql
  .../Dockerfile15.psql
  .../Dockerfile16.psql
```

# TODO

- https://github.com/emw7/litersofmyblood/issues

# Credits

- [psql - PostgreSQL interactive terminal](https://www.postgresql.org/docs/current/app-psql.html)
