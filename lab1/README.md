# LAB 1 - Creating a simple connection between two PostgreSQL's Databases



------------

**Step 1:** Create the source database 

    docker run -d --name postgresSource -p 5666:5432 -e POSTGRES_DB=postgresSource -e POSTGRES_USER=you -e POSTGRES_PASSWORD=yourpassword postgres:16.1
<b></b>
<b></b>

**Step 2:** Create the destination database:

    docker run -d --name postgresDestination -p 5777:5432 -e POSTGRES_DB=postgresDestination -e POSTGRES_USER=you -e POSTGRES_PASSWORD=yourpassword postgres:16.1
<b></b>
<b></b>

**Step 3:** After completing these two steps, you will find both containers in your Docker Desktop, with the Airbyte container already running:

<p align="center">
  <img src="source/images/container-docker-desktop.png" alt="Alt text" title="Optional title" />
</p>

You can also verify in the terminal using the command `docker ps`

<p align="center">
  <img src="source/images/container-docker-terminal.png" alt="Alt text" title="Optional title" />
</p>


After configuring the tools, you can create the Source and Destination in Airbyte by accessing the localhost on port 8000.

<b></b>
<b></b>

**Step 4:** Creating a Airbyte Source

By accessing the Airbyte console, select the Sources option and click + New Source to configure your Postgres database source. Search for the *postgres connector* and start your configure to create a source.

<p align="center">
  <img src="source/images/create-source.png" alt="Alt text" title="Optional title" />
</p>

