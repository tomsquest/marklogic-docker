# marklogic-docker

Simplest possible Dockerfile to run a local Marklogic instance.

Ports `8010`/`8011` are opened and a database can be created on them manually or with [Roxy](https://github.com/marklogic/roxy).

Tested with Marklogic 8.0.3 and 8.0.4 


## Usage

1. Download Marklogic's Centos RPM from http://developer.marklogic.com/ (file: `MarkLogic-8.0-4.x86_64.rpm`)
1. Place it in this project directory
1. Build the image with: `docker build -t marklogic:8.0-4 .`
1. Create a container with: `docker run -d --name=marklogic -p 8000:8000 -p 8001:8001 -p 8002:8002 -p 8010:8010 -p 8011:8011 marklogic:8.0-4`
1. Connect to [the admin console on port 8001](http://localhost:8001/)
1. Skip first screen by clicking on `skip`
1. Enter `admin`/`admin` as user/password
1. You're good. 
1. Optionnaly: use Roxy to bootstrap a database on port `8010` (this post is opened by this image)


## Restriction

* Marklogic's license forbids redistribution of its RPM. That's why you have to download the RPM yourself.
* Marklogic's license is free only for experimenting with the solution. If you project is/will be in production, buy a license.


## Credits

Credits go to [Patrick McElwee](https://github.com/patrickmcelwee) for the [initial Dockerfile](https://github.com/patrickmcelwee/marklogic-dependencies)
